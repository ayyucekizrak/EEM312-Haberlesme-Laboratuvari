%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY6:DARBE KOD MODÜLASYONU (PCM-Pulse Code Modulation) 
%A=Kosinüsün genliði 
%fm=Kosinüsin frenkans 
%fs=örnekleme frekansý 
%n= örnek baþýna bit sayýsý 
%MSE=Ortalama Karesel Hata, QNoise=Kuantalama Gürültüsü 
%Bitrate=Bit Kod Uzunluðu %Stepsize=Adým aralýðý 
%------------------------------------------------------ 
%% DÜZGÜN KUANTALAYICI ÝLE DARBE KOD MODÜLASYONU  
clear all 
clc 
A=3; %mesaj iþaretinin genliði 
fm=3; %mesaj iþaretinin frekansý 
fs=20; %örnekleme frekansý 
n=3; %bir kuanta deðerinin kodlanacaðý bit uzunluðu 
t=0:1/(100*fm):1; %zaman ekseninin oluþturulmasý 
x=A*cos(2*pi*fm*t); %analog cos iþareti 
%---Örnekleme----- 
ts=0:1/fs:1; %Örnekleme frekansýna göre ayarlanan zaman ekseni 
xs=A*cos(2*pi*fm*ts); %Analog iþaretin örneklenmiþ hali 
%xs Örneklenmiþ iþaret   
%--Kuantalama--- 
x1=xs+A; x1=x1/(2*A); L=(-1+2^n); % Kuantalama seviyeleri (0'dan baþlamasý için -1 ekledik) 
x1=L*x1; xq=round(x1); %yuvarlama iþlemi sonucu kuantalanmýþ iþaret elde edilir 
r=xq/L; r=2*A*r; r=r-A;   
%----Kodlama--- 
y=[]; 
for i=1:length(xq)     
    d=dec2bin(xq(i),n); % kuantalanmýþ iþareti decimal den binary ye çevirir 
    y=[y double(d)-48]; 
end %hesaplar 
MSE=sum((xs-r).^2)/length(x) 
%ORTALAMA KARESEL HATA 
Bitrate=n*fs 
%BÝT KOD UZUNLUÐU 
Stepsize=2*A/L 
%ADIM UZUNLUÐU 
QNoise=((Stepsize)^2)/12 
%KUANTALAMA GÜRÜLTÜSÜ %GRAFÝKLERÝN ÇÝZDÝRÝLMESÝ 
figure(1)
plot(t,x,'linewidth',2), title('Örneklenmiþ Ýþaret'), ylabel('Genlik'), xlabel('Zaman t(sn)') 
hold on 
stem(ts,xs,'r','linewidth',2) 
hold off 
legend('Orijinal Ýþaret','Örneklenmiþ Ýþaret');   
figure(2) 
stem(ts,x1,'linewidth',2), title('Kuantalama'), ylabel('L Seviye') 
hold on 
stem(ts,xq,'r','linewidth',2) 
plot(ts,xq,'--r') 
plot(t,(x+A)*L/(2*A),'--b') 
grid on 
hold off 
legend('Örneklenmiþ Ýþaret','Kuantalanmýþ Ýþaret');   
figure(3) 
stairs([y y(length(y))],'linewidth',2), title('Kodlama'), ylabel('Ýkili (Binary) Ýþaret'), xlabel('bitler') 
axis([0 length(y) -1 2]) 
grid on 
%% ---------------------------------------------------------  
%% QUANTÝZ fonksiyonunun kullanýlmasýyla PCM tasarýmý 
%% ---------------------------------------------------------  
clear all 
clc 
L=8 %kuantalayýcýnýn seviye sayýsý 
x=wavread('wind.wav'); %ses iþaretinin bir .wav dosyasýndan okut  
%(sizde kayýtlý bir ses dosyasý veya bir mesaj iþaretivile deneyiniz) 
x=x'; %ses iþareti satýr matrisine dönüþtürüyoruz 
figure(1),plot(x),title('Ses Ýþareti'); % ses iþaretinin ekran görüntüsü 
xmax=1; %kuantalayýcý tasarýmý için ses iþaretinin maksimum deðeri  
delta=2*xmax/L; %ortabasamaklý kuantalýyýcýnýn adým aralýðý 
%kuanta parametreleri 
partition=-(L/2-1)*delta:delta:(L/2-1)*delta; %L-1 adet giriþ eþik seviyesi 
codebook=-((L-1)*delta/2):delta:((L-1)*delta/2); %L adet çýkýþ seviyesi %
quantiz komutunun kullanýmý [indx1,xq]=quantiz(x,partition,codebook); %ses iþaretini doðrudan kuantala 
%xq=kuantalanmýþ iþaret 
hata1=x-xq; % sýkýþtýrmasýz ortabasamaklý kuantalayýcý ile örneklenen iþaret için kuantalayýcý hatasý
makshata1=max(abs(hata1)) %maksimum kuantalama hatasý 
xc=compand(xq,87.6,1,'A/compressor'); %A-kuralýna göre ses iþaretinin sýkýþtýrýlmýþ hali 
%iþaretin genel daðýlýmý sýkýþtýrýlmýþ halinde daha düzgündür. 
figure(2), plot(xq), title('Kuantalanmýþ Ses iþareti'); sound(x) %orijinal iþaretin sesi 
sound(xq)%bu satýrý açarsanýz quantalanmýþ iþaretin sesini duyarsýnýz 
sound(xc) %bu satýrý açarsanýz quantalanmýþ ve sýkýþtýrýlmýþ iþaretin sesini duyarsýnýz 
figure(3), plot(xc), title('Kuantalanmýþ ve Sýkýþtýrýlmýþ Ses iþareti'); 
%% ---------------------------------------------------------  
%% Lloyd Max yöntemine göre kuantalama iþlemi 
%% ---------------------------------------------------------  
clear all, 
close all, 
clc; 
L=8; %kuanta seviyeleri 
t = [0:.1:2*pi]; % Sinüs iþaretinin t deðeri 
sig = sin(t); % orijinaliþaret (sinüsoidal) 
%----------------------------------------------------------- 
%Kuantalayýcý parametlerini "lloyds" fonksiyonu ile MATLAB e hesaplatýrýz 
%(ADAPTÝF ADIM ARALIÐI SEÇMEYE YARAR)  
[partition,codebook]=lloyds(sig,L);
%Kuantalayýcý parametreleri 
%-----------------------------------------------------------  
[index,quants] = quantiz(sig,partition,codebook); % Kuantalama iþlemi %kuantalanmýþ iþareti quants deðiþkenine atar. 
% GÖRÜNTÜLERÝN ÇÝZDÝRÝLMESÝ 
figure (1), plot(t,sig,'x',t,quants,'.') 
legend('Orijinal Ýþaret','Kuantalanmýþ Ýþaret'); axis([-.2 7 -1.2 1.2]) 
figure(2), plot(t,sig,'k')  
figure(3), plot(t,quants,'k') 
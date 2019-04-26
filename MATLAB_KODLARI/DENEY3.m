%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY3:SÜREKLÝ VE AYRIK ZAMANLI ÝÞARETLERÝN FOURIER DÖNÜÞÜMÜ 
%% DENEY Öncesi Ek 
%x(t)=3+4cos(2*pi*10*t)+2cos(2*pi*20*t) 
%böyle bir iþaret için Nyquist Kriteri örnekleme frekansýnýn 2 katý %olacaðýndan (iþaretin maksimum frekans bileþeni 20Hz) 40Hz olur 
%----------------------------------------------------------- 
% t=1sn ve örnekleme frekans fs=500Hz iþareti zaman domeni ve frekans domeninde çizimi: 
clear all; 
close all; 
clc 
N=500; 
n=0:N-1;
fs=500;
f1=10; 
f2=20; 
s=N; %n=0,1,2,...,N-1 için x(n) dizisinin deðerlerinin hesaplanmasý 
x=3+cos(2*pi*n*(f1/fs))+cos(2*pi*n*(f2/fs)); %x(n) iþaretinin FOURIER DÖNÜÞÜMÜ (frekans domenine geçmek için) 
Fx=fft(x); 
y=abs(fftshift(Fx)); 
f=-N/2:N/2-1; 
figure 
subplot(2,1,1),plot(n,x),title('x(n)iþaretinin zaman domeninde plot komutuyla çizimi') 
subplot(2,1,2),stem(f,y),title('x(n)iþaretinin frekans domeninde stem komutuyla çizimi') 
%-----------------------------------------------------------   
%% 1 
clear all; 
close all; 
clc 
t=linspace(-1,1,256); %-1 ile 1 aralýðýnda 256 tane deðer üretir ve t deðiþkenine atar 
F=2; 
A=1; 
harmonik=5; 
kare_d=zeros(1,length(t)); 
for k=1:harmonik %girilen harmonik sayýsý kadar cos iþaretine harmonikler eklenerek kare dalgaya yaklaþmaktýr amaç     
    ck=(2*A)/(k*pi)*sin(k*pi/2);     
    kare_d=ck*cos(k*2*pi*F*t)+kare_d; 
end
kare_d=A/2+kare_d; 
figure(1) 
plot(t,kare_d),grid on %grid on fonk. grafiðin arka planýný böler 
title('Simetrik Kare Dalganýn Fourier Serisi'),xlabel('Zaman'), ylabel('Genlik')
 
%% 2.a 
clear all; 
close all; 
clc 
F1=10; %analog iþaretin frekansý 
A1=3; %analog iþaretin genliði   
Fs=50; %örnekleme frekansý   
t=[-1:1/Fs:1]; %örnekleme zamaný -1 ile 1 aralýðýnda 
x1=A1*cos(2*pi*F1*t); %x1 cos iþaretini üretir   
X1=fft(x1); %fft=fast fourier transform, iþaretin fourier dönüþümünü alýr 
abs_X1=abs(X1); %frekans domeninde genlik bilgisi (abs fonksiyonu ile) 
ang_X1=angle(X1);%frekans domeninde açý bilgisi (angle fonksiyonu ile)   
figure(1) 
subplot(2,1,1), stem(abs_X1), grid on 
title('Eksen Düzeni Yapýlmamýþ Genlik Spektrumu');
xlabel('Frekans'), ylabel('Genlik') 
subplot(2,1,2), stem(ang_X1),grid on 
title('Eksen Düzeni Yapýlmamýþ Faz Spektrumu'); 
xlabel('Frekans'), ylabel('Açý') 
% Eksen düzenlemesi (0 ekseninde shift (kaydýrma) yapar) 
Fd=linspace(-Fs/2,Fs/2,length(X1)); %-Fs/2 ile +Fs/2 aralýðýnda X1 in uzunluðunda vektör üretir. 
%lenght komutu ilgili deðiþkenin uzunluk bilgisini alýr 
shf_abs_X1=fftshift(abs_X1); %düzenlenmiþ iþaretin genlik bilgisi 
shf_ang_X1=fftshift(ang_X1); %düzenlenmiþ iþaretin açý bilgisi 
figure(2) 
subplot(2,1,1), stem(Fd,shf_abs_X1), grid on 
title('Eksen Düzeni Yapýlmýþ Genlik Spektrumu'), xlabel('Frekans'), ylabel('Genlik') 
subplot(2,1,2), stem(Fd,shf_ang_X1),grid on 
title('Eksen Düzeni Yapýlmýþ Faz Spektrumu'); xlabel('Frekans'), ylabel('Açý')   
%% 2.b 4 farklý harmonik deðeri için ekran görüntüsü 
clear all; 
close all; 
clc; 
t = linspace(-1,1,256);  
F = 2; A = 1;   
harmonik = [5,10,20,100]; % harmonik deðerlerini bir diziyle ifade edersek 
Adet = length(harmonik); %bu dizinin uzunluðunu Adet deðiþkenine atar   
for sira = 1:Adet %for döngüsünü böylece 4 kez döner           
    kare_d = zeros(1,length(t)); %0 lardan oluþan t'nin uzunluðu kadar bir vektör oluþturur kare_d deðiþkenine atar     
    for k=1:harmonik(sira); %ilgili sýra için fourier katsayýlarýný hesaplar             
        ck = (2*A) / (k*pi) * sin(k*pi/2);             
        kare_d = ck * cos(k*2*pi*F*t) + kare_d;     
    end;       
    kare_d  =A/2 + kare_d; %genlik bilgisini kare_d dizisine (katsayýlara)ekler  
    % grafiði for döngüsü içinde döndürdüðümüz için bir kez plot yaptýk ve  
    % subplot komutunun içinde kaçýncý grafiði çizdireceðimiz kýsma sira diye  
    % tanýmladýðýmýz deðiþkeni atadýk    
    subplot(2,2,sira), plot(t,kare_d), grid on      
    title('Simetrik Kare Dalganýn Fourier Serisi ');     
    xlabel('Zaman'), ylabel('Genlik')      
end; 
%% 3 
clear all, 
close all, 
clc 
Fs=1000; %örnekleme frekansý 
a=5; %iþaretin genliði 
t=[0:1/Fs:3]; %uzunluðu 
x1=exp(-a*t); %üstel bir iþaret üretir x1 deðiþkenine atar   
n=[0:127]; %128 uzunluklu vektör 
Fs1=50; %bir baþka örnekleme frekansý   
Ts1=1/Fs1; %bir baþka örnekleme zamaný 
xn=exp(-a*(n*Ts1)); %bir baþka üstel iþaret 
% süreki ve ayrýk iki üstel iþaretin grafikleri 
figure(1) 
subplot(2,1,1), plot(t,x1),title('Sürekli Üstel Ýþaret'),grid on 
subplot(2,1,2), stem(n,xn),title('Ayrýk Üstel Ýþaret'), grid on   
w=linspace(-10*pi,10*pi,1024);   
DTFT_xn=0;   
for k=0:length(n)-1     
    DTFT_xn=DTFT_xn+xn(k+1)*exp(-1i*w*k); %ayrýk zamanlý Fourier Dönüþümü hesabý 
end
abs_DTFT_xn=abs(DTFT_xn); %genlik bilgisi
ang_DTFT_xn=angle(DTFT_xn); %açý bilgisi   
figure(2) 
subplot(2,1,1), stem(w,abs_DTFT_xn,'m'),title('DTFT GENLÝK BÝLGÝSÝ'),grid on 
subplot(2,1,2), stem(w,ang_DTFT_xn,'c'),title('DTFT AÇI BÝLGÝSÝ'), grid on 
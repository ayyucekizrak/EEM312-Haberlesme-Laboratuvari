%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY5:DARBE GENLÝK MODÜLASYONU (PAM-Pulse Amplitude Modulation) 
%% Rastgele 0-1 aralýðýnda deðer alan 20000 frekansa sahip ses üretme sound(rand(100000,1),20000)  
%% Bilgi iþareti: SES olan bir DSB Modülasyon-Demodülasyon 
clear all  
Fs=8000; % Örnekleme Frekansý  
Ts=1/Fs; %Örnekleme Periyodu  
t=[0:Ts:0.1]; % Eksen uzunluðu  
F=200; %Ses iþaretinin frekansý (insan kulaðý 20Hz-20kHz aralýðýný duyar)  
Fc=8*F;; %Taþýyýcý frekansý olarak sesin frekansýnýn 8 katýný seçtik 
A=sin(2*pi*F*t); % Ses iþaretinin sin fonksiyonu olarak üretilmesi 
sound(A,Fs); % SOUND komutuyla ses üretilmesi
C=sin(2*pi*Fc*t); %taþýyýcý iþareti 
figure (1)% figure 1 ile 5 grafiðin çizilmesi 
subplot(5,1,1); plot(t,A), xlabel('Zaman'), ylabel('Genlik'),title('Ses Ýþareti'); 
subplot(5,1,2); plot(t,C), xlabel('Zaman'), ylabel('Genlik'), title('Taþýyýcý Ýþareti'); grid on; 
%% DSB MODÜLASYONU 
y=A.*C; %frekans deðiþimi w.r.t mesaj 
subplot(5,1,3); plot(t,y), xlabel('Zaman'), ylabel('Genlik'),title('DSB Ýþaret'); grid on; 
%% DSB DEMODÜLASYONU 
Y=y.*C; 
filter=fir1(10,F/Fs,'low'); %Alçak Geçiren Filtre tasarýmý 
AGF=conv(filter,Y); %AGF ile Y iþaretini konvolüsyon yaparak yüksek frekanstaki gürültüleri bastýrýrýz 
t1=0:1/(length(AGF)-1):1; %% GRAFÝKLERÝN ÇÝZDÝRÝLMESÝ 
figure (1)% figure 1 ile 5 grafiðin çizilmesi 
subplot(5,1,1); plot(t,A), xlabel('Zaman'), ylabel('Genlik'),title('Ses Ýþareti');  
subplot(5,1,2); plot(t,C), xlabel('Zaman'), ylabel('Genlik'), title('Taþýyýcý Ýþareti');  grid on; 
subplot(5,1,4); plot(t,Y), title('Demodüle edilmiþ iþaret'), xlabel('Zaman'), ylabel('Genlik'); 
subplot(5,1,5); plot(t1,AGF), title('Demodüle edilmiþ iþaretin Alçak Geçiren Filtre Çýkýþý'), xlabel('Zaman'), ylabel('Genlik'); 
%% --------------------------------------------------------- 
% PAM 
clear all; 
%% Sürekli Ýþaretin Üretilmesi 
L=1000; 
fsim=22000; %sürekli iþaretin örnekleme frekansý 
fc=fsim/L; %1 periyotun L örnekten oluþmasý=fc 
Tcycle=1/fc; % 1 Periyot 
Tcont=1/fsim; %sürekli iþaretin Örnekleme periyodu 
continuous_time_axis=[0:Tcont:Tcycle]; %Ýþaretin bir periyodunu seçmek için zaman ölçeklemesi 
ycont=sin(2*pi*fc*continuous_time_axis); % sürekli sinüzoidalin bir periyodu   f
figure (2),plot(continuous_time_axis,ycont);   %% Ýdeal Örneklenmiþ Ýþaret 
num_samples_cycle=8; % Örnek sayýsý (Deðiþtirerek farký inceleyiniz) 
Tm=Tcont*L/num_samples_cycle; %Örneklenmiþ iþaretin örnekleme periyodu 
discrete_time_axis=[0:Tm:Tcycle]; % ayrýk zaman için zaman ölçeklemesi 
ysampled=sin(2*pi*fc*discrete_time_axis); %örneklenmiþ iþaret 
figure(3); plot(continuous_time_axis,ycont); title('Sürekli iþaret üzerinden alýnan 8 örnek gösterimi'); xlabel('n'); hold on; 
stem(discrete_time_axis,ysampled); hold off;    
%% PAM Ýþareti 
N=length(ycont); %Sürekli iþaretin uzunluk bilgisini yukardan aldýk 
z=zeros(1,N); % N uzunluklu zero vektörü oluþturduk 
n=floor(Tm/Tcont); % ayrýk iþaretin periyodunu sürekli iþaretin                     
% periyoduna bölüp yuvarlama iþlemi yapýlmýþtýr                    
% örneklenmiþ iþaretin örnekleri arasýndaki artýþ 
z(1:n:N)=ysampled; % zero vektörünun her n deðerine ysampled iþaretinin deðeri konur                      
%böylece örneklenmiþ iþaretin örnekleri arasýna sýfýrlar eklenmiþtir                    
%sampled signal 
h=zeros(1,100); h(1:10)=1; % 10 örneklik bir dürtü iþareti 
pamreal=conv(h,z); % dürtü iþareti ile örnek aralarýna sýfýr eklenmiþ örneklenmiþ                    
% iþaretin konvolüsyonu 
figure(4) 
plot(pamreal(1:L));title('PAM iþareti'); xlabel('n')   
figure(5); %sürekli iþaretle PAM iþaretini birlikte çizdirmek 
plot(continuous_time_axis, pamreal(1:N));title('Sürekli iþaret ve PAM iþaretinin birlikte gösterimi'); xlabel('n') 
hold on; plot(continuous_time_axis, ycont)     
%% FREKANS DOMENÝ ÝÞLEMLERÝ 
freq_axis=[-fsim/2:fc:fsim/2]; YCONT=fft(ycont); %Sürekli iþaretin spektrumu 
figure(6) 
subplot(3,1,1) 
stem(freq_axis, fftshift(abs(YCONT)));title('Sürekli iþaretin spektrumu (ycont)');xlabel('f')   
freq_axis2=[-fsim/2:fsim/8:fsim/2]; 
YSAMPLED=fft(ysampled); %8 örnekli ayrýk iþaretin spektrumu                         
%bu 8 örnek sürekli iþaret üzerinden aýnmýþtýr                 
subplot(3,1,2) 
stem(freq_axis2,fftshift(abs(YSAMPLED)));title('Ayrýk iþaretin spektrumu (ysampled)');xlabel('f') 
subplot(3,1,3) 
stem((-50:49),fftshift(abs(fft(h))));
title('Dürtü iþaretinin spektrumu (h)');xlabel('f') 
%figure(7) 
%stem((-L/2: L/2),fftshift(abs(fft(pamreal(1:L)))));title('PAM iþaretinin spektrumu'); xlabel('f') 
figure(8) 
stem(freq_axis, fftshift(abs(YCONT)));title('Sürekli iþaretin ve PAM iþaretinin spektrumu');xlabel('f') 
hold on; 
stem(freq_axis, fftshift(abs(fft(pamreal(1:N)))))   

%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY4:GENLÝK MOD ve FREKANS MOD 
%% GENLÝK MODÜLASYONU 
%******************************************************** 
clear all 
disp('Örnek: m=1 ortalama 100% modülasyon'); 
m=input(' Bir modülasyon indeksi giriniz (m) = '); %m=1;  
%100 modülasyon oraný için 
if (0>m||m>1) 
    error('0-1 aralýðýnda deðer girilmemiþtir');  
end 
 
%% Mesaj sinyalinin üretilmesi 
Am=5; % Genlik 
fa=2000; % Frekans 
Ta=1/fa; % Periyot (Zaman) 
t=0:Ta/999:6*Ta; % Simülasyon için toplam zaman 
ym=Am*sin(2*pi*fa*t); % Mesaj denklemi
figure(2) 
subplot(3,1,1);  plot(t,ym), grid on;% Modülasyon sinyalinin grafikleri 
title ( '  Mesaj Sinyali   '); 
xlabel ( ' Zaman(sn) '); ylabel (' Genlik(volt)   '); 
 
%% Taþýyýcý sinyalin üretilmesi 
Ac=Am/m;% Genlik [ Mod Ýndeksi (m)=Am/Ac ] 
fc=fa*10;% Frekans 
Tc=1/fc;% Zaman 
yc=Ac*sin(2*pi*fc*t);% Taþýyýcý sinyal denklemþ 
subplot(3,1,2); plot(t,yc), grid on;% Taþýyýcý iþaret grafikleri 
title ( '  Taþýyýcý Ýþaret   '); xlabel ( ' Zaman(sn) '); ylabel (' Genlik(volt)   ');   
%% AM MODÜLASYON 
y=Ac*(1+m*sin(2*pi*fa*t)).*sin(2*pi*fc*t); % AM Denklemi 
subplot(3,1,3); plot(t,y);% AM iþaretinin denklemi 
title ( '  AM Ýþaret  '); xlabel ( ' Zaman(sn) '); 
ylabel (' Genlik(volt)   '); grid on;   
%% FREKANS MODÜLASYONU 
%******************************************************** 
clear all; 
close all; 
fm=input('Mesaj iþareti frekansý giriniz='); 
fc=input('Taþýyýcý iþareti frekansý giriniz='); 
mi=input('Modülasyon indeksi giriniz='); %% Mesaj iþaretinin oluþturulmasý 
t=0:0.0001:0.1; %iþaret uzunluðunun belirlenmesi 
m=sin(2*pi*fm*t); %mesaj iþareti 
subplot(3,1,1); plot(t,m); xlabel('Zaman'); ylabel('Genlik'); title('Mesaj Ýþareti'); grid on; 
%% Taþýyýcý iþaretinin Oluþturulmasý 
c=sin(2*pi*fc*t); %taþýyýcý iþareti 
subplot(3,1,2); plot(t,c); xlabel('Time'); ylabel('Amplitude'); title('Carrier Signal'); grid on; 
%% FM MODÜLASYONU 
y=sin(2*pi*fc*t+(mi.*sin(2*pi*fm*t))); %frekans deðiþimi w.r.t mesaj 
subplot(3,1,3); plot(t,y); xlabel('Zaman'); ylabel('Genlik'); title('FM Ýþaret'); grid on; 
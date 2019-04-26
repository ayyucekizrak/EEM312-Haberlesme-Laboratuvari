%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY7:ASK-FSK-PSK 
%ASK-Genlik Kaydýrmalý Anahtarlama 
%FSK-Frekans Kaydýrmalý Anahtarlama 
%PSK-Faz Kaydýrmalý Anahtarlama 
%----------------------------------------------------------
clc; 
close all; 
clear all; %Komut penceresini temizle, Açýk pencereleri kapa, Workspace temizle 
f1=2; %1. Frekans deðeri 
f2=10; %2. Frekans deðeri 
N=10; % Bilgi iþaretinin bit uzunluðu 
x=randi([0 1],1,N)% rastgele 0-1 deðeri atanýyor N uzunluðunda (satýr vektörü) 
nx=size(x,2); %x matrisinin(vektörünün) boyutunu nx deðerine atar.   
i=1; %baþlangýç deðeri (her bit için iþlem yapabilmek i) 
while i<nx+1 %1'den nx+1'e kadar döngüye baþlanýr. 
 
    t=i:0.001:i+1; %i'den i+1'e kadar 0.001 aralýklarla t zaman ekseni oluþturulur 
 
    if x(i)==1 %IF döngüsüyle x rastgele vektörünün i. deðeri 1 ise buradaki iþlemler yapýlýr                
        %deðilse (yani 0'sa) ELSE döngüsüne geçer ve oradaki iþlemler yapýlýr 
 
        % BÝLGÝ ÝÞARETÝ 1 ÝKEN;         
        ask=sin(2*pi*f1*t); %ask fonksiyonu         
        fsk=sin(2*pi*f2*t); %fsk fonksiyonu         
        psk=sin(2*pi*f1*t); %psk fonksiyonu     
    else         % BÝLGÝ ÝÞARETÝ 0 ÝKEN;         
        ask=0.2*sin(2*pi*f1*t); %ask fonksiyonu (=0 olarak ta verilebilirdi)         
        fsk=sin(2*pi*f1*t);     %fsk fonksiyonu         
        psk=sin(2*pi*f1*t+pi);  %psk fonksiyonu 
    end


% Tüm subplot komutlarý her bit için while döngüsü içinde hesaplanýr 
% hold on ile tutulur veböylece tek grafikte gösterilmiþ olur.     
subplot(3,1,1), plot(t,ask);%çizim ekraný 3 parçaya bölünür ve 1. grafiðe çizilir     
hold on      
title ('ASK MOD'); %ASK MOD baþlýðý yazar          
subplot(3,1,2), plot(t,fsk);%çizim ekraný 3 parçaya bölünür ve 2. grafiðe çizilir     
hold on     
title ('FSK MOD'); %FSK MOD baþlýðý yazar          
subplot(3,1,3), plot(t,psk);%çizim ekraný 3 parçaya bölünür ve 3. grafiðe çizilir    
hold on     
title ('PSK MOD'); %MSK MOD baþlýðý yazar     
i=i+1; %while döngüsünde nx+1 deðerine kadar her bitin iþleminin yapýlabilmesi için            
% i deðeri her adýmda 1 artýrýlýr 
end %döngü sona erer 
%----------------------------------------------------------- 

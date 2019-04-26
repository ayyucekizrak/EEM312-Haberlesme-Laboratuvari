%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY8:DELTA MODÜLASYONU 
clear all 
clc 
close all 
del=0.35; %delta adým uzunluðu (genlikte deðiþkendir zamanda deðil) 
A=5;%oluþturulacak olan sinüsoidal giriþ iþaretinin genliði 
t=0:2*pi/100:2*pi; %t=0 dan 2pi y kadar 2pi/100 tane örnek adýmýyla zaman eksenini oluþturur  
x=A*sin(t); %x=sürekli zamanlý t zamanlý A genlikli sinüs iþareti 
plot(x,'*-r')% x iþaretinin grafiði çizer 
hold on %grafiði figure penceresinde tutar üzerine baþka grafikler eklemek için 
grid on %grafiðin arka planýnýn ölçeklerini gösterir 
%döngülerden önce mutlaka ilk kez döngü içinde tanýmlanacak deðerler =0 %deðeri atanýr. 
y=[0];  
xr=0; 
for i=1:length(x)-1 %1den x-1 uzunluðu kadar for döngüsü çalýþýr.     
    %0. deðeri yukarda =0 olarak tanýmladýðýmýz için -1 adým gideriz     
    %çünkü 0'ý da sayýnca 100 eleman için iþlemi yapmýþ olacaðýz.     
    if xr(i)<=x(i) %x giriþ iþareti i. xr deðerinden büyük yada eþitse                    
        %d=1 atanýr ve xr çýkýþ iþaretinin yeni deðerine xr                    
        %iþaretnin önceki deðerine delta adým uzunluðu eklenir.         
        d=1;         
        xr(i+1)=xr(i)+del;     
    else %Eðer x giriþ iþareti i. xr deðerinden küçükse d=0 atanýr           
        %ve xr çýkýþ iþaretinin yeni deðerine xr          
        %iþaretnin önceki deðeriþ ne delta adým uzunluðu çýkarýlýr.          
        %Örnein; Pozitif alternanstan negatif alternansa geçiþ sürecindedemetir.  
        d=0;     
    end
    y=[y d]; %Delta mod. y deðiþkeninin içinde 0 1 geçiþlerini gösterir 
end
stairs(xr,'b') %basamakolarak bir önceki grafiðin üzerine çizdirilir xr 
hold off 
%yeni bir grafik çizdirildiðinde yeni bir figure  açar 
MSE=sum((x-xr).^2)/length(x) %ortalama karesel hata hesabý
 

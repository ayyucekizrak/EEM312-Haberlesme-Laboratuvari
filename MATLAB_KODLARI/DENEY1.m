%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY1:MATLAB TEMEL UYGULAMALAR 
%% GÝRÝÞ 
A=rand(2,4) 
%rastgele 0-1 aralýðýnda sayý üretir (2,4)lik matris yapar. 
B=randn(3,2) 
%normal daðýlýmlý rastgele sayý üretir (3,2)matrise yazar. 
C=ones(2,4) 
%1 lerden oluþan matris (girmiþ olduðunuz boyuta göre (2,4)) 
D=zeros(3,5) 
%0 lardan oluþan matris üretir E=eye(4) %birim matris üretir girilen boyutta 
F=size(A) 
%yukarýdaki A,B,C,D ve E için de deneyin size o matrisin boyut bilgisini verir 
 
%% 1.a clear all % workspace e kayýtlý bilgileri siler close all 
% açýk pencereleri kapatýr 
clc 
% command window ekranýndaki çýktýlarý siler 
A=[1 2;4 5;7 8] 
% A matrisi 
B=[1 3;5 7;9 11] 
% B matrisi 
C=A+B 
% A ve B matrisinin toplamý 
 
%% 1.b 
k=10; 
% bir sabit 
D=k*(A-B) 
%iþlemin sonucu D deðiþkenine yazýlýr, sonuna ; koyulmayan satýrlar command windowda ekran çýktýsý üretir. 
 
%% 1.c 
E=A*B' 
%Ýki matrisin çarpýmý E deðiþkenine yazýlýr. 
 
%% 1.d 
F=A.*B 
% iki matrisin skaler çarpýmý F deðiþkenine yazýlýr 
 
%% 1.e 
A_ort=mean(A) 
% A matrisi elemanlarýnýn ortalamasý A_ort deðiþkenine yazýlýr 
 
%% 1.f 
B_top=sum(B')
%B nin transpozunu alýrsak sütunlarýný buluruz 
%% 1.g 
X=ones(3,2); 
% (3,2) boyutlu 1lerden oluþan matrisi X deðiþkenine atar 
Z=X+A % A matrisi ile X matrisinin toplamýný Z deðiþkenine atar 
 
%% 1.h  
M=randn(2,3) % normal daðýlýmlý rastgele (2,3) boyutlu matrisi M deðiþkenine yaz 
M1=fix(M) 
% Bu matristeki elemanlarý 0'a doðru yuvarla 
 
%% 1.i 
M2=ceil(M) %Bu matristeki elemanlarý yukarý doðru yuvarla 
 
%% 1.j  
M3=floor(M) % Bu matristeki elemanlarý aþaðý doðru yuvarla 
 
%% 1.k 
T=size(A*B') %Çarpýmlarýn boyutu ne olur sonucu T deðiþkenine yaz 
 
%% 2 
bos_dizi = ones(1,20); % 20 elemanlý 1lerden oluþan bir vektör üretir bos_dizi deðiþkenine atar   
for i=1:20 %i 1 den 20ye kadar for u döndürür     
    bos_dizi(1,i) = i; %i deðeri vektörün elemanlýrýný tek tek dolaþýr ve elemanýn sayýsýný içine deðer olarak atar.                        
    % örneðin i=3 teyken 3. elemana 3 deðerini yazma                        
    % iþlemini yapar. Döngünün sonunda 1den 20 artan                        
    % deðerler alan vektör oluþmuþ olur                        
    % bu döngü yerine bos_dizi=(1:20) yazmayý deneyin 
end
for i=1:20
    % vektörün her bir elemanýný tekrar dolaþýr for döngüsüyle     
    if mod(bos_dizi(1,i),2) == 0 % i. elemandaki deðerin mod 2 sonucu 0'a eþitse          
        bos_dizi(1,i) = -i; % o deðerin negatifine eþitler deðeri 
% örneðin i=4 mod2=0 olduðu için i.deðer=-i                             
% (-4) olur     
    end
end
son_dizi = bos_dizi
% bos_dizi deðiþkenini son_dizi deðiþkenine atayýp ekrana yazdýrýr 
 
%% 3  
x=11+rand(10,3)*19 %11 ile 30 aralýðýnda deðer alan (10,3) boyutlu matris  
for i=1:10 % matrisin satýrlarýný dolaþmayý saðlayan döngü     
    for j=1:3 % matrisin sütunlarýný dolaþmayý saðlayan döngü         
        if x(i,j)>= 20 % ilgili satýr ve sütundaki eleman 20 ve büyükse             
            z(i,j)=1 % o sayýyý 1 e eþitle bunu z deðiþkenine yaz         
        else             z(i,j)=0 %deðilse, 0 a eþitle bunu z deðiþkenine yaz         
        end
    end
end
z % ekrana z matrisini yaz 
y=x>20 % matlab yukardaki döngüyü kolayca bu satýrla da yapmayý saðlar 
%% 4 
clear all  
clc 
A=[3 6 4;1 5 0;0 7 7] % doðrusal denklem çözümü için linsolve fonksiyonunu kullanýyoruz 
B=[1;2;3] 
COZUM=linsolve(A,B)
 
%% 5 
x=(1:21); %eleman eleman artan dizi üretir 
y=exp(x); %üretilen dizinin üstel fonk. sonucunu üretir 
figure(1), %1. figür oluþturur   
subplot(1,2,1), % subplot bir pencerede kaç grafik göstereciðinizi belirlemek için kullanýlýr 
plot(x), % sürekli bir iþareti çizdirirken kullanýlacak olan grafik çizme fonksiyonu 
xlabel('x ekseni'), ylabel('y ekseni'),  % grafiðin xlabel ylabel ile eksenlerine isim verilir 
title('doðrusal x iþareti'); % grafiðe bir baþlýk yazmamýza yarar   
subplot(1,2,2), %subplot komutu birbirlerine baðlý olarak çalýþýr. 
plot(y), loglog(x,y), %x ve y eksenlerini logaritmik eksene oturtur (semilogx,semilogy)komutlarýný deneyin 
xlabel('x ekseni'),ylabel('y ekseni'),  title('üstel y iþareti'); 
 
%% 6.a 
a=linspace(-pi,pi,100); %-pi +pi aralýðýnda 100 adet eþit aralýklý deðer oluþturur. 
b1=10*a; %a deðerlerinin 10 katýný alýr 
b2=a.^2; %a deðerlerinin karelerini alýr 
figure(2), %2 ismini veridðim için diðer açýk pencere sabit tutulup yeni pencere açar 
subplot(1,2,1),plot(a,b1), xlabel('x ekseni'), ylabel('y ekseni'), grid on; %grid on fonksiyonunun grafik üzerindeki etkisini inceleyin 
subplot(1,2,2),plot(a,b2), xlabel('x ekseni'), ylabel('y ekseni'); 
 
%% 6.b 
c1=cos(a); c2=exp(-5*a).*sin(2*a); %.* ve * iþlemlerini matris vektör boyutlarýna uygun þekilde seçilmeli 
figure(3), %3. figürü açmaya yarar 
subplot(2,2,1),plot(a,b1), xlabel('x ekseni'), ylabel('y ekseni'),title('b1 ÝÞARETÝ'),grid on; 
subplot(2,2,2),plot(a,b2), xlabel('x ekseni'), ylabel('y ekseni'),title('b2 ÝÞARETÝ'),grid on; 
subplot(2,2,3),plot(a,c1), xlabel('x ekseni'), ylabel('y ekseni'),title('c1 ÝÞARETÝ'),grid on; 
subplot(2,2,4),plot(a,c2), xlabel('x ekseni'), ylabel('y ekseni'),title('c2 ÝÞARETÝ'),grid on; 

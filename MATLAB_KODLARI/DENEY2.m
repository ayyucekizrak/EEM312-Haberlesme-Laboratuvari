%% ***********HABERLEÞME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayyüce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY2:AYRIK ZAMANLI SÝNYALLER VE SÝSTEMLER 
%% 1.a 
clear all; 
close all;  
clc; 
fm=10; %üretilmek istenen mesaj iþaretinin frekansý 
fs=100*fm; %örnekleme frekansý 
n=[0:1/fs:1]; %iþareti 0-1 aralýðýnda 1/fs aralýklarla örnek alýnmasý için adým uzunluðu 
faz=0; %iþarete eklenecek olan faz=0 
x=cos(2*pi*n*fm+faz); %cosinüs iþaretini üretip x deðiþkenine yazar 
figure(1), %1. figürü oluþturur 
plot(n,x,'k'); %'k' iþreti ekrana siyah renkle çizmemize yarar, plot adým aralarýndaki noktalarý birleþtirerek grafiði çizer+ 
title('sinüzoidal iþaret-plot komutuyla'), xlabel('n'), ylabel('x(n)'); %iþaretin etiketlerini ve baþlýklarýný ekler 
figure(2), %2. figürü oluþturur 
stem(n,x,'k'); %'k' iþreti ekrana siyah renkle çizmemize yarar, plot adým aralarýndaki noktalarý birleþtirerek grafiði çizer+ 
title('sinüzoidal iþaret-stem komutuyla'), xlabel('n'), ylabel('x(n)'); %iþaretin etiketlerini ve baþlýklarýný ekler   
%% 1.b2 
clear all;  
clc; 
fm=10; 
faz=0; % fs1=2*fm; 
%örnekleme frekanslarý 
fs1=2*fm;
fs2=10*fm; 
fs3=50*fm; 
fs4=100*fm; 
n1=[0:1/fs1:1];%iþareti 0-1 aralýðýnda 1/fs aralýklarla örnek alýnmasý için adým uzunluðu 
n2=[0:1/fs2:1]; 
n3=[0:1/fs3:1]; 
n4=[0:1/fs4:1]; 
xa=cos(2*pi*n1*fm+faz);%cosinüs iþaretini üretip x deðiþkenlerine yazar 
xb=cos(2*pi*n2*fm+faz); 
xc=cos(2*pi*n3*fm+faz); 
xd=cos(2*pi*n4*fm+faz); % yukarýdaki iþlemleri 4 kez yazmak yerine klavyeden her fs katsayýsýný 
% girerek ve iþlemleri döngü içinde yaparak programý daha kýsa yazýlabilir % mi?   
figure (2), 
subplot(2,2,1),plot(n1,xa),title('(fs1)sinüzoidal iþaretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,2),plot(n2,xb),title('(fs2)sinüzoidal iþaretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,3),plot(n3,xc),title('(fs3)sinüzoidal iþaretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,4),plot(n4,xd),title('(fs4)sinüzoidal iþaretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
 
%% 1.c 
figure (3), %iþaretin etiketlerini ve baþlýklarýný ekler 
subplot(2,2,1),stem(n1,xa),title('(fs1)sinüzoidal iþaretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,2),stem(n2,xb),title('(fs2)sinüzoidal iþaretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,3),stem(n3,xc),title('(fs3)sinüzoidal iþaretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,4),stem(n4,xd),title('(fs4)sinüzoidal iþaretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
 
%% 2.a 
clear all 
fm=10; 
fs=4.05*fm; %uygun örnekleme frekansý seçilmezse 
n=[0:1/fs:1]; 
faz=0; 
x=cos(2*pi*n*fm+faz); 
figure(4), 
subplot(2,1,1),plot(n,x,'r'), title('ayrýk iþareti plot ile çizince'), xlabel('n'), ylabel('x(n)'); 
subplot(2,1,2),stem(n,x,'b'), title('ayrýk iþareti stem ile çizince'), xlabel('n'), ylabel('x(n)'); 
 
%% 2.b 
clear all; 
close all;  
clc; 
 
%% 2.c 
t=1:0.25:16 %64 uzunluklu diziyi yaratmak için 
kare=square(2*pi*0.5*t); %square fonksiyonuyla kare dalga üretir 
figure(1), plot(kare); %elde edilen dalgayý figür 1'e çizer 
 
%% 2.d  
testere=sawtooth(2*pi*0.5*t); % sawtooth fonksiyonuyla testere diþi dalga üretir 
figure(2) 
plot(testere); %elde edilen dalgayý figür 2'ye çizer 
 
%% 2.e 
top=kare+testere %kare ve testere diþi dalgayý toplayýp top deðiþkenine yazar 
carp=kare.*testere %çarpar ve carp deðiþkenine atar 
figure(3), subplot(2,2,1),stem(kare),title('Kare Dalga'); 
subplot(2,2,2),stem(testere),title('Testere Diþi Dalga'); 
subplot(2,2,3),stem(top),title('Kare + Testere Dalga'); 
subplot(2,2,4),stem(carp),title('Kare * Testere Dalga'); 
 
%% 3.a 
clear all; 
close all; 
clc 
N=150;  
v=0.1*rand(1,N); %v deðiþkenine rastgele deðerler atar N uzunluklu bir vektördür 
s=0.1*cos(pi*0.5*(1:N)); %s deðiþkenine genliði 0.1 cos fonk. atar N uzunluklu bir vektördür 
x=cos(pi*0.05*(1:N)); % N uzunluklu cos fonksiyonunu x deðiþkenine atar 
x1=x+v; %cos iþaretiyle rastgele deðerleri toplar x1 deðiþkenine atar 
x2=x+s; %cos iþaretiyle düþük genlikli bir baþka cos'u toplar x2 deðiþkenine atar 
figure(1), 
subplot(2,1,1),plot(x1,'r'); %'r'grafiði kýrmýzý çizer 
subplot(2,1,2),plot(x2,'m'); %'m' grafiði magenta renginde çizer 
 
%% 3.b.1 v gürültüsü için kayan ortalama iþlemiyle gürültüyü temizleme 
m=0:N-1 
y1(1)=(v(1)+v(2))/3; %vektör boyutlarý uymasý için 1. ve 150. elemanlarý for döngüsü dýþýnda yaparýz 
for n=2:1:m     
    y1(n)=(x1(n-1)+x1(n)+x1(n+1))/3; %2-149 arasýndaki deðerleri hesaplar (kayan ortalama) 
end
y1(150)=(v(149)+v(150))/3; 
figure(2), 
subplot(2,1,1),plot(m,v,'k-',m,x,'r.',m,x1,'m-'); %1 plot fonk. içinde 3 grafik çizdiriyoruz (hold on komutuyla da denenebilir) 
legend('v[n]','x[n]','x1[n]'); % grafiðin içinde hangi renk çizim hangi grafiði iþaret eder bunu gösteririz. 
subplot(2,1,2),plot(m,y1,'b-.',m,x1,'m-'); legend('y1[n]','x1[n]');
 
%% 3.b.2 s cos için kayan ortalama iþlemiyle gürültüyü temizleme 
y2(1)=(s(1)+s(2))/3; 
for n=2:1:m     
    y2(n)=(x2(n-1)+x2(n)+x2(n+1))/3; 
end
y2(150)=(s(149)+s(150))/3; 
figure(3), 
subplot(2,1,1),plot(m,s,'k-',m,x,'r.',m,x2,'m-'); legend('s[n]','x[n]','x2[n]'); 
subplot(2,1,2),plot(m,y2,'b-',m,x,'m-'); legend('y2[n]','x[n]');
 
%% 3.c  
x3=x1+x2; %yukarda hesaplanan x1 ve x3 iþaretlerini toplarýz (farklý gürültülere sahipler) 
y3=y1+y2; %yukarda hesaplanan y1 ve y3 iþaretlerini toplarýz (kayan ortalama sonuçlarý) 
figure(4), 
subplot(2,1,1),plot(x3,'k-'),title('x3=x1+x2 iþareti'); 
subplot(2,1,2),plot(y3,'b-'),title('y3=y1+y2 iþareti');   
%% 5.1 
h=zeros(1,N); %1-150 uzunluklu 0'lardan oluþan vektör üretir 
for i=1:N %ilk 3 terime 1/3 deðeri vermek için tüm elemanlarý for ile gezeriz. if ile de ilk 3 terim koþulunu oluþtururuz     
    if i<=3 
        h(1,i)=1/3;    
    end
end
figure(5), 
stem(h,'r'),title('h iþareti (birim basamak)'); %stem fonk. grafiði figür 5'e 'r' kýrmýzý renkte çizdir. title ile baþlýk yaz   
%% 5.2 
y5=conv(x1,h); %conv fonksiyonu ile konvolusyon (evriþim iþlemi) yapar sonucu y5 e yazar 
y6=conv(x2,h); 
figure(6), 
subplot(2,1,1),plot(y5,'k-'),title('y5=conv(x1,h) iþareti'); 
subplot(2,1,2),plot(y6,'b-'),title('y6=conv(x2,h) iþareti');
clc;
clear;
clear all;

% Odevin iki kismi da ayni scriptte bulundugundan herhangi bir kismi 
% calistirirken digerini comment satirina aliniz (ayni isme sahip degiskenler
% icerdiginden sorun olmamasi adina).


% ODEVIN 1. KISMI (1 VE 2. SORU)

k = input('Lutfen ilk isaretin (h[n]) eleman sayisini giriniz: ');

l = input('h[n] işaretinin ilk elemaninin yatay degerini giriniz: ');

for i = 1 : k
    fprintf('h[%d] degeri:', i);
    h(i) = input('');
end

m = input('Lutfen ikinci isaretin (x[n]) eleman sayisini giriniz: ');

n = input('x[n] işaretinin ilk elemaninin yatay degerini giriniz: ');


for i = 1 : m
    fprintf('x[%d] degeri:', i);
    x(i) = input('');
end

length = k + m - 1;

y = myConv(h, k, x, m, length); % Konvolusyon sonucu

y2 = conv(x,h); % matlab fonksiyonuyla konvolusyon sonucu


yatay = (l + n) : length - 1 + (l + n); 

hyatay = l : k - 1 + l;

xyatay = n : m - 1 + n;

subplot(3,2,1);
stem(hyatay, h);
xlabel('n');
ylabel('h[n]');
grid;

subplot(3,2,3);
stem(xyatay, x);
xlabel('n');
ylabel('x[n]');
grid;


subplot(3,2,5);
stem(yatay, y);
xlabel('n');
ylabel('y[n]');
grid;
title('myConv ile konvolusyon sonucu');


subplot(3,2,2);
stem(hyatay, h);
xlabel('n');
ylabel('h[n]');
grid;

subplot(3,2,4);
stem(xyatay, x);
xlabel('n');
ylabel('x[n]');
grid;

subplot(3,2,6);
stem(yatay, y2);
xlabel('n');
ylabel('y[n]');
grid;
title('conv ile konvolusyon sonucu');

%ekrana vektorel yazdirma

fprintf('\nh[n] degerleri');
for i = 1 : k 
    fprintf('\t%d',h(i));
end


fprintf('\nx[n] degerleri');

for i = 1 : m
    fprintf('\t%d',x(i));
end


fprintf('\nmyConv degerleri');
for i = 1 : length  %kendi fonksiyonumun vektorel degerleri
    fprintf('\t%d',y(i));
end


fprintf('\nconv degerleri');
for i = 1 : length  %hazir fonksiyonun vektorel degerleri
    fprintf('\t%d',y2(i));
end

% ODEVIN 2. KISMI (3 VE 4. SORU)

% p = input('Sorudaki M degerini giriniz(2-3-4): ');
% t = input('Ses kaydi kac saniye olacak(5-10): ');
% 
% h = zeros(1, 1+400*p);
% h(1) = 1;
% 
% for i = 1:p
%     h(1 + 400*i) = 0.8*i;
% end
% 
% 
% recObj = audiorecorder; % kayıt başlatma nesnesi
% disp('Start speaking.') % ekrana mesaj
% recordblocking(recObj, t); % kayıt işlemi
% disp('End of Recording.'); % ekrana mesaj
% x = getaudiodata(recObj); % kaydedilen sesi x değişkenine saklama
% 
% 
% funcCon = conv(h, x);
% 
% myCon = myConv(h, length(h), x, length(x), length(h)+length(x)-1);
% 
% sound(x);
% pause(t);
% sound(myCon);
% pause(t);
% sound(funcCon);
% 
% subplot(3,1,1);
% plot(x);
% title('orijinal ses');
% 
% subplot(3,1,2);
% plot(myCon);
% title('myConv ile ses');
% 
% subplot(3,1,3);
% plot(funcCon);
% title('conv ile ses');



function y = myConv(h, k, x, m, length)

    y = zeros(1, length);

    for i = 1 : m
        for j = 1 : k
            y(i + j - 1) = y(i + j - 1) + h(j) * x(i);
        end
    end
end




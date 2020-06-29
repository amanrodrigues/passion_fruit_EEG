Fs=512;
m=2560;

lais6522= load ('lais6522_data.txt');

Ts=1/Fs;
t_final=(m-1)*Ts;
t=0:Ts:t_final;

c3=lais6522(1:m,2);
c4=lais6522(1:m,3);
sinal=(c3-c4);
save lais6522_data.txt sinal -ascii

% figure(1);plot(t,c3);
% figure(2);plot(t,c4);
% figure(3);plot(t,c3);hold on;plot(t,c4,'c');
% figure(4);plot(t,sinal);

f=-Fs/2:Fs/(m-1):Fs/2;
S=fftshift(fft(sinal,[]));
figure(5);plot(f,abs(S))
%corrigir para exibir de 0 at� Fs/2

% figure(6);pwelch(sinal,[],[],[],Fs); % Calculo usando a Fs

figure(7);
subplot(2,2,1);plot(t,c3);hold on;plot(t,c4,'c');
subplot(2,2,2);plot(t,sinal);
subplot(2,2,3);plot(f,abs(S));
subplot(2,2,4);pwelch(sinal,[],[],[],Fs);
savefig('lais6522_data.fig');

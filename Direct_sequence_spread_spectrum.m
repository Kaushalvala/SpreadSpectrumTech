clc;
clear;
close all;
prompt = {'enter bit sequence (52 bits max):'};
ititle = 'give input bits';
dims = [1 50];
temp1 = inputdlg(prompt,ititle,dims);
temp2 = bin2dec(temp1{1});
bit_sequence = str2num(dec2bin(temp2,length(temp1{1})).');
in_vect = bit_sequence.';
t1 = length(temp1{1});
psn = randi([0 1],1,t1);
Xor_out = xor(psn,in_vect); 
f = 10^6;
T = 1\f;
t = T/99:T/99:T;
BPSK = [];
for i=1:length(bit_sequence)
if Xor_out(1,i) == 0
BPSK = [BPSK sin(2*pi*f*t)];
else
BPSK = [BPSK -sin(2*pi*f*t)];
end
end
tt = T/99:T/99:T*t1;
%GRAPHS
figure(1)
subplot(4,1,1);
stairs(in_vect,'linewidth',3), grid on;
title('Input Bit Sequence');
xlabel('time(s)');
ylabel('amplitude(v)');
axis([1 t1 0 1]);
subplot(4,1,2);
stairs(psn,'r','linewidth',3), grid on;
title('Psuedo Random Noise Code');
xlabel('Time(s)');
ylabel('Amplitude(v)');
axis([1 t1 0 1]);
subplot(4,1,3);
stairs(Xor_out,'m','linewidth',3), grid on;
title('X OR');
xlabel('Time(s)');
xlabel('Time(s)');
ylabel('Amplitude(V)');
axis([1 t1 0 1]);
subplot(4,1,4);
plot(tt,BPSK,'k','linewidth',3), grid on;
title('BPSK');
xlabel('Time(s)');
ylabel('Amplitude(V)');
axis([1 T*t1 -1 1]);
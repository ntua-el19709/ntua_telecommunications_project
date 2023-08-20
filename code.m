%ΑΝΔΡΕΑΣ ΚΑΛΑΒΑΣ (03119709)
%για να τρέξει ο κώδικας χρειάζονται τα αρχεία rice_even.txt και 
%soundfile2_lab2.wav
%χρειάζεται κάποια λεπτά για να τρέξει και παράγει 2 αρχεία txt
%2 αρχεία wav, και 38 διαγράμματα
%κάποια αποτελέσματα τα τυπώνει στο command window
%1o erotima
%a)i)
fm=7000;                  % 7+0+9=16 => fm=1+6=7kHz
fs1=fm*30;
fs2=fm*50;
Tm=1/fm;
dts1=1/fs1;
dts2=1/fs2;
ts1=0:dts1:4*Tm;
ys1=triag(ts1,Tm);        % η συνάρτηση ορίζεται στο τέλος του κώδικα
figure(1);
scatter(ts1,ys1,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('y(t) with sample frequency fs1');
legend('y(t) sampled with fs1');
saveas(gca,'figure1.jpeg');
%ii)
figure(2);
ts2=0:dts2:4*Tm;
ys2=triag(ts2,Tm);
scatter(ts2,ys2,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('y(t) with sample frequency fs2');
legend('y(t) sampled with fs2');
saveas(gca,'figure2.jpeg');
%iii)
figure(3);
scatter(ts1,ys1,'.');
hold on;
scatter(ts2,ys2);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('y(t) with sample frequencies fs1, fs2');
legend('y(t) sampled with fs1','y(t) sampled with fs2');
saveas(gca,'figure3.jpeg');
%b)
f4=4*fm;
dt4=1/f4;
t4=0:dt4:4*Tm;
y4=triag(t4,Tm);
figure(40);
scatter(t4,y4,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('y(t) with sample frequency 4*fm');
legend('y(t) sampled with 4*fm');
saveas(gca,'figure40.jpeg');
%c)i)
figure(4);
zs1=sin(2*pi*fm.*ts1);
scatter(ts1,zs1,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('z(t) with sample frequency fs1');
legend('z(t) sampled with fs1');
saveas(gca,'figure4.jpeg');
figure(5);
zs2=sin(2*pi*fm.*ts2);
scatter(ts2,zs2,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('z(t) with sample frequency fs2');
legend('z(t) sampled with fs2');
saveas(gca,'figure5.jpeg');
figure(6);
scatter(ts1,zs1,'.');
hold on;
scatter(ts2,zs2);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('z(t) with sample frequencies fs1, fs2');
legend('z(t) sampled with fs1','z(t) sampled with fs2');
saveas(gca,'figure6.jpeg');
z4=sin(2*pi*fm.*t4);
figure(41);
scatter(t4,z4,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('z(t) with sample frequency 4*fm');
legend('z(t) sampled with 4*fm');
saveas(gca,'figure41.jpeg');
%ii)
figure(7);
ts1=0:dts1:7*Tm;
ts2=0:dts2:7*Tm;
zs1=sin(2*pi*fm.*ts1);
zs2=sin(2*pi*fm.*ts2);
qs1=zs1+sin(2*pi*(fm+1000).*ts1);
scatter(ts1,qs1,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('q(t) with sample frequency fs1');
legend('q(t) sampled with fs1');
saveas(gca,'figure7.jpeg');
figure(8);
qs2=zs2+sin(2*pi*(fm+1000).*ts2);
scatter(ts2,qs2,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('q(t) with sample frequency fs2');
legend('q(t) sampled with fs2');
saveas(gca,'figure8.jpeg');
figure(9);
scatter(ts1,qs1,'.');
hold on;
scatter(ts2,qs2);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('q(t) with sample frequencies fs1, fs2');
legend('q(t) sampled with fs1','q(t) sampled with fs2');
saveas(gca,'figure9.jpeg');
t4=0:dt4:7*Tm;
z4=sin(2*pi*fm.*t4);
q4=z4+sin(2*pi*(fm+1000).*t4);
figure(42);
scatter(t4,q4,'.');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('q(t) with sample frequency 4*fm');
legend('q(t) sampled with 4*fm');
saveas(gca,'figure42.jpeg');

%2o erotima
%a)
figure(10);
ts1=0:dts1:Tm;
yq=quantifier(triag(ts1,Tm));     % η συνάρτηση ορίζεται στο τέλος του
scatter(ts1,yq,'.');              % κώδικα, όπου η κβάντιση γίνεται με
ticks=-4:(8/31):4;                % 5 bit, επειδή 7mod2=1
labels=dec2bin(bin2gray(0:1:31,'pam',32));
yticks([ticks]);
yticklabels([labels]);
xlabel('Time [s]');
ylabel('Quantized Amplitude, Gray Coded');
title('Quantized y(t) - mid riser');
legend('Quantized y(t)');
saveas(gca,'figure10.jpeg');
%b)i)
ys1=triag(ts1,Tm);
q=ys1-yq;
std10=std(q(1:10))
std20=std(q(1:20))
snr10=snr(ys1(1:10),q(1:10))
snr20=snr(ys1(1:20),q(1:20))
%c)
polar=dec2bin(bin2gray((yq+4)*(31/8),'pam',32));
polar=polar.';
polar=str2num(polar(:));
polar=reshape(polar,1,[]);
polar=2*polar-1;
z=zeros(1,155);
polar=[polar;z];
polar=reshape(polar(:),1,[]);
f=figure(11);
f.Position=[24 247 1300 420];
stairs(0:1:310,[polar 0]);
xlabel('Time [ms]');
ylabel('Amplitude [V]');
title('Bit Stream - POLAR RZ');
legend('bit stream');
saveas(gca,'figure11.jpeg');

%3o erotima
%a)i)
R=randi([0,1],[1,36]);
Rb=string(R)
m1=reshape(R,2,18).';
Rq=(string(num2str(m1(:,1)))+string(num2str(m1(:,2)))).'
m2=reshape(R,3,12).';
R8=(string(num2str(m2(:,1)))+string(num2str(m2(:,2)))+string(num2str(m2(:,3)))).'
%ii)
f=figure(12);
f.Position=[24 247 1300 420];
fc=1;                           % 3+1+1+9+7+0+9=30, 30%2=0 =>fc=1
Tc=1/fc;
Rb=4;                           % από δεδομένα άσκησης
Tb=1/Rb;
dt=Tc/200;
t=0:dt:9*Tc;
sb=cos((1-R(min(fix(t/Tb)+1,36)))*pi+2*pi*fc.*t);
plot(t,sb);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('BPSK modulation');
legend('modulated bit stream');
saveas(gca,'figure12.jpeg');
f=figure(13);
f.Position=[24 247 1300 420];
Rq=gray2bin(bin2dec(Rq),'psk',4);
sq=cos((-Rq(min(fix(t/(2*Tb))+1,18)))*(pi/2)+2*pi*fc.*t);
plot(t,sq);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('QPSK modulation');
legend('modulated bit stream');
saveas(gca,'figure13.jpeg');
f=figure(14);
f.Position=[24 247 1300 420];
R8=gray2bin(bin2dec(R8),'psk',8);
s8=cos((-R8(min(fix(t/(3*Tb))+1,12)))*(pi/4)+2*pi*fc.*t);
plot(t,s8);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('8-PSK modulation');
legend('modulated bit stream');
saveas(gca,'figure14.jpeg');
%b)
R=7*(2*R-1);        % 7+0+9=16 =>A=1+6=7V
t=0:0.25:9;
figure(15);
stairs(t,[R 0]);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('B-PAM modulation');
legend('modulated bit stream');
saveas(gca,'figure15.jpeg');
%c)
M=2;
con=[];
i=sqrt(-1);
for (n=1:36)
    if R(1,n)==7
        cpoint=exp(-i*((2*pi*0)/M));
    else
        cpoint=exp(-i*((2*pi*1)/M));
    end
    con=[con 3.5*cpoint];
end
figure(16);
scatter(real(con),zeros(1,36),'.');
xlabel('φ1(t)');
title('B-PAM Constellation');
legend('signal constellation');
ylim([-4 4]);
saveas(gca,'figure16.jpeg');
%d)
R5db=awgn(R,5);
imn5=awgn(R,5)-R;
R15db=awgn(R,15);
imn15=awgn(R,15)-R;
figure(17);
stairs(t,[R5db 0]);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('B-PAM with AWGN: Eb/No=5dB');
legend('signal');
saveas(gca,'figure17.jpeg');
figure(18);
stairs(t,[R15db 0]);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('B-PAM with AWGN: Eb/No=15dB');
legend('signal');
saveas(gca,'figure18.jpeg');
%e)
figure(19);
scatter(R5db/2,imn5/2,'.');
xlabel('φ1(t)');
ylabel('Imaginary Part');
title('B-PAM with AWGN: Eb/No=5dB Constellation');
legend('signal constellation');
ylim([-4 4]);
saveas(gca,'figure19.jpeg');
figure(20);
scatter(R15db/2,imn15/2,'.');
xlabel('φ1(t)');
ylabel('Imaginary Part');
ylim([-4 4]);
title('B-PAM with AWGN: Eb/No=15dB Constellation');
legend('signal constellation');
saveas(gca,'figure20.jpeg');
%f)
EbNo=0:1:15;
prob=[];

for n=1:16
    cc=0;
    for k=1:1000000
        poi=2*randi([0,1],[1,1])-1;
        pwn=awgn(poi,EbNo(n));
        if(poi(1,1)*pwn(1,1)<=0)
            cc=cc+1;
        end
    end
    p=cc/1000000;
    prob=[prob p];
end
figure(21);
semilogy(EbNo,prob,'x');
xlabel('Eb/No [dB]');
ylabel('P[error]');
title('Bit Error Probability');
legend('BEP');
saveas(gca,'figure21.jpeg');

%4o erotima
Rb=4;
Tb=1/Rb;
dt=Tb/200;
t=0:dt:36*Tb;
sq=cos((-Rq(min(fix(t/(2*Tb))+1,18)))*(pi/2)+pi/4+2*pi*Rb.*t);
f=figure(22);
f.Position=[24 247 1300 420];
plot(t,sq);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('QPSK (π/4) modulation');
legend('modulated bit stream');
saveas(gca,'figure22.jpeg');
%a)
conq=[];
M=4;
for (n=1:18)
    cpoint=exp(i*((2*pi*Rq(n))/M+pi/4));
    conq=[conq cpoint*0.5];
end
figure(23);
scatter(real(conq),imag(conq),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK (π/4) Constellation');
legend('signal constellation');
ylim([-0.5 0.5]);
xlim([-0.5 0.5]);
saveas(gca,'figure23.jpeg');
%b)
Rq5=awgn(conq,5);
Rq15=awgn(conq,15);
figure(24);
scatter(real(Rq5),imag(Rq5),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK (π/4) with AWGN: Eb/No=5dB Constellation');
legend('signal constellation');
saveas(gca,'figure24.jpeg');
figure(25);
scatter(real(Rq15),imag(Rq15),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK (π/4) with AWGN: Eb/No=15dB Constellation');
legend('signal constellation');
saveas(gca,'figure25.jpeg');
%c)
probq=[];
for n=1:16
    cc=0;
    for k=1:1000000
        poi=exp(i*(randi([0,3])*pi/2+pi/4));
        pwn=awgn(poi,EbNo(n));
        if(real(poi)*real(pwn)<=0 | imag(poi)*imag(pwn)<=0)
            cc=cc+1;
        end
    end
    p=cc/1000000;
    probq=[probq p];
end
figure(26);
semilogy(EbNo,probq,'x');
xlabel('Eb/No [dB]');
ylabel('P[error]');
title('QPSK Bit Error Probability');
legend('BEP');
saveas(gca,'figure26.jpeg');
figure(27);
semilogy(EbNo,prob,'x',EbNo,probq,'o');     % Η BER για το B-PAM σήμα είναι
xlabel('Eb/No [dB]');                       % ίδια με αυτή ενός BPSK
ylabel('P[error]');
title('BPSK and QPSK BEP');
legend('BPSK','QPSK');
saveas(gca,'figure27.jpeg');
%d)
%i)
fileId=fopen('rice_even.txt');
input=fscanf(fileId,'%c');
fclose(fileId);
temp=dec2bin(input).';
seq=str2num(temp(:)).';
%ii) Έχουμε ήδη μια ακολουθία bit, άρα δεν κάνουμε κβάντιση
%iii)
temp=reshape([seq 0],2,1747).';
sqg=abs(temp(:,1)*3-temp(:,2)).';
Rb=1;
Tb=1/Rb;
samp=100;
dt=Tb/samp;
t=0:dt:3494*Tb;
sqg=exp(i*((2*pi*sqg)/4));   % διαμόρφωση QPSK
%iv)
sq5=awgn(sqg,5);             % παραγωγή θορύβου 5dB
sq15=awgn(sqg,15);           % παραγωγή θορύβου 15dB
%v)
rc5=[];
rc15=[];
for (n=1:1747)
    x=real(sq5(n));
    y=imag(sq5(n));
    if(y>x & y>(-x))
        cpoint=1;
    elseif(y>x)
        cpoint=3;
    elseif(y<x & y<(-x))
        cpoint=2;
    else
        cpoint=0;
    end
    rc5=[rc5 cpoint];
end
rc5=reshape(dec2bin(rc5).',3494,1);
rc5(3494)=[];
char(bin2dec(reshape(rc5,7,499).')).';
figure(28);
scatter(real(sq5),imag(sq5),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK with AWGN: Eb/No=5dB Constellation');
legend('signal constellation');
saveas(gca,'figure28.jpeg');
for (n=1:1747)
    x=real(sq15(n));
    y=imag(sq15(n));
    if(y>x & y>(-x))
        cpoint=1;
    elseif(y>x)
        cpoint=3;
    elseif(y<x & y<(-x))
        cpoint=2;
    else
        cpoint=0;
    end
    rc15=[rc15 cpoint];
end
rc15=reshape(dec2bin(rc15).',3494,1);
rc15(3494)=[];
char(bin2dec(reshape(rc15,7,499).')).';
figure(29);
scatter(real(sq15),imag(sq15),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK with AWGN: Eb/No=15dB Constellation');
legend('signal constellation');
saveas(gca,'figure29.jpeg');
%vi)
p5=0;
p15=0;
for (n=1:3493)
    if(str2num(rc5(n))~=seq(n))
        p5=p5+1;
    end
    if(str2num(rc15(n))~=seq(n))
        p15=p15+1;
    end
end
p5=p5/3493
p15=p15/3493
%vii)
filename = 'rice_even_5db.txt';
fid = fopen(filename,'w');
fprintf(fid,'%s',char(bin2dec(reshape(rc5,7,499).')).');      
fclose(fid);
filename = 'rice_even_15db.txt';
fid = fopen(filename,'w');
fprintf(fid,'%s',char(bin2dec(reshape(rc15,7,499).')).');      
fclose(fid);

%5o erotima
%a)
[input,fs]=audioread('soundfile2_lab2.wav');
t=(0:1:length(input)-1)/44100;
f=figure(30);
f.Position=[24 247 1300 420];
plot(t,input);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('soundfile2');
legend('sound signal');
saveas(gca,'figure30.jpeg');
%b)
m=max(abs(input));
[inqu RR]=quant8(input,m);    % η συνάρτηση βρίσκεται στο τέλος του κώδικα
Rq=de2bi(RR).';               % μετατροπή κβαντισμένου σήματος σε bit
Rq=Rq(:).';
f=figure(31);
f.Position=[24 247 1300 420];
plot(t,inqu);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Quantized soundfile2');
legend('quantized sound signal');
saveas(gca,'figure31.jpeg');
%c)
temp=reshape(Rq,2,length(Rq)/2).';
Rqg=abs(temp(:,1)*3-temp(:,2)).';
Rqg=exp(i*((2*pi*Rqg)/4));    % διαμόρφωση QPSK
%d)
Rq4=awgn(Rqg,4);              % παραγωγή θορύβου 4dB
Rq14=awgn(Rqg,14);            % παραγωγή θορύβου 14dB
%e)
de4=[];
for (n=1:length(Rq4))
    x=real(Rq4(n));
    y=imag(Rq4(n));
    if(y>x & y>(-x))
        cpoint=1;
    elseif(y>x)
        cpoint=3;
    elseif(y<x & y<(-x))
        cpoint=2;
    else
        cpoint=0;
    end
    de4(n)=cpoint;
end
de4=reshape(dec2bin(de4,2).',2*length(Rq4),1);
figure(32);
scatter(real(Rq4),imag(Rq4),'.');
ylim([-4 4]);
xlim([-4 4]);
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK with AWGN: Eb/No=4dB Constellation');
legend('signal constellation');
saveas(gca,'figure32.jpeg');

de14=[];
for (n=1:length(Rq14))
    x=real(Rq14(n));
    y=imag(Rq14(n));
    if(y>x & y>(-x))
        cpoint=1;
    elseif(y>x)
        cpoint=3;
    elseif(y<x & y<(-x))
        cpoint=2;
    else
        cpoint=0;
    end
    de14(n)=cpoint;
end
de14=reshape(dec2bin(de14,2).',2*length(Rq14),1);
figure(33);
scatter(real(Rq14),imag(Rq14),'.');
xlabel('φ1(t)');
ylabel('φ2(t)');
title('QPSK with AWGN: Eb/No=14dB Constellation');
legend('signal constellation');
saveas(gca,'figure33.jpeg');
%f)
p4=0;
p14=0;
for (n=1:length(de14))
    if(str2num(de4(n))~=Rq(n))
        p4=p4+1;
    end
    if(str2num(de14(n))~=Rq(n))
        p14=p14+1;
    end
end
p4=p4/length(de14)
p14=p14/length(de14)

%g)
quant=2*m/255;
de4=reshape(str2num(de4(:)),8,265842).';
out4=bi2de(de4)*quant-m;
f=figure(34);
f.Position=[24 247 1300 420];
plot(t,out4);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Reconstructed soundfile2 with AWGN: Eb/No=4dB');
legend('reconstructed sound signal');
saveas(gca,'figure34.jpeg');

de14=reshape(str2num(de14(:)),8,265842).';
out14=bi2de(de14)*quant-m;
f=figure(35);
f.Position=[24 247 1300 420];
plot(t,out14);
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Reconstructed soundfile2 with AWGN: Eb/No=14dB');
legend('reconstructed sound signal');
saveas(gca,'figure35.jpeg');

sound(out4,fs);
pause(7);
sound(out14,fs);
audiowrite('soundfile2_lab2_4db.wav',out4,fs);
audiowrite('soundfile2_lab2_14db.wav',out14,fs);

function [y t]=quant8(x,m)
    step=(2*m)/256;
    quant=(2*m)/255;
    t=min(fix((x+m)/step),255);
    y=t*quant-m;
end


function [y]= triag(x,T)
    y=triangularPulse(0,T,mod(x,T));
    y=8*y-4;
end
function [y]=quantifier(x)
    step=8/32;
    quant=8/31;
    t=min(fix((x+4)/step),31);
    y=t*quant-4;
end
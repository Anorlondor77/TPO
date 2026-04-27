clear; clc; close all;

PTX = 20;
GTX = 6;
GRX = 3;
f = 2.4e9;
c = 3e8;

d = 1:1000;
lambda = c/f;
PR_dBm = PTX + GTX + GRX + 20*log10(lambda./(4*pi*d));
x = 10*log10(d);
PR_mW = 10.^(PR_dBm/10);

figure;
plot(x,PR_dBm);
grid on;
xlabel('x = 10log10(d)');
ylabel('P_R [dBm]');
title('P_R(dBm) vs 10log10(d)');

figure;
plot(d,PR_dBm);
grid on;
xlabel('d [m]');
ylabel('P_R [dBm]');
title('P_R(dBm) vs d');

figure;
plot(d,PR_mW);
grid on;
xlabel('d [m]');
ylabel('P_R [mW]');
title('P_R(mW) vs d');

S = load('mesura_0_15m.mat');
d = S.d(:);
p = S.p(:);
x = 10*log10(d);
coef = polyfit(x,p,1);
p_est = polyval(coef,x);
m = coef(1);
b = coef(2);
A = b;
n = -m;
R2 = 1 - sum((p - p_est).^2)/sum((p - mean(p)).^2);

figure;
plot(x,p,'o',x,p_est,'-');
grid on;
xlabel('x = 10log10(d)');
ylabel('p [dBm]');
title('Regressio lineal - altura 0.15 m');
legend('Mesurat','Ajust lineal');

S = load('mesura_2m.mat');
d = S.d(:);
p = S.p(:);
x = 10*log10(d);
coef = polyfit(x,p,1);
p_est = polyval(coef,x);
m = coef(1);
b = coef(2);
A = b;
n = -m;
R2 = 1 - sum((p - p_est).^2)/sum((p - mean(p)).^2);

figure;
plot(x,p,'o',x,p_est,'-');
grid on;
xlabel('x = 10log10(d)');
ylabel('p [dBm]');
title('Regressio lineal - altura 2 m');
legend('Mesurat','Ajust lineal');

d = [0.25 0.5 0.75 1 1.5 2 2.5 3 3.5]';
p_h = [-11.1 -15.35 -19.41 -20.8 -23.51 -27.66 -29.4 -30.8 -31.5]';
p_v = [-11.23 -14.5 -17.31 -19.28 -22.38 -25.76 -26.46 -31 -25.73]';

x = 10*log10(d);
coef = polyfit(x,p_v,1);
p_est = polyval(coef,x);
m = coef(1);
b = coef(2);
A = b;
n = -m;
R2 = 1 - sum((p_v - p_est).^2)/sum((p_v - mean(p_v)).^2);

figure;
plot(x,p_v,'o',x,p_est,'-');
grid on;
xlabel('x = 10log10(d)');
ylabel('p [dBm]');
title('Mesures experimentals - polaritzacio vertical');
legend('Mesurat','Ajust lineal');

coef = polyfit(x,p_h,1);
p_est = polyval(coef,x);
m = coef(1);
b = coef(2);
A = b;
n = -m;
R2 = 1 - sum((p_h - p_est).^2)/sum((p_h - mean(p_h)).^2);

figure;
plot(x,p_h,'o',x,p_est,'-');
grid on;
xlabel('x = 10log10(d)');
ylabel('p [dBm]');
title('Mesures experimentals - polaritzacio horitzontal');
legend('Mesurat','Ajust lineal');

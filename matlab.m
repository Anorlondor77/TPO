%% ==============================
%% SCRIPT 1: STUDY PREVIEW (FRIIS)
%% ==============================

clear; clc; close all;

PTX_dBm = 20;
GTX_dB  = 6;
GRX_dB  = 3;
f = 2.4e9;
c = 3e8;

lambda = c/f;

d = 1:1000;

PR_dBm = PTX_dBm + GTX_dB + GRX_dB + 20*log10(lambda./(4*pi*d));

x_log = 10*log10(d);

PR_mW = 10.^(PR_dBm/10);

figure;
plot(x_log, PR_dBm,'LineWidth',1.5); grid on;
xlabel('10log10(d)'); ylabel('P_R [dBm]');
title('PR vs log(d)');

figure;
plot(d, PR_dBm,'LineWidth',1.5); grid on;
xlabel('d [m]'); ylabel('P_R [dBm]');
title('PR vs d');

figure;
plot(d, PR_mW,'LineWidth',1.5); grid on;
xlabel('d [m]'); ylabel('P_R [mW]');
title('PR vs d (mW)');

%% ==============================
%% SCRIPT 2: REGRESSION (.mat)
%% ==============================

S1 = load('mesura_0_15m.mat');
d1 = S1.d(:);
p1 = S1.p(:);

x1 = 10*log10(d1);

coef1 = polyfit(x1,p1,1);
p1_est = polyval(coef1,x1);

m1 = coef1(1);
b1 = coef1(2);
A1 = b1;
n1 = -m1;

R2_1 = 1 - sum((p1 - p1_est).^2)/sum((p1 - mean(p1)).^2);

figure;
plot(x1,p1,'b*'); hold on;
plot(x1,p1_est,'r','LineWidth',1.5);
grid on;
xlabel('10log10(d)'); ylabel('p [dBm]');
title('mesura 0.15 m');
legend('data','fit');

S2 = load('mesura_2m.mat');
d2 = S2.d(:);
p2 = S2.p(:);

x2 = 10*log10(d2);

coef2 = polyfit(x2,p2,1);
p2_est = polyval(coef2,x2);

m2 = coef2(1);
b2 = coef2(2);
A2 = b2;
n2 = -m2;

R2_2 = 1 - sum((p2 - p2_est).^2)/sum((p2 - mean(p2)).^2);

figure;
plot(x2,p2,'b*'); hold on;
plot(x2,p2_est,'r','LineWidth',1.5);
grid on;
xlabel('10log10(d)'); ylabel('p [dBm]');
title('mesura 2 m');
legend('data','fit');

%% ==============================
%% SCRIPT 3: LAB DATA
%% ==============================

d = [0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3]';

p_v = [-12.64 -17.14 -21.43 -23.71 -25.1 -27 -28.95 -30.3 -31.74 -32.21 -33.79 -38.41]';
p_h = [-12.31 -16.64 -19.84 -23.14 -24.59 -25.72 -26.34 -27.8 -30.78 -28.48 -29.21 -33.78]';

x = 10*log10(d);

% Vertical
coef_v = polyfit(x,p_v,1);
p_v_est = polyval(coef_v,x);

m_v = coef_v(1);
b_v = coef_v(2);
A_v = b_v;
n_v = -m_v;

R2_v = 1 - sum((p_v - p_v_est).^2)/sum((p_v - mean(p_v)).^2);

figure;
plot(x,p_v,'b*'); hold on;
plot(x,p_v_est,'r','LineWidth',1.5);
grid on;
xlabel('10log10(d)'); ylabel('p [dB]');
title('vertical');
legend('data','fit');

% Horizontal
coef_h = polyfit(x,p_h,1);
p_h_est = polyval(coef_h,x);

m_h = coef_h(1);
b_h = coef_h(2);
A_h = b_h;
n_h = -m_h;

R2_h = 1 - sum((p_h - p_h_est).^2)/sum((p_h - mean(p_h)).^2);

figure;
plot(x,p_h,'b*'); hold on;
plot(x,p_h_est,'r','LineWidth',1.5);
grid on;
xlabel('10log10(d)'); ylabel('p [dB]');
title('horizontal');
legend('data','fit');

T = 0.005; 
Fs = 1 / T;
disp("Tần số lấy mẫu A/D: Fs = " + string(Fs) + " Hz");

F1 = 50; 
F2 = 125;
disp("Tần số đầu vào: F1 = 50 Hz, F2 = 125 Hz");

if Fs < F1*2 then
    disp("Tín hiệu F1 bị aliasing");
    k1 = round(F1 / Fs);
    F1_alias = abs(F1 - k1 * Fs); 
    disp("Tần số alias = |F1 - k*Fs| = |" + string(F1) + " - " + string(k1) + "*" + string(Fs) + "| = " + string(F1_alias) + " Hz");
else
    disp("Tín hiệu F1 không bị aliasing.");
    F1_alias = F1;
end
if Fs < F2*2 then
    disp("Tín hiệu F2 bị aliasing");
    k2 = round(F2 / Fs);
    F2_alias = abs(F2 - k2 * Fs); 
    disp("Tần số alias = |F2 - k*Fs| = |" + string(F2) + " - " + string(k2) + "*" + string(Fs) + "| = " + string(F2_alias) + " Hz");
else
    disp("Tín hiệu F2 không bị aliasing.");
    F2_alias = F2;
end

T_prime = 0.001;
Fs_prime = 1 / T_prime;
disp("Tần số lấy mẫu D/A: Fs'' = " + string(Fs_prime) + " Hz");


F1_out = F1_alias * Fs_prime / Fs;
F2_out = F2_alias * Fs_prime / Fs;
disp("Tần số ngõ ra sau D/A: F1_out = " + string(F1_out) + " Hz, F2_out = " + string(F2_out) + " Hz");
disp("Cả hai tần số đều < " + string(Fs_prime/2) + " Hz nên đều đi qua được Postfilter.");

t = 0:0.0001:0.04;
n = 0:8;
ts = n * T;

xa = 3 * cos(100 * %pi * t) + 2 * sin(250 * %pi * t);
x_n = 3 * cos(2 * %pi * (F1_alias/Fs) * n) - 2 * sin(2 * %pi * (F2_alias/Fs) * n);
ya = 3 * cos(2 * %pi * F1_out * t) - 2 * sin(2 * %pi * F2_out * t);

clf();


subplot(3, 1, 1);
plot(t, zeros(t), 'k-');
plot(t, xa, 'b');
title("$x_a(t) = 3cos(100 \pi t) + 2sin(250 \pi t) $");
xlabel("Thời gian t (s)"); ylabel("Biên độ");


subplot(3, 1, 2);
plot(ts, zeros(ts), 'k-');
plot(ts, x_n, 'ko');
plot2d3(ts, x_n);
title("$x(n) = 3cos(\pi n/2) - 2sin(3\pi n/4)$");
xlabel("Thời gian t (s)"); ylabel("Biên độ");

subplot(3, 1, 3);
plot(t, zeros(t), 'k-');
plot(t, ya, 'r');
title("$y_a(t) = 3cos(500\pi t) - 2sin(750\pi t)$");
xlabel("Thời gian t (s)"); ylabel("Biên độ");

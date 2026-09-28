Fmax = 10;
disp("Khoảng tần số lấy mẫu Fs > Fmax * 2 = 10 * 2 = " + string(2 * Fmax) + " kHz");
Fs = 8;

t = 0:0.001:2;
n = 0:16;
ts = n / Fs;

F1 = 5; 
if Fs < F1*2 then
    disp("Tín hiệu F1 bị aliasing");
    k1 = round(F1 / Fs);
    F1_alias = abs(F1 - k1 * Fs); 
    disp("Tần số alias = |F1 - k*Fs| = |" + string(F1) + " - " + string(k1) + "*" + string(Fs) + "| = " + string(F1_alias) + " kHz");
else
    disp("Tín hiệu F1 không bị aliasing.");
    F1_alias = F1;
end


x1_c = cos(2 * %pi * F1 * t);
x1_alias_c = cos(2 * %pi * F1_alias * t);
x1_s = cos(2 * %pi * F1 * ts);


F2 = 9; 
if Fs < F2*2 then
    disp("Tín hiệu F2 bị aliasing");
    k2 = round(F2 / Fs);
    F2_alias = abs(F2 - k2 * Fs); 
    disp("Tần số alias = |F2 - k*Fs| = |" + string(F2) + " - " + string(k2) + "*" + string(Fs) + "| = " + string(F2_alias) + " kHz");
else
    disp("Tín hiệu F2 không bị aliasing.");
    F2_alias = F2;
end

x2_c = cos(2 * %pi * F2 * t);
x2_alias_c = cos(2 * %pi * F2_alias * t);
x2_s = cos(2 * %pi * F2 * ts);


clf();

subplot(2, 1, 1);
plot(t, x1_c, 'b');
plot(t, x1_alias_c, 'r--');
plot(ts, x1_s, 'ko');
plot2d3(ts, x1_s);
plot(t, zeros(t), 'k-');
title("Tín hiệu F1 = 5 kHz chồng chập với tín hiệu Alias = 3 kHz");
xlabel("Thời gian t (ms)"); ylabel("Biên độ");
legend(['F1 = 5 kHz', 'Alias = 3 kHz', 'Mẫu rời rạc (Fs = 8 kHz)']);


subplot(2, 1, 2);
plot(t, x2_c, 'b');
plot(t, x2_alias_c, 'r--');
plot(ts, x2_s, 'ko');
plot2d3(ts, x2_s);
plot(t, zeros(t), 'k-');
title("Tín hiệu F2 = 9 kHz chồng chập với tín hiệu Alias = 1 kHz");
xlabel("Thời gian t (ms)"); ylabel("Biên độ");
legend(['F2 = 9 kHz', 'Alias = 1 kHz', 'Mẫu rời rạc (Fs = 8 kHz)']);

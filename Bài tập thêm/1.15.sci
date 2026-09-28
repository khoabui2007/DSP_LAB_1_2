Fs_a = 5; n = 0:99;
F0_arr = [0.5, 2, 3, 4.5];
clf;
for i = 1:4
    f = F0_arr(i) / Fs_a;
    x = sin(2 * %pi * f * n);
    subplot(2, 2, i);
    plot2d3(n, x);
    title("F0 = " + string(F0_arr(i)) + " kHz");
end


figure;
Fs_b = 50; F0_b = 2;
f0_b = F0_b / Fs_b;
x_b = sin(2 * %pi * f0_b * n);
y_b = x_b(1:2:$);
n_y = 0:(length(y_b)-1);

subplot(2,1,1);
plot2d3(n, x_b); title("x(n) với F0=2kHz, Fs=50kHz");
subplot(2,1,2);
plot2d3(n_y, y_b); title("y(n) = x(2n)");

// 1. Tin hieu goc x(n)
n_x = -2:1;
x = [1, -2, 3, 6];

// 2. Biien doi y3(n) = 2*x(-n-2)
n_y3 = -n_x($:-1:1) - 2; // n_y3 thuoc [-3, 0]
y3 = 2 * x($:-1:1);

clf;

// Ve x(n)
subplot(2, 1, 1);
plot2d3(n_x, x); plot(n_x, x, 'r.');
gca().data_bounds = [-4, -6; 2, 14];
title("Tín hiệu gốc x(n)");
xlabel("n"); ylabel("x(n)");

// Ve y3(n)
subplot(2, 1, 2);
plot2d3(n_y3, y3); plot(n_y3, y3, 'r.');
gca().data_bounds = [-4, -6; 2, 14];
title("Tín hiệu đảo, dời, và giãn biên độ y3(n) = 2x(-n-2)");
xlabel("n"); ylabel("y3(n)");

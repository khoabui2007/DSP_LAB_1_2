// 1. Tin hieu goc x(n)
n_x = -2:1;
x = [1, -2, 3, 6];

// 2. Tin hieu dich y2(n) = x(n+3)
n_y2 = n_x - 3; // n_y2 thuoc [-5, -2]
y2 = x;

clf;

// Ve x(n)
subplot(2, 1, 1);
plot2d3(n_x, x); plot(n_x, x, 'r.');
gca().data_bounds = [-6, -5; 2, 8];
title("Tín hiệu gốc x(n)");
xlabel("n"); ylabel("x(n)");

// Ve y2(n)
subplot(2, 1, 2);
plot2d3(n_y2, y2); plot(n_y2, y2, 'r.');
gca().data_bounds = [-6, -5; 2, 8];
title("Tín hiệu dời thời gian y2(n) = x(n+3)");
xlabel("n"); ylabel("y2(n)");

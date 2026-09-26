n = -1:3;

x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];

y = x1 .* x2;

clf;

// 1. Ve tin hieu x1(n)
subplot(3, 1, 1);
plot2d3(n, x1); plot(n, x1, 'r.');
gca().data_bounds = [-2, -3; 4, 7];
title("Tín hiệu x1(n)");
xlabel("n"); ylabel("x1(n)");

// 2. Ve tin hieu x2(n)
subplot(3, 1, 2);
plot2d3(n, x2); plot(n, x2, 'r.');
gca().data_bounds = [-2, -3; 4, 7];
title("Tín hiệu x2(n)");
xlabel("n"); ylabel("x2(n)");

// 3. Ve tin hieu tong y(n)
subplot(3, 1, 3);
plot2d3(n, y); plot(n, y, 'r.');
gca().data_bounds = [-2, -1; 4, 10];
title("Tín hiệu tích y(n) = x1(n) . x2(n)");
xlabel("n"); ylabel("y(n)");

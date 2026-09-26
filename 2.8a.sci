// 1. Tinh hieu goc x(n) voi n trong [-2, 1]
n_x = -2:1;
x = [1, -2, 3, 6];

// 2. Tin hieu dao y1(n) = x(-n)
n_y1 = -n_x($:-1:1); // Hoac n_y1 = -1:2
y1 = x($:-1:1);

clf;

// Ve x(n)
subplot(2, 1, 1);
plot2d3(n_x, x); plot(n_x, x, 'r.');
gca().data_bounds = [-3, -5; 3, 8];
title("Tín hiệu gốc x(n)");
xlabel("n"); ylabel("x(n)");

// Ve y1(n)
subplot(2, 1, 2);
plot2d3(n_y1, y1); plot(n_y1, y1, 'r.');
gca().data_bounds = [-3, -5; 3, 8];
title("Tín hiệu đảo thời gian y1(n) = x(-n)");
xlabel("n"); ylabel("y1(n)");

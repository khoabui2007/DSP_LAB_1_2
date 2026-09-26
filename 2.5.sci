// Định nghĩa trục thời gian n và tín hiệu x(n)
n = -1:1;
x = [1, 3, -2];

// Đảo ngược mảng x để tạo tín hiệu đảo thời gian x(-n)
x_reflect = x($:-1:1);

// Tính thành phần chẵn xe(n) và thành phần lẻ xo(n)
xe = 0.5 * (x + x_reflect);
xo = 0.5 * (x - x_reflect);

// Xóa đồ thị cũ
clf;

// 1. Vẽ tín hiệu x(n)
subplot(3, 1, 1);
plot2d3(n, x); plot(n, x, 'r.');
gca().data_bounds = [-2, -3; 2, 4]; // [xmin, ymin; xmax, ymax]
title("Tín hiệu rời rạc thời gian x(n)");
xlabel("n"); ylabel("x(n)");

// 2. Vẽ thành phần chẵn xe(n)
subplot(3, 1, 2);
plot2d3(n, xe); plot(n, xe, 'r.');
gca().data_bounds = [-2, -3; 2, 4];
title("Thành phần chẵn xe(n)");
xlabel("n"); ylabel("xe(n)");

// 3. Vẽ thành phần lẻ xo(n)
subplot(3, 1, 3);
plot2d3(n, xo); plot(n, xo, 'r.');
gca().data_bounds = [-2, -3; 2, 4];
title("Thành phần lẻ xo(n)");
xlabel("n"); ylabel("xo(n)");

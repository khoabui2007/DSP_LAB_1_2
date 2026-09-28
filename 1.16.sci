N = 200;
n = 0:N-1;
f0 = 1/50;
x = sin(2 * %pi * f0 * n);
Px = sum(x.^2) / N;

disp("Px = " + string(Px));
disp(" ");

L_levels = [64, 128, 256];
idx_plot = 1:51; 
n_plot = n(idx_plot);
x_plot = x(idx_plot);

scf(1); clf();
f1 = gcf(); 
f1.figure_name = "Truncation";

for i = 1:length(L_levels)
    L = L_levels(i);
    b = log2(L);
    delta = 2 / L;
    
    xq_trunc = floor(x / delta) * delta;
    e_trunc = xq_trunc - x;
    Pq_trunc = sum(e_trunc.^2) / N;
    SQNR_trunc = 10 * log10(Px / Pq_trunc);
    SQNR_theo = 1.76 + 6.02 * b;
    
    disp("Truncation - L = " + string(L) + ":");
    disp("SQNR thuc nghiem = " + string(SQNR_trunc) + " dB");
    disp("SQNR ly thuyet   = " + string(SQNR_theo) + " dB");
    disp(" ");
    
    xq_trunc_plot = xq_trunc(idx_plot);
    e_trunc_plot = e_trunc(idx_plot);
    
    subplot(3, 3, i);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, x_plot); plot(n_plot, x_plot, 'ko');
    title("x(n) [L = " + string(L) + "]");
    
    subplot(3, 3, i + 3);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, xq_trunc_plot); plot(n_plot, xq_trunc_plot, 'ko');
    title("xq(n) - Trunc");
    
    subplot(3, 3, i + 6);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, e_trunc_plot); plot(n_plot, e_trunc_plot, 'ro');
    title("e(n) - Trunc");
end

scf(2); clf();
f2 = gcf(); 
f2.figure_name = "Rounding";

for i = 1:length(L_levels)
    L = L_levels(i);
    b = log2(L);
    delta = 2 / L;
    
    xq_round = round(x / delta) * delta;
    e_round = xq_round - x;
    Pq_round = sum(e_round.^2) / N;
    SQNR_round = 10 * log10(Px / Pq_round);
    SQNR_theo = 1.76 + 6.02 * b;
    
    disp("Rounding - L = " + string(L) + ":");
    disp("SQNR thuc nghiem = " + string(SQNR_round) + " dB");
    disp("SQNR ly thuyet   = " + string(SQNR_theo) + " dB");
    disp(" ");
    
    xq_round_plot = xq_round(idx_plot);
    e_round_plot = e_round(idx_plot);
    
    subplot(3, 3, i);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, x_plot); plot(n_plot, x_plot, 'ko');
    title("x(n) [L = " + string(L) + "]");
    
    subplot(3, 3, i + 3);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, xq_round_plot); plot(n_plot, xq_round_plot, 'ko');
    title("xq(n) - Round");
    
    subplot(3, 3, i + 6);
    plot(n_plot, zeros(n_plot), 'k-'); plot2d3(n_plot, e_round_plot); plot(n_plot, e_round_plot, 'ro');
    title("e(n) - Round");
end

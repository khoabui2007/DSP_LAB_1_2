function Np = cal_Np(k, N)
    g = gcd(int32([k, N]));
    Np = N / double(g);
endfunction

disp("Với N = 7:");
for k = 0:7
    disp("k = " + string(k) + " -> Np = " + string(cal_Np(k, 7)));
end

disp("Với N = 16:");
for k = 0:16
    disp("k = " + string(k) + " -> Np = " + string(cal_Np(k, 16)));
end

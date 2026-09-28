function check_periodicity(omega, signal)
    f0 = omega / (2 * %pi);
    [a, b] = rat(f0, 1e-6);
    disp("Tín hiệu " + signal + ":");
    if abs(f0 - a/b) < 1e-10 then
        disp("Tần số f0 = " + string(a) + "/" + string(b));
        disp("Tuần hoàn với chu kỳ N = " + string(b));
    else
        disp("Tần số f0 = " + string(f0));
        disp("Không tuần hoàn.");
        
    end
endfunction

check_periodicity(0.01 * %pi, "(a)");
check_periodicity(%pi * 30 / 105, "(b)");
check_periodicity(3 * %pi, "(c)");
check_periodicity(3, "(d)");
check_periodicity(%pi * 62 / 10, "(e)");

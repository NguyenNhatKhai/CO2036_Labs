clf

x = [0 : 0.1 : 2 * %pi]'

subplot(3, 1, 1)
title("plot2d2")
xlabel("x")
ylabel("sin(x)")
plot2d2(x, sin(x))

subplot(3, 1, 2)
title("plot2d3")
xlabel("x")
ylabel("sin(x)")
plot2d3(x, sin(x))

subplot(3, 1, 3)
title("plot2d4")
xlabel("x")
ylabel("sin(x)")
plot2d4(x, sin(x))

disp(min(x))
disp(max(x))

disp(bool2s([1 0 -1]))

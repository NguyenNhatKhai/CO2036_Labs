clf

function y_a = x_a(t)
    y_a = 3 * sin(100 * %pi * t)
endfunction
T = 1/50
t = 0 : 1e-6 : 5 * T
subplot(3, 1, 1)
plot(t, x_a)

function y = x(n)
    y = 3 * sin(1 / 3 * %pi * n)
endfunction
N = 6
n = 0 : 5 * N
subplot(3, 1, 2)
plot(n, x, "r")
disp(x)

x_max = max(x(n))
x_min = min(x(n))
function y_q = x_q(n)
    y_q = ceil(x(n) / 0.1) * 0.1
endfunction
subplot(3, 1, 3)
plot(n, x_q, "y")

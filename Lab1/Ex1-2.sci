clf
/* Step 1: Use SciLab to draw x_a (t) in 5 periods.*/
function x = x_a(t)
    x = 3 *sin(100 * %pi* t);
endfunction
F = 50;
k = 5;
t = linspace(0, (1/F)*k, 50*k + 1);
subplot(3, 1, 1);
plot(t, x_a, "r");
xtitle("x_a(t) = 3 sin (100 %pi t)", "t", "x_a");



/*Step 2: Determine the discrete-time signal x(n) 
of the signal x_a (t) that is sampled with 
a sampling rate Fs = 300 samples/s.*/
function x = x_n(n)
    x = 3 * sin(%pi / 3 * n)
endfunction
Fs = 300;
f = F/Fs;

/* Step 3: Determine the discrete-time signal x(n) and determine the periodic
 property of x(n). If x(n) is a periodic signal, determine the frequency 
 and period of x(n). Then, use SciLab to draw x(n) in 5 periods.*/
/* We have: N = k' / f and we were able to find No=6, with k'=1.
Therefore it's periodic*/
n = linspace(0, (1/f)*k, (1/f)*k + 1);
subplot(3, 1, 2);
plot(n, x_n, "*-b");
xtitle("x_n(n) = 3 sin ((%pi / 3) * n)", "n", "x_n");



/*Step 4: Determine the quantized signal xq(n) if ∆=0.1 using 
    a truncated method. Then, draw xq(n) in 5 periods.*/
function x = x_q(n)
    range = 0:6
    Y_max = max(x_n(range))
    Y_min = min(x_n(range))
    delta = 0.1
    x = floor((x_n(n)-Y_min)/delta)*delta + Y_min;
endfunction
subplot(3, 1, 3);
xtitle("x_q(n) = floor((x_n(n)-Y_min)/delta)*delta + Y_min", "n", "x_q");
plot(n, x_q, "<-g");

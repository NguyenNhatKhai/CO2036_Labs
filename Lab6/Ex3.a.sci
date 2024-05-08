
omega = -%pi : 1e-3 : %pi

deff("msignal = X(omega)", "msignal = sqrt(((1 - 0.1 * cos(omega)) / (1 - 0.2 * cos(omega) + 0.01))^2 + ((-0.1 * sin(omega)) / (1 - 0.2 * cos(omega) + 0.01))^2)")
subplot(2, 1, 1)
plot(omega, X)

deff("msignal = Theta(omega)", "msignal = atan((-0.1 * sin(omega)) / (1 - 0.1 * cos(omega)))")
subplot(2, 1, 2)
plot(omega, Theta)


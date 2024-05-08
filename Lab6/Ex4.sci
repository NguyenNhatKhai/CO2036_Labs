clf
// Frequency range
omega = -%pi : 1e-3 : %pi

// Visualize: Amplitude Spectrum
deff("msignal = X(omega)", "msignal = (1)./sqrt((1 + 0.1*cos(-omega) + 0.2*cos(-2*omega)).^2 + (0.1*sin(-omega) + 0.2*(sin(-2*omega))).^2)");
subplot(1, 2, 1);
plot(omega, X);
title("Amplitude Spectrum");
xlabel("w");
ylabel("|H(w)|");

// Visualize: Phase Spectrum
deff("msignal = Theta(omega)", "msignal = -atan((0.1*sin(-omega) + 0.2*sin(-2*omega))./(1 + 0.1*cos(-omega) + 0.2*cos(-2*omega)))");
subplot(1, 2, 2);
plot(omega, Theta);
title("Phase Spectrum");
xlabel("w");
ylabel("Theta(X(w))");

clf
// Frequency range
omega = -%pi : 1e-3 : %pi

// Visualize: Amplitude Spectrum
deff("msignal = X(omega)", "msignal = sqrt(((1 - 0.1 * cos(omega)) / (1 - 0.2 * cos(omega) + 0.01))^2 + ((-0.1 * sin(omega)) / (1 - 0.2 * cos(omega) + 0.01))^2)");
subplot(1, 2, 1);
plot(omega, X);
title("Amplitude Spectrum");
xlabel("w");
ylabel("|X(w)|");

// Visualize: Phase Spectrum
deff("msignal = Theta(omega)", "msignal = atan((-0.1 * sin(omega)) / (1 - 0.1 * cos(omega)))");
subplot(1, 2, 2);
plot(omega, Theta);
title("Phase Spectrum");
xlabel("w");
ylabel("Theta(X(w))");

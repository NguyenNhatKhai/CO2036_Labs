clf
// Frequency range
omega = -%pi : 1e-3 : %pi

// Visualize: Amplitude Spectrum
deff("msignal = X(omega)", "msignal = sqrt((1 + cos(omega) + cos(2*omega) + cos(3*omega)).^2 + (-sin(omega) - sin(2*omega) - sin(3*omega)).^2)");
subplot(1, 2, 1);
plot(omega, X);
title("Amplitude Spectrum");
xlabel("w");
ylabel("|X(w)|");

// Visualize: Phase Spectrum
deff("msignal = Theta(omega)", "msignal = atan((-sin(omega) - sin(2*omega) - sin(3*omega))./(1 + cos(omega) + cos(2*omega) + cos(3*omega)))");
subplot(1, 2, 2);
plot(omega, Theta);
title("Phase Spectrum");
xlabel("w");
ylabel("Theta(X(w))");

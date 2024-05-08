clf
// Frequency range
omega = -%pi : 1e-3 : %pi

// Visualize: Amplitude Spectrum
deff("msignal = X(omega)", "msignal = sqrt(((0.5 + 0.5*cos(omega))./(1.25 - cos(omega))).^2 + ((-1.5*sin(omega))./(1.25 - cos(omega))).^2)");
subplot(1, 2, 1);
plot(omega, X);
title("Amplitude Spectrum");
xlabel("w");
ylabel("|Y(w)|");

// Visualize: Phase Spectrum
deff("msignal = Theta(omega)", "msignal = atan((-1.5*sin(omega))./(0.5 + 0.5*cos(omega)))");
subplot(1, 2, 2);
plot(omega, Theta);
title("Phase Spectrum");
xlabel("w");
ylabel("Theta(X(w))");

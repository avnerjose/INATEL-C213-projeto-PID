sys = tf([5], [146.1, 1], 'InputDelay', 11.9);

PID_CHRcom = pidstd(1.75, 198.2577, 5.6287);

RespostaCHRcom = feedback(sys*PID_CHRcom, 1);

grid on
step(RespostaCHRcom*4);
legend('CHR com sobressinal com ajuste fino')
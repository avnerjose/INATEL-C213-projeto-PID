sys = tf([5], [146.1, 1], 'InputDelay', 11.9);

PID_IMC = pidstd(1.088, 152.15, 5.717);

RespostaIMC = feedback(sys*PID_IMC, 1);

grid on
step(RespostaIMC*4);
legend('IMC')

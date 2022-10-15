k = 5;
t = 146.1;
o = 11.9;
sys = tf([5], [146.1, 1], 'InputDelay', 11.9)

Kp = (0.95*t)/(k*o)

Ti = 1.357*t

Td = 0.473*o

PIDCHRcom = pidstd(Kp,Ti,Td);

RespostaCHRcom = feedback(sys*PIDCHRcom,1);

grid on
step(RespostaCHRcom * 4)
legend('CHRcom')
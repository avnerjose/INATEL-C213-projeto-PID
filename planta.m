load('dados.mat')
sys = sys4;
sys_tangente = tf(5,[160.6 1], 'InputDelay', 12.4);
sys_smith = tf(5, [146.1 1], 'InputDelay', 11.9);

hold on
step(sys)
step(sys_tangente)
step(sys_smith)

legend('Sinal original', 'Método Tangete','Método Smith')


                                 

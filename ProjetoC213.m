% Levantando a função de transferência do grupo 4
load ('dados.mat')
sys = sys4;
%% 

% Utilizando o método de identificação Tangente e Smith
sys_tangente = tf(5, [160.6 1], 'InputDelay', 12.4);
sys_smith = tf(5, [146.1 1], 'InputDelay', 11.9);
hold on
step (sys)
step(sys_tangente)
step (sys_smith)
legend ('Sinal original', 'Método Tangete', 'Método Smith')
hold off
%% 

% Valores de k, t e o que serão utilizados retirados do método Smith
k = 5;
t = 146.1;
o = 11.9;
sys = tf(5, [146.1, 1], 'InputDelay', 11.9);
%% 

% Controlador PID pela técnica IMC
lambda = 20.23;
KpIMC = (2*t*o)/(k*(2*lambda+o));
TiIMC = t+0/2;
TdIMC = (t*0)/(2*t+o);
PIDIMC = pidstd (KpIMC,TiIMC,TdIMC);
RespostaIMC = feedback(sys*PIDIMC,1);
grid on
step (RespostaIMC*4)
legend ('IMC')
%% 

% Controlador PID pela técnica CHR com Sobressinal
KpCHRcom = (0.95*t)/ (k*o);
TiCHRcom = 1.357*t;
TdCHRcom = 0.473*o;
PIDCHRcom = pidstd(KpCHRcom,TiCHRcom,TdCHRcom);
RespostaCHRcom = feedback(sys*PIDCHRcom,1);
grid on
step (RespostaCHRcom*4)
legend ( 'CHRcom')
%% 

% Ajuste fino na técnica CHR com redução de 30%
KpCHRcom_ajusteFino = KpCHRcom / 1.30;
PIDCHRcom = pidstd(KpCHRcom_ajusteFino,TiCHRcom,TdCHRcom);
RespostaCHRcom = feedback(sys*PIDCHRcom,1);
grid on
step (RespostaCHRcom*4)
legend ( 'CHRcom com ajuste fino')
%% 
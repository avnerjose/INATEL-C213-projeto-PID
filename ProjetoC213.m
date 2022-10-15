% Levantando a função de transferência do grupo 4
load ('dados.mat')
sys = sys4;
step(sys)

%% 

% Utilizando o método de identificação Tangente e Smith
sys_tangente = tf(5, [160.6 1], 'InputDelay', 12.4);
sys_smith = tf(5, [146.1 1], 'InputDelay', 11.9);
hold on
step (sys)
step(sys_tangente)
step (sys_smith)
legend ('Sinal original', 'Método Tangente', 'Método Smith')
hold off
%% 

% Valores de k, t e o que serão utilizados retirados do método Smith
k = 5;
t = 146.1;
o = 11.9;
sys = tf(k, [t, 1], 'InputDelay', o)
%% 

% Controlador PID pela técnica IMC
lambda = 22;
KpIMC = (2*t+o)/(k*(2*lambda+o))
TiIMC = t + o/2
TdIMC = (t*o)/(2*t+o)
PIDIMC = pidstd(KpIMC,TiIMC,TdIMC)
PIDIMC = pidstd(1.088, 152.15,5.717)
RespostaIMC = feedback(sys*PIDIMC,1);
RespostaSemControle = feedback(sys,1);
grid on
hold on
step(RespostaIMC*4)
%step(RespostaSemControle*4)
legend ('IMC','Sistema sem controle')
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

% Ajuste fino na técnica CHR com redução de 25%
KpCHRcom
KpCHRcom_ajusteFino = KpCHRcom * 0.75
PIDCHRcom = pidstd(KpCHRcom_ajusteFino,TiCHRcom,TdCHRcom);
RespostaCHRcom = feedback(sys*PIDCHRcom,1);
grid on
step (RespostaCHRcom*4)
legend ( 'CHRcom com ajuste fino')
%% 
k = input('Entre com o valor de K: ');
t = input('Entre com o valor de τ: ');
o = input('Entre com o valor de Ɵ: ');
kp = input('Entre com o valor de Kp: ');
ti = input('Entre com o valor de Ti: ');
td = input('Entre com o valor de Td: ');
sp = input('Entre com o valor do SetPoint: ');
sys1 = tf(k, [t, 1], 'InputDelay', o)
PID = pidstd(kp,ti,td);
RespostaPID = feedback(sys1 * PID,1);
grid on
step(RespostaPID * sp);

%%

%%
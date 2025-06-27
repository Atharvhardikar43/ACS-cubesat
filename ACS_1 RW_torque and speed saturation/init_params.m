params.J = diag([10, 10, 10]);          % Inertia matrix
params.J_rw = 7.86e-4;         % RW inertia
params.Kp = 0.05;                       % Controller gains
params.Kd = 2;
params.A_dist =[...
     sqrt(2/3),     0        , -sqrt(2/3),      0;
     0        ,  sqrt(2/3),      0       , -sqrt(2/3);
     1/sqrt(3),  1/sqrt(3),   1/sqrt(3),   1/sqrt(3)];
params.dt = 0.1;
params.t_final = 2000;
t_vec = 0:params.dt:params.t_final;
N = length(t_vec);

% Reaction wheel params
params.rw_max_speed = 6000*2*pi/60; % rads/sec
params.rw_max_torque = 0.025; % N.m
params.bus_max_speed = 0.5*pi/180; % rad/sec
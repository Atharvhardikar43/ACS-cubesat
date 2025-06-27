clear;
addpath('utils');

init_params;          % Load parameters (inertia, time, gains, etc.)
init_conditions;      % Load initial attitude, angular velocity, rw speed
ref = reference_trajectory(t_vec);  % Desired attitude + omega over time
q_init=q;
% Preallocate logs
logs.q = zeros(4, N);                % Quaternion
logs.w = zeros(3, N);                % Angular velocity
logs.rw_speed = zeros(4, N);         % Reaction wheel speeds
logs.torque_cmd = zeros(3, N);       % Control torque
logs.att_err = zeros(3, N);          % Attitude error vector
logs.w_err = zeros(3, N);            % Angular velocity error
logs.time = zeros(1, N);             % Time vector

for k = 1:N
    [q, w] = plant_dynamics(q, w, rw_speed, torque_actual, params.dt, params);
    
    [att_err, w_err] = compute_error(q, w, ref(k).q_des, ref(k).w_des);
    
    torque_cmd = controller(att_err, w_err, params);
    
    [torque_actual, rw_speed] = reaction_wheel_model(q_init, q, torque_cmd, rw_speed, params);

    % Log current values
    logs.q(:,k) = q;
    logs.w(:,k) = w;
    logs.rw_speed(:,k) = rw_speed;
    logs.torque_actual(:,k) = torque_actual;
    logs.torque_cmd(:,k) = torque_cmd;
    logs.att_err(:,k) = att_err;
    logs.w_err(:,k) = w_err;
    logs.time(k) = t_vec(k);

end
save('logs/logs_run1.mat', 'logs');
plot_results(logs);

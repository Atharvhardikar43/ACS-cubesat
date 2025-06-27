q = [1; 0; 0; 0]; 
q = q/norm(q); % Unit quaternion
w = [0; 0; 0];                 % Angular velocity
rw_speed = [0; 0; 0; 0];          % RW speeds
torque_rw = [0; 0; 0; 0];
torque_actual = [0; 0; 0];
function [torque_actual, rw_speed_next] = reaction_wheel_model(q_init, q_curr, torque_cmd, rw_speed, params)
    J_rw = params.J_rw;
    % the reaction wheel configuration have rotated now from its last value
    % also now i am using 4 reaction wheels, so use that pseado matrix. 
    % basically calculate the torque required from the reaction wheels,
    % then transform it to the reaction wheel frame (which has rotated)
    % then distribute this torque using the pseudoinverse method on the 4
    % reaction wheels while making sure that reaction wheel speed dont
    % exceed a particular quantity params.rw_max_speed also make sure that the torque
    % experienced by each reaction wheel should not exceed a particular
    % quantity params.rw_torque_max
    % q_rot = quat_mult(q_init, quat_conj(q_curr));  % q_rot = q_init * inverse(q_curr)
    % 
    % % Convert quaternion to DCM (rotation matrix from body to RW frame)
    % A_rot = quat_to_dcm(q_rot);  % 3x3 rotation matrix
    % 
    % % Rotate torque command into reaction wheel frame
    % torque_in_rw_frame = A_rot * torque_cmd;
    A = params.A_dist;
    torque_in_rw_frame = torque_cmd;
    wheel_torque_cmd = pinv(A) * torque_in_rw_frame;

    % Clamp individual wheel torques
    wheel_torque_cmd = max(-params.rw_max_torque, min(wheel_torque_cmd, params.rw_max_torque));
    
    for i = 1:4
        if abs(rw_speed(i)) >= params.rw_max_speed
            if sign(wheel_torque_cmd(i)) == sign(rw_speed(i))
                wheel_torque_cmd(i) = 0;  % Prevent further increase
            end
        end
    end

    rw_accel = wheel_torque_cmd ./ J_rw;  % One RW per axis
    rw_speed_next = rw_speed + params.dt * rw_accel;

    torque_actual = A * J_rw * rw_accel;          % Newton's 3rd law
end

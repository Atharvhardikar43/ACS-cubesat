function [q_next, w_next] = plant_dynamics(q, w, rw_speed, torque_actual, dt, params)
    J = params.J;
    
    torque_ext = torque_actual;
    w_dot = J \ (torque_ext - cross(w, J * w));
    
    w_next = w + dt * w_dot;
    
    Omega = [0, -w';
             w, -skew(w)];
    q_dot = 0.5 * Omega * q;
    q_next = q + dt * q_dot;
    q_next = q_next/norm(q_next);
end

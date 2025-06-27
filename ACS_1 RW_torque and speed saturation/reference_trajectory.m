function ref = reference_trajectory(t_vec)
    for k = 1:length(t_vec)
        ref(k).q_des = [0; 1; 0; 0];     % Constant desired attitude
        ref(k).w_des = [0; 0; 0];        % Zero angular velocity
    end
end

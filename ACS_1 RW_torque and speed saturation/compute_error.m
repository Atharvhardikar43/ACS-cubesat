function [att_err, w_err] = compute_error(q, w, q_des, w_des)
    q_err = quat_multiply(quat_conj(q_des), q);
    att_err = q_err(2:4);         % Vector part = small angle approx
    w_err = w - w_des;
end

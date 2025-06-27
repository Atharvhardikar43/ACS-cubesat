function torque = controller(att_err, w_err, params)
    torque = -params.Kp * att_err - params.Kd * w_err;
end

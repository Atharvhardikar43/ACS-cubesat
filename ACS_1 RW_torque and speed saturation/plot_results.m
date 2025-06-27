function plot_results(logs)

    figure;
    subplot(3,1,1);
    plot(logs.time, logs.q);
    title('Quaternion'); legend('q_1', 'q_2', 'q_3', 'q_4');

    subplot(3,1,2);
    plot(logs.time, logs.w);
    title('Angular Velocity'); legend('\omega_x', '\omega_y', '\omega_z');

    subplot(3,1,3);
    plot(logs.time, logs.torque_cmd);
    title('Control Torque'); legend('T_x', 'T_y', 'T_z');

    figure;
    plot(logs.time, vecnorm(logs.att_err));
    title('Attitude Error Norm');
end

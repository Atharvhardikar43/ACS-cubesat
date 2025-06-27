function q_out = quat_multiply(q1, q2)
% QUAT_MULTIPLY  Hamilton product of two quaternions (scalar-first).
%
%   q_out = quat_multiply(q1, q2) returns the quaternion product q1 ⊗ q2.
%
%   Input:
%     q1, q2 : 4x1 quaternions [q0; q1; q2; q3], scalar-first
%
%   Output:
%     q_out  : 4x1 quaternion result of q1 ⊗ q2
%
%   The operation is not commutative: quat_multiply(q1, q2) ≠ quat_multiply(q2, q1)

    if numel(q1) ~= 4 || numel(q2) ~= 4
        error('Both inputs must be 4-element quaternions [q0; q1; q2; q3].');
    end

    % Extract scalar and vector parts
    q0_1 = q1(1); v1 = q1(2:4);
    q0_2 = q2(1); v2 = q2(2:4);

    % Hamilton product
    scalar_part = q0_1*q0_2 - dot(v1, v2);
    vector_part = q0_1*v2 + q0_2*v1 + cross(v1, v2);

    q_out = [scalar_part; vector_part];
end

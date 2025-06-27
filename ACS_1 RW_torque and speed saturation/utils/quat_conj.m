function qc = quat_conj(q)
% QUAT_CONJ  Quaternion conjugate (scalar-first convention).
%
%   qc = quat_conj(q) returns the conjugate of the quaternion q.
%
%   Input
%     q  : 4×1 quaternion [q0; q1; q2; q3], scalar part first
%
%   Output
%     qc : 4×1 quaternion conjugate  [ q0; -q1; -q2; -q3 ]
%
%   The conjugate satisfies:   qc ⊗ q = q ⊗ qc = [‖q‖^2; 0; 0; 0]

    if numel(q) ~= 4
        error('Input must be a 4-element quaternion [q0; q1; q2; q3].');
    end

    qc = [ q(1); -q(2:4) ];
end

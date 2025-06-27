function S = skew(v)
% SKEW Creates a skew-symmetric matrix from a 3x1 vector.
%
%   S = skew(v) returns the skew-symmetric matrix such that:
%       S * a = cross(v, a) for any 3x1 vector a
%
%   Input:
%       v - 3x1 vector [vx; vy; vz]
%
%   Output:
%       S - 3x3 skew-symmetric matrix

    if numel(v) ~= 3
        error('Input must be a 3-element vector.');
    end

    S = [  0   -v(3)  v(2);
          v(3)   0   -v(1);
         -v(2)  v(1)   0  ];
end

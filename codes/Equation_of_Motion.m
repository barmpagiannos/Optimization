clc, clear, close all;

% I have this equation of motion: x(t) = at^3 + bt^2 + ct + d
% and i want to find the parameters a, b, c, d such that i minimize the sum
% of squares of the errors between expected output and measurements.

t = 0:1:9;  % time in seconds.
x = [0.0 1.2 2.5 4.1 5.9 8.0 10.2 12.5 15.0 17.6];  % position in meters.

% Build design matrix A for least squares: A * theta = x.
A = [t'.^3, t'.^2, t', ones(length(t), 1)];

% Solve for parameters [a; b; c; d] using least squares method.
theta = A \ x';

disp('Estimated parameters [a, b, c, d]:');
disp(theta');

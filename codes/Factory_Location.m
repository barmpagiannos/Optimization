% A location optimization problem to find the best factory site for minimizing drone battery usage when supplying three stores.
% The goal is to minimize the total distance between the factory and the stores, thereby reducing battery consumption during shipping.
clc, clear, close all;

% We declare our optimization problem.
prob = optimproblem("Description", "Factory Location");

% Display the contents of the optimization problem.
show(prob)

% In the factory location problem, the optimization variables are the East-West (x-coordinate) and North-South (y-coordinate) positions, 
% which determine the total distance to the stores.
x = optimvar("x");
y = optimvar("y");

% The factory location problem's objective function involves calculating total distances using the Pythagorean theorem.
X = [5 40 70];
Y = [20 50 15];

% Using the Pythagoren theorem.
d = sqrt((x-X).^2 + (y-Y).^2);

% The total distance is:
dTotal = sum(d);

prob.Objective = dTotal;

% Because this optimization problem is nonlinear, we need an arbitrary initial guess.
initialGuess.x = 10;
initialGuess.y = 20;

% After defining an initial guess, we can solve optimization problem using the solve function.
[sol, optval] = solve(prob, initialGuess);

% The optimal values are:
xOpt = sol.x;
yOpt = sol.y;

% We plot the optimal solution.
plotStores
hold on;
scatter(xOpt, yOpt);
hold off;

% This function plots the stores in their positions.
function plotStores()
X = [5 40 70];
Y = [20 50 15];
pgon1 = nsidedpoly(5,"Center",[X(1) Y(1)],"sidelength",3);
pgon2 = nsidedpoly(5,"Center",[X(2) Y(2)],"sidelength",3);
pgon3 = nsidedpoly(5,"Center",[X(3) Y(3)],"sidelength",3);
plot([pgon1 pgon2 pgon3])
axis equal
end

dTotalEval = evaluate(dTotal, sol);
fprintf("The optimal distance is: %.3f\n", dTotalEval);

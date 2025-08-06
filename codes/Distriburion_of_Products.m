% A company has 3 warehouses (W1, W2, W3) and 4 stores (S1, S2, S3, S4).
% Wants to transport the products from the warehouses to the stores in
% order to meet the demand with the lowest total transportation cost.
clc, clear, close all;

% Supply of every warehouse:
supply = [100; 125; 75];

% Demand of every store:
demand = [80; 85; 70; 65];

% Transportation cost from each warehouse to each store:
% E.g. cost from W1 to S3 is 8.
trans_cost = [
    4 6 8 13;
    5 11 9 7;
    8 7 4 10];

% x_ij the quantity delivered by warehouse W_i to store S_j.
% y_i the quantity every store S_i gets.
% x_i, y_i >= 0.

% Objective function: minimize the total transportation cost.
% In other word, minimize 4x_11 + 6x_12 + 8x_13 + 13_x14
                      % + 5x_21 + 11x_22 + 9x_23 + 7x_24
                      % + 8x_31 + 7x_32 + 4x_33 + 10x_34

% The above leads to this objective function.
f = trans_cost(:);

% Constraints.

% The quantity shipped from each warehouse does not exceed it's capacity:
% x_11 + x_12 + x_13 + x_14 <= 100
% x_21 + x_22 + x_23 + x_24 <= 125
% x_31 + x_32 + x_33 + x_34 <= 75

% The total quantity each store receives must be equal to it's demand:
% x_11 + x_21 + x_31 = 80
% x_12 + x_22 + x_32 = 85
% x_13 + x_23 + x_33 = 70
% x_14 + x_24 + x_34 = 65

A = [1 1 1 1 0 0 0 0 0 0 0 0;  % W1
     0 0 0 0 1 1 1 1 0 0 0 0;  % W2
     0 0 0 0 0 0 0 0 1 1 1 1]; % W3
b = supply;
Aeq = [1 0 0 0 1 0 0 0 1 0 0 0;  % S1
       0 1 0 0 0 1 0 0 0 1 0 0;  % S2
       0 0 1 0 0 0 1 0 0 0 1 0;  % S3
       0 0 0 1 0 0 0 1 0 0 0 1]; % S4
beq = demand;

% Constrain all variables to be non-negative.
lb = zeros(12, 1);

x = linprog(f, A, b, Aeq, beq, lb)

disp("Optimal shipment quantities:");
disp(reshape(x, 4, 3)');  % 3 rows (warehouses), 4 columns (stores).

total_cost = f' * x;
fprintf("Total transportation cost: %.2f\n", total_cost);

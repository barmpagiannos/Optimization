% Incorporate constraints into the optimization process, using a practical example of constructing a cost-effective and nutritionally balanced breakfast.
clc, clear, close all;

load("Nutrition.mat");
food

% Create the optimization problem.
prob = optimproblem("Description", "An Optimal Breakfast");

% Declare the optimization variables, a 16x1 vector. Lowerbound 0 as we cannot consume negative amounts of food.
servings = optimvar("servings", 16, "LowerBound", 0);

% The objective function for this problem is the total cost of each food type, which is the product of the 
% number of servings of each food and the associated cost per serving.
C = food.Price .* servings;
% Minimize the total cost.
prob.Objective = sum(C);

% The average person is recommended to eat around 350 calories for breakfast each day.
cals = food.Calories .* servings;
totalCalories = sum(cals);
% Add a constraint for the total calorie intake to be 350 calories.
prob.Constraints.calorieConstraint = totalCalories == 350;

carbs = food.Carbs .* servings; 
totalCarbs = sum(carbs);
% Add a constraint for the total carbs intake to be at least 45 grams.
prob.Constraints.carbs = totalCarbs >= 45 

protein = food.Protein .* servings;
totalProtein = sum(protein)
% Add a constraint for the total protein intake to be at least 15 grams.
prob.Constraints.protein = totalProtein >= 15

vitaminC = food.VitaminC .* servings;
totalVitaminC = sum(vitaminC)
% Add a constraint for the total vitaminC intake to be at least 60 milligrams.
prob.Constraints.vitaminC = totalVitaminC >= 60

% The optimization problem is linear, so we don't need to provide an initial guess.
[sol, optval] = solve(prob)

% That's the bar with the foods we need to consume.
bar(food.Name, sol.servings)

fprintf("Total Cost: %.2f €\n", optval);
fprintf("Optimal portions of foods: %.2f\n", sol.servings);

% Explanation: 2.8 means 2.8 portions of potatoes.

# ⚙️ Optimization with MATLAB

This repository contains a collection of MATLAB scripts solving practical optimization problems from engineering, logistics, and applied mathematics.

Each script models and solves a real-world scenario using appropriate optimization tools, such as **linear programming**, **nonlinear optimization**, and **least squares fitting**.

Developed for academic and experimental purposes in the context of numerical and operational optimization.

---

## 📘 Problem Summaries

### 🍽️ 1. Optimal Nutritional Breakfast  
**Goal:** Find the cheapest combination of 16 food items that meets dietary constraints for calories, protein, carbs, and vitamin C.  
**Techniques:**  
- Linear programming using `optimproblem`  
- Constraint modeling on nutrient totals  
- Visualization of optimal servings  

**File:** `optimal_breakfast.m`  
**Data:** `Nutrition.mat`

---

### 🚚 2. Transportation Problem  
**Goal:** Minimize transportation costs when distributing goods from 3 warehouses to 4 stores, respecting supply and demand constraints.  
**Techniques:**  
- Linear programming with `linprog`  
- Supply/demand matrix formulation  
- Cost calculation from flattened cost matrix  

**File:** `transportation_problem.m`

---

### 📈 3. Least Squares Parameter Estimation  
**Goal:** Estimate motion parameters (a, b, c, d) in the polynomial model `x(t) = at³ + bt² + ct + d` using position-time data.  
**Techniques:**  
- Linear least squares  
- Matrix formulation `Aθ = x`  
- Closed-form solution with `\` operator  

**File:** `least_squares_fit.m`

---

### 🏭 4. Factory Location Optimization  
**Goal:** Find the optimal 2D location for a factory that minimizes the total Euclidean distance to 3 fixed stores (drone delivery scenario).  
**Techniques:**  
- Nonlinear optimization with `optimproblem`  
- Distance minimization using the Pythagorean formula  
- Visualization of optimal location  

**File:** `factory_location.m`

---

## 🛠️ Requirements

- MATLAB R2020b or newer  
- Optimization Toolbox  
- Symbolic Math Toolbox (optional)

---

---

## ✍️ Author

**Βασίλειος Μπαρμπαγιάννος**  
Student at ECE AUTH – School of Electrical & Computer Engineering  
AEM: 10685

---

## 📄 License

This repository is distributed under the [MIT License](https://opensource.org/licenses/MIT).

---


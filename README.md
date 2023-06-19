# Optimization

Revised Simplex Method

This repository contains an implementation of the Revised Simplex Method, an algorithm used for solving linear programming optimization problems. The implementation is written in MATLAB.

# Motivation

The Revised Simplex Method is a more efficient version of the original simplex algorithm. It reduces the computational time and resources required by generating only the necessary information in each iteration, such as the relative cost function and entering variables. This implementation aims to provide a faster solution to linear programming optimization problems.

# Usage

The main function for running the Revised Simplex Method is revised_simplex.m. It takes the following inputs:

[X_indices, X_values, F_min] = revised_simplex(f, A, b, Aeq, beq)

f: The objective function coefficients as a row vector.

A: The matrix of inequality constraints.

b: The right-hand side values of the inequality constraints.

Aeq: The matrix of equality constraints.

beq: The right-hand side values of the equality constraints.

The function returns the following outputs:

X_indices: The indices of the basic variables in the optimal solution.

X_values: The values of the basic variables in the optimal solution.

F_min: The minimum value of the objective function.

# Examples

You can find example cases that demonstrate the usage of the Revised Simplex Method in test_simplex.m. Each example file. includes input data and a demonstration of how to use the revised_simplex function.

# Comparison with matlab linprog function

As expected, revised simplex outperform the original simplex method used in linpro Matlab.
Comaprison is also provided in test_simplex.m


![image](https://github.com/ibrahimabdelaal/Optimization/assets/49596777/89ba55fe-0ca1-4bf6-89aa-0fd15764314f)


![image](https://github.com/ibrahimabdelaal/Optimization/assets/49596777/e9380b2a-1f3d-4950-8046-58e1b2211aaf)







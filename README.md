# Boolean Satisfiability Problem (SAT)

*"it is a constant source of annoyance when you come up with a clever special algorithm which then gets beaten by translation to SAT"* - Chris Jefferson 


## What are Sat solvers? 
SAT solvers are programs that solve the Boolean satisfiability problem from Boolean logic. You are given a logical expression in which the variables are either `true` or `false` and are combined with logical connectives **AND**, **OR**, and **NOT**. The question is: can you find an assignment of true and false values to the variables which makes the Boolean formula true?
The Boolean formula is either called satisfiable (SAT) or unsatisfiable (UNSAT).

For example: 
> (x1 ∧ x2) ∨ ¬x1 is satisfiable because if x1 is `false` then the boolean formula evaluates to `true`

> (x1 ∧ ¬x1) is unsatisfiable because no value of x1 can make the formula `true`

Many Constraint Satisfaction Problems (CSP) in Artificial Intelligence and Operational Research can be formulated and solved as Boolean Satisfiability Problem.
In a CSP, there is a set of variables and a set of constraints. The variables must be assigned values from specified domains in such a way that all the given constraints are satisfied. An assignment of values to the variables that satisfies all the constraints yields a feasible solution. The objective is to find one feasible solution, or in some cases, all feasible solutions. Sometimes, it is possible to associate a measure of quality with a feasible solution. In such cases the objective might be to find the feasible solution of highest quality.


## The australian map coloring problem 
This problem can be solved using methods based on Satisfiability (SAT). 

![australian_states](australian_states.png)

We wish to color a map of Australia as shown above. The map is made up of seven different states. Coloring this map means to assign a color to each vertex of its correponding graph with the restriction that two adjacent vertices have a different color.

Let A = {a1, a2,..., an} be a set of n > 1 Boolean variables. 
If a is a variable in A then a and ¬a are called literals over A. 
A clause C over A is a set of literals over A. It represents the disjunction of the literals, and is valid (or satisfied) under a truth assignment if and only if at least one of its literals is true under the assignment. It is invalid (or unsatisfied) under the truth assignment if every literal in it is false under the assignment. 
A set C of clauses over A is satisfiable if there exist a truth assignment for A such that every clause in C is valid under the assignment. In the Satisfiability Problem (SAT) we are required to determine whether a given set C of clauses is satisfiable. In SAT the clauses represent the constraints to be satisfied when assigning truth-values to the Boolean variables. In SAT, the number of literals in a clause can vary.

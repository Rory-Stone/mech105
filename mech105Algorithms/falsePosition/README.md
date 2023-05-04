# ** False Positon **
##	This algorithm finds the root of a function using the false position method. Given inputs of a function (func) and an upper (xu) and lower (xl) bound, the algorithm fits a linear function between the 
points and makes a guess that the root is where that line crosses the x-axis. The function will iterate until the specified max iterations (maxit) or untill the specifed stopping criterion (es) is less than 
or eqaal to the approximate relitive error (ea). The function will output the number of iterations (iter) used and the final relitive error (ea) as well as the root (root) and function value at that root 
(fx).

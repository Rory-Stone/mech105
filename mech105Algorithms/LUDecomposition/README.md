# LU Decomposition
##This function takes an input of a square matrix (A) and using the LU decompusition process it factors the given matrix into an upper triangular matrix (U) using gauss elimiation. The biproduct of this 
process is then used to create a lower triangular matrix (L). The Fuction dose not utilize naive gauss elimiation, instead pivoting is required to correct for division by zero. Therfore a third pivot matrix
(P), consisting of a pivoted identity matrix, is also ouput to discribe the poviting that took place.

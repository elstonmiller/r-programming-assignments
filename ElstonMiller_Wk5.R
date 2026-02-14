# Practice Problem
# 1x + 2y + 1z = 7
# 3x − 1y + 2z = 11
# 2x + 1y + 4z = 16
prac <- matrix(c(1,2,1,3,-1,2,2,1,4), nrow = 3, byrow = TRUE)
prac
ans <- c(7,11,17)
ans
solve(prac,ans)

#Assignment

# Step 1 - Create the matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

dim(A)  # 10 x 10, square
dim(B)  # 10 x 100, not square

# Step 2 - Compute inverse and determinant for A
invA <- solve(A) # Error: Singular - det(A) = 0
detA <- det(A) # 0
invA[1:5, 1:5]   # preview first part of the inverse
detA             # determinant value = 0

# Step 3 - Try inverse and determinant on B (failure expected)
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

invB
detB



# Create a 3x3 matrix filled column-wise (by default)
my_matrix <- matrix(data = 1:9, nrow = 3, ncol = 3)
print(my_matrix)

# Create a 2x4 matrix filled row-wise
my_matrix_rowwise <- matrix(data = 1:8, nrow = 2, ncol = 4, byrow = TRUE)
print(my_matrix_rowwise)

# Create a 2x4 matrix filled column-wise
my_matrix_colwise <- matrix(data = 1:8, nrow = 2, ncol = 4, byrow = FALSE)
print(my_matrix_colwise)

# Create a matrix and assign row and column names
my_matrix_named <- matrix(data = 1:6, nrow = 2, ncol = 3,dimnames = list(c("Row1", "Row2"), c("ColA", "ColB", "ColC")))
print(my_matrix_named)


#by Creating a vector of data
data_values <- c(1, 2, 3, 4, 5, 6)

# Create a 2x3 matrix (2 rows, 3 columns)
my_matrix <- matrix(data_values, nrow = 2, ncol = 3)

# Print the matrix
print(my_matrix)

#using cbind
# Create vectors
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
vec3 <- c(7, 8, 9)

# Combine by columns
my_matrix_cbind <- cbind(vec1, vec2, vec3)
print(my_matrix_cbind)

#using rbind
# Create vectors
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
vec3 <- c(7, 8, 9)

# Combine by rows
my_matrix_rbind <- rbind(vec1, vec2, vec3)
print(my_matrix_rbind)

#checking the dimension of a matrix
my_vector <- matrix(c(1, 2, 3, 4, 5, 6),nrow = 2,ncol = 3)
print(my_vector)
# printing dimension of vector
print(dim(my_vector)) 

#creating a matrix by modifying the dimension of a vector
# Create a vector
my_vector <- c(1, 2, 3, 4, 5, 6)
# Set dimensions to 2 rows and 3 columns
dim(my_vector) <- c(3, 2)
# Print the result (which is now a matrix)
print(my_vector)

#page 771
#EBCT MODEL 1
#creating a matrix named 'data'
data<-c(1250,1700,2050,4690,7150,980,3080,3560,4370,3480,1800,1700,2800,4800,5010,2040,2820,1600,9070,4810,1000,5760,4200,3770,8740,1180,3480,2650,5250,7260)
dim(data)<-c(5,6)
dimnames(data)<-list(c("Fleet A", "Fleet B", "Fleet C", "Fleet D", "Fleet E"), c("2005", "2006", "2007", "2008", "2009", "2010"))
print(data)

#defining the variable for EBCT MODEL 1

# n - the number of data values of a risk
# N - the number of risks
# E[m(theta)] - m, the overall mean - summing the data values over all risks and years and then dividing by summation of all the risks and years.
# E[s^2(theta)] - s,  average of the risks/rows variances 
# var[m(theta)] - v, variance of the risks/rows means
#credibility factor, z
#credibility estimate, ce 

n<- ncol(data)
m<-mean(rowMeans(data))
s<- mean(apply(data,1,var))
v<- var(rowMeans(data))- mean(apply(data,1,var))/n
z<-n/(n+s/v)
round(z*rowMeans(data)+(1-z)*m, digits = 0)     # credibility estimate or premiums and rounding off


#EBCT MODEL 2
#creating a matrix named 'data'
claims_data<-c(1250,1700,2050,4690,7150,980,3080,3560,4370,3480,1800,1700,2800,4800,5010,2040,2820,1600,9070,4810,1000,5760,4200,3770,8740,1180,3480,2650,5250,7260)
dim(claims_data)<-c(5,6)
risk_vol<-c(5,11,3,9,7,5,13,4,9,7,4,10,4,8,8,6,12,3,8,8,5,15,3,9,9,5,14,2,10,10)
dim(risk_vol)<-c(5,6)
dimnames(claims_data)<-list(c("Fleet A", "Fleet B", "Fleet C", "Fleet D", "Fleet E"), c("2005", "2006", "2007", "2008", "2009", "2010"))
print(claims_data)
dimnames(risk_vol)<-list(c("Fleet A", "Fleet B", "Fleet C", "Fleet D", "Fleet E"), c("2005", "2006", "2007", "2008", "2009", "2010"))
print(risk_vol)

#defining the variable for EBCT MODEL 2

# n - the number of data values of a risk
# N - the number of risks
#Xij
#Xibar
#Pi
#Pstar
# E[m(theta)] - m, the overall mean - summing the data values over all risks and years and then dividing by summation of all the risks and years.
# E[s^2(theta)] - s,  average of the risks/rows variances 
# var[m(theta)] - v, variance of the risks/rows means
#credibility factor, Zi
#credibility estimate, ce 

n<- ncol(claims_data)
N<-nrow(claims_data)
X<- claims_data/risk_vol
Xibar<- rowSums(claims_data)/rowSums(risk_vol)
Pi<-rowSums(risk_vol)
P<- sum(Pi)
Pstar<-sum(Pi*(1-Pi/P))/(N*n-1)
m<-sum(claims_data)/P
s<- mean(rowSums(risk_vol*(X-Xibar)^2)/(n-1))
v<- (sum(rowSums(risk_vol*(X-m)^2))/(n*N-1)-s)/Pstar
Zi<-Pi/(Pi+s/v)
round(Zi*Xibar+(1-Zi)*m, digits = 0)     # credibility estimate or premiums and rounding off



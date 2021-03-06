#Produces and prints an AxR matrix where the first five columns are the v_x reactions
#All values in the first five columns should be 0 to indicate a balanced reaction

#Formulation behind stoichiometric_matrix is found in S_Matrix.txt
stoichiometric_matrix=[1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	1.0	-1.0	0.0	-2.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
1.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
-1.0	0.0	0.0	0.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	-1.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
-1.0	0.0	0.0	1.0	2.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	1.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	-3.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0	0.0	0.0	0.0
0.0	0.0	-1.0	0.0	4.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0
0.0	0.0	0.0	0.0	3.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0
0.0	0.0	0.0	0.0	-3.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	2.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0
0.0	0.0	1.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	-4.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	1.0	0.0	0.0	0.0	0.0	0.0	-1.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
]

#A is the atom matrix and is derived in Atom.txt
A = [10.0	14.0	5.0	7.0	1.0	0.0
6.0	14.0	4.0	2.0	0.0	0.0
10.0	18.0	4.0	6.0	0.0	0.0
4.0	7.0	1.0	4.0	0.0	0.0
10.0	16.0	5.0	13.0	3.0	0.0
1.0	4.0	1.0	5.0	1.0	0.0
6.0	13.0	3.0	3.0	0.0	0.0
0.0	4.0	0.0	7.0	2.0	0.0
4.0	4.0	0.0	4.0	0.0	0.0
0.0	1.0	0.0	0.0	0.0	0.0
0.0	2.0	0.0	1.0	0.0	0.0
21.0	29.0	7.0	17.0	3.0	0.0
21.0	30.0	7.0	17.0	3.0	0.0
0.0	0.0	1.0	1.0	0.0	0.0
5.0	12.0	2.0	2.0	0.0	0.0
0.0	3.0	0.0	4.0	1.0	0.0
0.0	0.0	0.0	2.0	0.0	0.0
1.0	4.0	2.0	1.0	0.0	0.0
]

Epsilon = transpose(A)*stoichiometric_matrix
print(Epsilon)

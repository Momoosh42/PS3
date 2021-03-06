#Calculates and prints the flux array that is maximizing urea flux

include("Include.jl")

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



#Formulation behind default_bounds_array is found in Flux_Bounds.txt
default_bounds_array = [0.0	5.312
0.0	1.242
0.0	1.302
0.0	3.1716
-0.4932	0.4848
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
-10.0	10.0
]

#All species are at steady state so bounds are 0,0 for all of them
species_bounds_array=[0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0;
0.0	0.0
]

#Objective function indices, Urea outward flux is meant to be maximized
#so (9,1) is -1.0, all other values are 0.0
c = [0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
-1.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0]
include("Flux.jl")
(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag) = calculate_optimal_flux_distribution(stoichiometric_matrix::Array{Float64,2}, default_bounds_array::Array{Float64,2}, species_bounds_array::Array{Float64,2}, c::Array{Float64,1})

print(calculated_flux_array)

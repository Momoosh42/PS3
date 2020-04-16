//This FBA.jl was updated after the due date due to a bug that would have prevented
//the code to run on the first go and an improper implementation of the objective
//function.

This depository contains code to solve for the reaction fluxes of a reconstructed
urea cycle in humans.
All reactions are found from KEGG.
The Enzyme IDs are:
EC:6.3.4.5, EC:4.3.2.1, EC:3.5.3.1, EC:2.1.3.3, EC:1.14.13.39

Flux units are in mmol/gDW-hr

Solution: The reaction fluxes of this system as found to be
0.3156000000000003, 0.3156000000000003, 1.302, 1.3020000000000003, -0.4932, 1.3019999999999996, 0.3155999999999999, 0.3155999999999999, 1.3019999999999996, 0.3155999999999999, 0.3155999999999999, 0.3155999999999999, 1.3019999999999996, -1.9727999999999994, -1.4796000000000014, -1.4796000000000014, -0.9863999999999997, -1.4796000000000014, -3.2748
from v_1 to v_5 and then b_1 to b_14

S_Matrix.txt: Contains the reactions of the system, defines the reaction and
metabolite variables. The initial stochiometric matrix (MxR) is designed. All v
variables are reactions within the system boundary, all b variables are exchange
reactions. This matrix is utilized in both balanced.jl and FBA.jl.

Atoms.txt: Contains the Atom matrix (MxA) composed of the C,H,N,O,P,S composition
of each metabolite. The transpose of this matrix is used in balanced.jl to determine
whether the reactions are balanced.

balanced.jl: Determines whether the reactions in the system are balanced by
multiplying the transpose of the atom matrix by the stoichiometric matrix. If
balanced the first 5 columns (the internal reactions) should all be 0.

Flux_Bounds.txt: Contains the flux bounds of the system in an Rx2 array. The k_cat
values of the internal reactions are given, as well as the steady state concentration,
and both are utilized to find V_max (=k_cat*steady_state_concentration). This upper
bound was further modified using the Michaelis-Menten model which incorporated the
Michaelis-Menten constant and substrate concentration. The Michaelis-Menten constant
was found on BRENDA while substrate concentration was derived from Park et al. For
reactions where this information was not available the standard V_max was used.
All boundary reactions have flux bounds of -10 to 10 mmol/gDW-hr.

FBA.jl: Contains all the relevant arrays (stochiometric, flux bounds, species
bounds and objective indices). Initializes Flux.jl and provides a print-out of
the solved flux array. The objective function solves for maximum urea flux out
of the system.

Flux.jl: Contains function calculate_optimal_flux_distribution which linearly
solves the stochiometric for the flux array using the inputs provided from FBA.jl
(stochiometric, flux bounds, species bounds and objective indices).

Include.jl: Ensures that the necesary packages are available. Specifically GLPK.

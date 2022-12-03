:- table decay(_, _, _, _, _, _, _, _, po(<)) as subsumptive.
:- table edge(_, _, _, _, _, _, po(<)) as subsumptive.
:- table path_exists(_, _, _, _, _, _, po(<)) as subsumptive.

edge(Z1, N1, E1, Z2, N2, E2) :-
	decay(Z1, N1, E1, _, Z2, N2, E2, _).

path_exists(Z1, N1, E1, Z2, N2, E2) :-
	edge(Z1, N1, E1, Z2, N2, E2).

path_exists(Z1, N1, E1, Z3, N3, E3) :-
	edge(Z1, N1, E1, Z2, N2, E2),
	path_exists(Z2, N2, E2, Z3, N3, E3).
:- table decay(_, _, _, _, _, _, _, _, po(<)) as subsumptive.
:- table edge(_, _, _, _, _, _, po(<)) as subsumptive.
:- table path(_, _, _, _, _, _, po(<)) as subsumptive.

edge(Z1, N1, E1, Z2, N2, E2, P) :-
	decay(Z1, N1, E1, P1, Z2, N2, E2, P2),
	P is (P1 * P2) / 100.

path(Z1, N1, E1, Z2, N2, E2, P) :-
	edge(Z1, N1, E1, Z2, N2, E2, P).

path(Z1, N1, E1, Z3, N3, E3, P) :-
	edge(Z1, N1, E1, Z2, N2, E2, P1),
	path(Z2, N2, E2, Z3, N3, E3, P2),
	P is (P1 * P2) / 100.
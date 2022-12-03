:- table edge(_, _, _, _, _, _, po(>), lattice(fewer_steps/3)) as subsumptive.
:- table path(_, _, _, _, _, _, po(>), lattice(fewer_steps/3)) as subsumptive.

fewer_steps(S1, S2, S) :-
	length(S1, L1),
	length(S2, L2),
	(L1 < L2 -> S = S1 ; S = S2).

edge(Z1, N1, E1, Z2, N2, E2, P, [Step]) :-
	decay(Z1, N1, E1, Step, Z2, N2, E2, P).

path(Z1, N1, E1, Z2, N2, E2, P, Steps) :-
	edge(Z1, N1, E1, Z2, N2, E2, P, Steps).

path(Z1, N1, E1, Z3, N3, E3, P, [Step|Steps]) :-
	edge(Z1, N1, E1, Z2, N2, E2, P1, Step),
	path(Z2, N2, E2, Z3, N3, E3, P2, Steps),
	P is (P1 * P2).
:- table path/7.

/* This will give unexpected or wrong results when used */
/*:- table path(_, _, _, _, _, _, po('<'/2)).*/ 

edge(Z1, N1, E1, Z2, N2, E2, P) :-
	decay(Z1, N1, E1, _, Z2, N2, E2, P1), P is P1 / 100.

path(Z1, N1, E1, Z2, N2, E2, P) :-
	edge(Z1, N1, E1, Z2, N2, E2, P).

path(Z1, N1, E1, Z3, N3, E3, P) :-
	edge(Z1, N1, E1, Z2, N2, E2, P1),
	path(Z2, N2, E2, Z3, N3, E3, P2),
	P is P1 * P2.
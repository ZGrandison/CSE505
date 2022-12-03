/* path(1,1,1,3,3,3, P). will return P = 0.1 in the online swish editor, but P = 0.5 will be returned if used in the downloaded terminal version*/

:- table path(_, _, _, _, _, _, po('<'/2)).

decay_test(1, 1, 1, 'B', 3, 3, 3, 10).
decay_test(1, 1, 1, 'B', 2, 2, 2, 100).
decay_test(2, 2, 2, 'B', 3, 3, 3, 50).


edge(Z1, N1, E1, Z2, N2, E2, P) :-
	decay_test(Z1, N1, E1, _, Z2, N2, E2, P1), P is P1 / 100.

path(Z1, N1, E1, Z2, N2, E2, P) :-
	edge(Z1, N1, E1, Z2, N2, E2, P).

path(Z1, N1, E1, Z3, N3, E3, P) :-
	path(Z1, N1, E1, Z2, N2, E2, P1),
	edge(Z2, N2, E2, Z3, N3, E3, P2),
	P is P1 * P2.
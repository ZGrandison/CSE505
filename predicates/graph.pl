node(Z, N, E) :-
	nuclide(Z, N, _),
	level(Z, N, E).

edge(Z1, N1, E1, Z2, N2, E2) :-
	node(Z1, N1, E1),
	node(Z2, N2, E2),
	decay(Z1, N1, E1, _, Z2, N2, E2, _).

path(Z1, N1, E1, Z2, N2, E2) :-
	node(Z1, N1, E1),
	node(Z2, N2, E2),
	edge(Z1, N1, E1, Z2, N2, E2).

path(Z1, N1, E2, Z3, N3, E3) :-
	node(Z1, N1, E1),
	node(Z2, N2, E2),
	node(Z3, N3, E3),
	edge(Z1, N1, E1, Z2, N2, E2),
	path(Z2, N2, E2, Z3, N3, E3).
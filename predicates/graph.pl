/*
	Use partial ordering to prioritize highest probability.
	Use min for comparing string decay codes.
	Use 'subsumptive' to avoid possible cycles.
*/
:-	table edge(
		_, _, _, _, _, _, po(>), min
	) as subsumptive.

/*
	Use partial ordering to prioritize highest probability.
	Use fewer_steps/3 to prioritize shorter paths.
	Use 'subsumptive' to avoid possible cycles.
*/
:-	table path(
		_, _, _, _, _, _, po(>), lattice(fewer_steps/3)
	) as subsumptive.

/*
	Aggregation method used for comparing lists of steps.
	Returns the shorter of its two input lists.
*/
fewer_steps(S1, S2, S) :-
	length(S1, L1),
	length(S2, L2),
	(L1 < L2 -> S = S1 ; S = S2).

/*
	Edges in this graph are based on decay/8.
	If one nuclide decays into another, they have an edge.
*/
edge(Z1, N1, E1, Z2, N2, E2, P, Step) :-
	decay(Z1, N1, E1, Step, Z2, N2, E2, P).

/*
	If there is an edge between two nuclides,
	then that edge forms a path of length 1.
*/
path(Z1, N1, E1, Z2, N2, E2, P, [Step]) :-
	edge(Z1, N1, E1, Z2, N2, E2, P, Step).

/*
	If there is a path from Nuclide 1 to 2,
	there is also a path from nuclide 1 to
	any other node connected to nuclide 2.
*/
path(Z1, N1, E1, Z3, N3, E3, P, [Step|Steps]) :-
	edge(Z1, N1, E1, Z2, N2, E2, P1, Step),
	path(Z2, N2, E2, Z3, N3, E3, P2, Steps),
	P is (P1 * P2).
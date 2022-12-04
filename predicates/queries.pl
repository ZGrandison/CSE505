decay_path_exists(Z1, N1, E1, Z2, N2, E2) :-
	path(Z1, N1, E1, Z2, N2, E2, _, _).

decay_probability(Z1, N1, E1, Z2, N2, E2, P) :- (
	path(Z1, N1, E1, Z2, N2, E2, P1, _)
	-> P = P1
	;  P = 0
).

contains_step(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	member(Step, Steps).

starts_with(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	nth0(0, Steps, Step).

ends_with(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	last(Steps, Step).
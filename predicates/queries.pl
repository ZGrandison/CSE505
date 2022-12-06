/*
	Predicates used to query the graph for information
	about nuclear decay paths.
*/

%	Returns true if there is a path on record
%	between two energy levels.
path_exists(Z1, N1, E1, Z2, N2, E2) :-
	path_aggregated(Z1, N1, E1, Z2, N2, E2, _, _).

%	Returns the highest probability associated with
%	a given decay path, or 0 if not available.
path_probability(Z1, N1, E1, Z2, N2, E2, P) :- (
	path_aggregated(Z1, N1, E1, Z2, N2, E2, P1, _)
	-> P = P1
	;  P = 0
).

%	Returns true if a decay path contains
%	a specific step, i.e. 'A', 'B-', 'EC', 'IT'.
path_contains_step(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	member(Step, Steps).

%	Returns true if the first step in
%	a decay path matches the input argument.
path_starts_with(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	nth0(0, Steps, Step).

%	Returns true if the last step in a
%	decay path matches the input argument.
path_ends_with(Z1, N1, E1, Z2, N2, E2, Step) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	last(Steps, Step).

%	Returns true if a path with exactly X steps
%	exists between (Z1,N1,E1) and (Z2,N2,E2).
path_n_steps(Z1, N1, E1, Z2, N2, E2, X) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	length(Steps, X).

%	Returns true if a path with at most X steps
%	exists between (Z1,N1,E1) and (Z2,N2,E2).
path_max_n_steps(Z1, N1, E1, Z2, N2, E2, X) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	length(Steps, N),
	N =< X.

%	Returns true if a path with at least X steps
%	exists between (Z1,N1,E1) and (Z2,N2,E2).
path_min_n_steps(Z1, N1, E1, Z2, N2, E2, X) :-
	path(Z1, N1, E1, Z2, N2, E2, _, Steps),
	length(Steps, N),
	N >= X.
/*
	Utility predicates used for printing information
	about the graph to console.
*/

%	Print all edges between two arbitrary energy levels
print_edges(Z1, N1, E1, Z2, N2, E2) :- forall(
	edge(Z1, N1, E1, Z2, N2, E2, P, Type),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nType = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Type]
	)
).

%	Print all edges that start from a given energy level
print_edges_from(Z1, N1, E1) :- forall(
	edge(Z1, N1, E1, Z2, N2, E2, P, Type),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nType = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Type]
	)
).

%	Print all edges that end at a given energy level
print_edges_to(Z2, N2, E2) :- forall(
	edge(Z1, N1, E1, Z2, N2, E2, P, Type),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nType = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Type]
	)
).

%	Print all decay paths between two arbitrary energy levels
print_paths(Z1, N1, E1, Z2, N2, E2) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

%	Print all paths that start from a given energy level
print_paths_from(Z1, N1, E1) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

%	Print all paths that end at a given energy level
print_paths_to(Z2, N2, E2) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).
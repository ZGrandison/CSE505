/*
	Utility predicates used for printing information
	about the graph to console.
*/

%	Print all nuclides on record.
print_nuclides() :- forall(
	nuclide(Z, N, Name),
	(
		A is (Z + N),
		format('~w-~w~n', [A, Name])
	)
).

%	Print every energy state for every nuclide.
print_levels() :- forall(
	level(Z, N, E),
	(
		nuclide(Z, N, Name),
		A is (Z + N),
		format('~w-~w, ~w keV~n', [A, Name, E])
	)
).

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
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

%	Print all paths that start from a given energy level
print_paths_from(Z1, N1, E1) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

%	Print all paths that end at a given energy level
print_paths_to(Z2, N2, E2) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~nP = ~w~nSteps = ~w~n~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

print_n_steps(Z1, N1, E1, Z2, N2, E2, X) :- forall(
	path_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~n~n',
		[Z1, N1, E1, Z2, N2, E2, X]
	)
).

print_min_n_steps(Z1, N1, E1, Z2, N2, E2, X) :- forall(
	path_min_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~n~n',
		[Z1, N1, E1, Z2, N2, E2, X]
	)
).

print_max_n_steps(Z1, N1, E1, Z2, N2, E2, X) :- forall(
	path_max_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	format(
		'(~w,~w,~w) -> (~w,~w,~w)~n~n',
		[Z1, N1, E1, Z2, N2, E2, X]
	)
).
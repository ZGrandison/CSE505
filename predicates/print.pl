print_edges_from(Z1, N1, E1) :- forall(
	edge(Z1, N1, E1, Z2, N2, E2, P, Type),
	format(
		'(~w,~w,~w) -> (~w,~w,~w), P = ~w, Type = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Type]
	)
).

print_edges_to(Z2, N2, E2) :- forall(
	edge(Z1, N1, E1, Z2, N2, E2, P, Type),
	format(
		'(~w,~w,~w) -> (~w,~w,~w), P = ~w, Type = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Type]
	)
).

print_paths_from(Z1, N1, E1) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w), P = ~w, Steps = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).

print_paths_to(Z2, N2, E2) :- forall(
	path(Z1, N1, E1, Z2, N2, E2, P, Steps),
	format(
		'(~w,~w,~w) -> (~w,~w,~w), P = ~w, Steps = ~w~n',
		[Z1, N1, E1, Z2, N2, E2, P, Steps]
	)
).
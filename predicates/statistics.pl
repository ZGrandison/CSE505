count_nuclides(Count) :- aggregate_all(
	count,
	nuclide(_, _, _),
	Count
).

count_levels(Z, N, Count) :- aggregate_all(
	count,
	level(Z, N, _),
	Count
).

count_edges(Count) :- aggregate_all(
	count,
	edge(_, _, _, _, _, _, _, _),
	Count
).

count_edges_from(Z, N, E, Count) :- aggregate_all(
	count,
	edge(Z, N, E, _, _, _, _, _),
	Count
).

count_edges_to(Z, N, E, Count) :- aggregate_all(
	count,
	edge(_, _, _, Z, N, E, _, _),
	Count
).

count_paths(Z1, N1, E1, Z2, N2, E2, Count) :- aggregate_all(
	count,
	path(Z1, N1, E1, Z2, N2, E2, _, _),
	Count
).

count_paths_from(Z, N, E, Count) :- aggregate_all(
	count,
	path(Z, N, E, _, _, _, _, _),
	Count
).

count_paths_to(Z, N, E, Count) :- aggregate_all(
	count,
	path(_, _, _, Z, N, E, _, _),
	Count
).
/*
	Predicates used for collecting statistics
	related to the nuclear decay graph.
*/

%	Count total number of nuclides on record.
count_nuclides(Count) :- aggregate_all(
	count,
	nuclide(_, _, _),
	Count
).

%	Count total number of energy levels on record.
count_levels(Z, N, Count) :- aggregate_all(
	count,
	level(Z, N, _),
	Count
).

%	Count all edges between two arbitrary levels
count_edges(Z1, N1, E1, Z2, N2, E2, Count) :- aggregate_all(
	count,
	edge(Z1, N1, E1, Z2, N2, E2, _, _),
	Count
).

%	Count all edges that start at a given energy level
count_edges_from(Z, N, E, Count) :- aggregate_all(
	count,
	edge(Z, N, E, _, _, _, _, _),
	Count
).

%	Count all edges that end at a given energy level
count_edges_to(Z, N, E, Count) :- aggregate_all(
	count,
	edge(_, _, _, Z, N, E, _, _),
	Count
).

%	Count all paths between two arbitrary energy levels
count_paths(Z1, N1, E1, Z2, N2, E2, Count) :- aggregate_all(
	count,
	path(Z1, N1, E1, Z2, N2, E2, _, _),
	Count
).

%	Count all paths which start at a given energy level
count_paths_from(Z, N, E, Count) :- aggregate_all(
	count,
	path(Z, N, E, _, _, _, _, _),
	Count
).

%	Count all paths which end at a given energy level
count_paths_to(Z, N, E, Count) :- aggregate_all(
	count,
	path(_, _, _, Z, N, E, _, _),
	Count
).

%	Count all paths with exactly n steps
count_n_steps(Z1, N1, E1, Z2, N2, E2, X, Count) :- aggregate_all(
	count,
	path_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	Count
).

%	Count all paths with at least n steps
count_min_n_steps(Z1, N1, E1, Z2, N2, E2, X, Count) :- aggregate_all(
	count,
	path_min_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	Count
).

%	Count all paths with at most n steps
count_max_n_steps(Z1, N1, E1, Z2, N2, E2, X, Count) :- aggregate_all(
	count,
	path_max_n_steps(Z1, N1, E1, Z2, N2, E2, X),
	Count
).

%	Count all paths with at least X probability
count_min_probability(Z1, N1, E1, Z2, N2, E2, X, Count) :- aggregate_all(
	count,
	path_min_probability(Z1, N1, E1, Z2, N2, E2, X),
	Count
).

%	Count all paths with at most X probabilty
count_max_probability(Z1, N1, E1, Z2, N2, E2, X, Count) :- aggregate_all(
	count,
	path_max_probability(Z1, N1, E1, Z2, N2, E2, X),
	Count
).
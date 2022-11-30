:-	write('Loading csv/nuclides.csv...'),
	csv_read_file(
		'csv/nuclides.csv',
		Data,
		[functor(nuclide), arity(3)]
	),
	maplist(assert, Data),
	write('DONE\n').

:-	write('Saving to facts/nuclides.pl...'),
	setup_call_cleanup(
		open('facts/nuclides.pl', write, OUT),
		forall(
			nuclide(Z, N, Name),
			format(OUT, 'nuclide(~w, ~w, ~w).~n', [Z, N, Name])
		),
		close(OUT)
	),
	write('DONE\n').

:-	write('Loading csv/levels.csv...'),
	csv_read_file(
		'csv/levels.csv',
		Data,
		[functor(level), arity(3)]
	),
	maplist(assert, Data),
	write('DONE\n').

:-	write('Saving to facts/levels.csv...'),
	setup_call_cleanup(
		open('facts/levels.pl', write, OUT),
		forall(
			level(Z, N, Energy),
			format(OUT, 'level(~w, ~w, ~w).~n', [Z, N, Energy])
		),
		close(OUT)
	),
	write('DONE\n').

:-	write('Loading csv/decay-probabilities.csv...'),
	csv_read_file(
		'csv/decay-probabilities.csv',
		Data,
		[functor(decay), arity(8)]
	),
	maplist(assert, Data),
	write('DONE\n').

:-	write('Saving to facts/decay_probabilities.pl...'),
	setup_call_cleanup(
		open('facts/decay_probabilities.pl', write, OUT),
		forall(
			decay(Z1, N1, E1, Type, Z2, N2, E2, P),
			format(
				OUT,
				'decay(~w, ~w, ~w, \'~w\', ~w, ~w, ~w, ~w).~n',
				[Z1, N1, E1, Type, Z2, N2, E2, P]
			)
		),
		close(OUT)
	),
	write('DONE\n').

:-	writeln('Finished writing Prolog facts to file.'),
	halt.
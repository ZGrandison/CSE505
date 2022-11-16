/*csv_read_file('nuclides.csv', Data, [functor(nuc), arity(3)]), maplist(assert, Data).
 *saveQueries('output.pl').
 *listing(nuc).
 *stopQueriesSaving.
 *
 * */

saveQueries(FileName) :-
    protocol(FileName).

stopQueriesSaving :-
    noprotocol.


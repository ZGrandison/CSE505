# CSE505

To convert CSV into .pl file of facts:

1. Run SWI-Prolog
2. Consult nuclides_loading.pl
3. Query "? csv_read_file('example.csv', Data, [functor(example), arity(X)]), maplist(assert, Data).", where 'example.csv' is the source csv,
example is the name of the fact, and X is the number variables you want in the resulting facts (i.e arity(3) -> example(X, Y, Z)).
4. Query "? saveQueries('output.pl').", where 'output.pl' is the name of the file you want to write the output to.
5. Query "? listing(nuc).", which will list all of the facts resulting from the csv_read_file.
6. Query "? stopQueriesSaving.", to stop the recording of output from prolog (Note the resulting file will have a few extraneous lines to be deleted at the beginning and end).

## Data Pipeline - `.csv` to Prolog

The nuclear decay data used in this project was obtained from the ENSDF database.
The original text files are stored in `.zip` and `.tar.gz` format under `archives/`.

Datasets from ENSDF were then converted into `.csv` files.
These are stored under `csv/`.

These `.csv` files were then converted into Prolog predicates using the following script:

```
swipl facts.pl
```

This script saves file output to the `facts/` folder.

## Initializing

To load all files from `facts/`, run the following command:

```
swipl load.pl
```

This will load the `nuclide/3`, `level/3`, and `decay/8` fact tables.
# CSE505

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
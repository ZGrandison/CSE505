edge(0, 1, 1, 1, 0.1).
edge(0, 1, 0, 3, 0.9).
edge(0, 3, 0, 6, 0.5).
edge(0, 6, 1, 1, 1).

/* Query used: (0, 1) -> (1, 1)
2 Possible Paths:
(0, 1) -> (1, 1) with prob 0.1, length 1
(0, 1) -> (0, 3) -> (0, 6) -> (1, 1) with prob 0.45, length 3 ( Query: ? sp(0, 1, 1, 1, N). )*/


/* Finds shortest path (0, 1) -> (1, 1) */
:- table sp(_, _, _, _, po('<'/2)).
sp(X1, X2, Y1, Y2 ,1):- edge(X1, X2, Y1, Y2, _).
sp(X1, X2, Z1, Z2 , N):- sp(X1, X2, Y1, Y2, N1), edge(Y1, Y2, Z1, Z2, _),N is N1 + 1.



/* Finds the most probable path (0, 1) -> (0, 3) -> (0, 6) -> (1, 1) ( Query: ? sp(0, 1, 1, 1, P). )*/
/*:- table sp(_, _, _, _, po('>'/2)).
sp(X1, X2, Y1, Y2 , P) :- edge(X1, X2, Y1, Y2, P).
sp(X1, X2, Z1, Z2 , P) :- sp(X1, X2, Y1, Y2, P1), edge(Y1, Y2, Z1, Z2, P2), P is P1 * P2.*/



/* Unexpected behavior when trying to include both variables, I dont think the po() works well with multiple
 * unknown variables ( Query: ? sp(0, 1, 1, 1, _, X). )
 * */
/*:- table sp(_, _, _, _, _, po('<'/2)).
sp(X1, X2, Y1, Y2, 1, P) :- edge(X1, X2, Y1, Y2, P).
sp(X1, X2, Z1, Z2, N, P) :- sp(X1, X2, Y1, Y2, N1, P1), edge(Y1, Y2, Z1, Z2, P2), N is N1 + 1, P is P1 * P2.*/
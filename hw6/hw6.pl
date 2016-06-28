reverse([], H, H). 
reverse([H|T], X, Y) :- reverse(T, [H|X], Y).

insertitem(Item, [], [Item]).
insertitem(Item, [Y|T1], [Item, Y|T1]) :- Item =< Y.
insertitem(Item, [Y|T2], [Y|T1]) :- insertitem(Item, T1, T2).

sum([], [], 0).
sum([H1|T1], [H2|T2], Total) :- sum(T1, T2, Sum1), Total is (((H1 - H2) * (H1 - H2)) + Sum1). 

distance(Vector1, Vector2, Dist) :- sum(Vector1, Vector2, X), Dist is sqrt(X). 


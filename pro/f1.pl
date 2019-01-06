phone --> 
	calls,
	?gps,
	screen,
	?media.

screen -->
	basic,
	color,
	highRes.

media -->
	camera ;
	mp3.

leaf(X,L.[X|L]) :- \+ clause(X,_).


c2l((X;Y),[X|Z]) :- !, c2l(Y,Z).
c2l(X,    [X]).

g2l(G) :- clause(G,H), !, prove(H).

prove1([],[]).
prove1([X,Y|Z]) :-
  prove1(X),
  prove([Y|Z])

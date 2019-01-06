s --> np,vp.
np --> det,n.
vp --> tv,np.
vp --> v.
det --> [the].
det --> [a].
det --> [every].
n --> [man].
n --> [woman].
n --> [park].
n --> [loves].
tv --> [loves].
tv --> [likes].
v --> [walks].

=(X,L,L) :-
  member(X,L).

+(X,L,[X|L]).

++(X,L0,[X=Val|L]) :-
  less1(L0,X=Val0,L),!,
  Val is Val0 + 1.
++(X,L,[X=1|L]).

less1([A|B], A, B).
less1([A|B], C, [A|D]) :-
  less1(B, C, D).

fail(_,_) :-
  fail.

print(X,L,L) :-
  print(X),nl.

main(Words) :- go(Words, [],_).
go(W) --> reset,run(W), report.
reset --> +(words=0).
run([])    --> [].
run([H|T]) --> ++(words),run1(H), run(T).
run1(X) --> animal(X),!,++(animal).
run1(_) --> [].

animal(bird) --> [].
animal(dog) --> [].

report --> =(X), print(X),fail.
report --> [].

:- main([s]).

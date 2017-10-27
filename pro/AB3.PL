/*
=head1 System 

=head2 Background knowledge*/

 worth(tranquility,hi, 2).
 worth(diet,fatty,    -2).
 worth(healthy,t,      1).

 goals(gordon/t) :- rich/t, satieted/t.
 goals(bill/t)   :- tranquility/hi.

 happy/t         :- gordon/t, rich/t,healthy/t.
 happy/t         :- bill/t,   tranquility /hi.
 tranquility/hi  :- conscience/clear.
 tranquility/hi  :- satiated/t.
 satiated/t      :- bill/t, diet/fatty.
 healthy/t       :- diet/light.

 gordon/t :- vote/republican.
 bill/t   :- vote/democrat.

 seq/12 :- obj(fred)/t, obj(jon)/t, message(fred,jon)/m1.

 %obj(jon).
 %type(jon,person).

 %method(person,m1).

  

 /*

=head2 Current facts. */

 %rich/t.

  %vote/republican.

 %diet/light.
 %tim/f.
 %satiated/f.
 /*

=head2 High level goal */

 done/t        :- happy/t.
 %done/t        :- seq/12.

/*

=head2 Example output

Here's one run. 

 55 ?- goes.
 +3.................................................
 :- dynamic best/1.

 best(assumption(done, t, 1)).
 best(assumption(happy, t, 1)).
 best(assumption(rich, t, 2)).
 best(assumption(healthy, t, 1)).
 best(assumption(diet, light, 0)).
 best(assumption(tranquility, hi, 1)).
 best(assumption(conscience, clear, 0)).

Here's another run:

 56 ?- goes.
 +0..+3..............................................
 :- dynamic best/1.

 best(assumption(done, t, 1)).
 best(assumption(happy, t, 1)).
 best(assumption(rich, t, 2)).
 best(assumption(healthy, t, 1)).
 best(assumption(diet, light, 0)).
 best(assumption(tranquility, hi, 1)).
 best(assumption(conscience, clear, 0)).

=head1 Implementation

=head2 Working memory management */

 wme(assumption(_,_,_)).

 wme(F,A,B) :- wme(B), functor(B,F,A).

 reset :- wme(F,A,B),dynamic(F/A),retract(B),fail.
 reset.

 report :- report(silent).

 report(silent).
 report(loud) :-
	setof(W/X=Y,assumption(X,Y,W),All),
	forall(member(One,All),
	       format('~w.\n',One)). /*

=head2 Outer loop */

 goes :- goesReset, goes(50,-1,_),goesReport.

 goesReset :- dynamic(status/2), retractall(status(_,_)).
 goesReport :- listing(status).

 goesScores(S) :- bagof(N,goesScore(N),All), !,sum(All,S).
 goesScores(0).
 goesScore(N)  :- assumption(X,Y,_), worth(X,Y,N).

 goes(0,S,S).
 goes(N0) --> {dec(N0,N),ignore(go)}, goes1, goes(N).

 dec(N0,N) :- N0 > 0, N is N0 - 1.

 goes1(S0,S) :-
	goesScores(S1),
	(S1 > S0 -> remember,spit(+S1),S=S1; spit('.'),S=S0).

 remember :-
	retractall(best(_)),
	forall(assumption(A,B,C),
	       assert(best(assumption(A,B,C)))). /*

=head2 Inner Loop */

 go :- go(silent).

 go(Mode) :- reset,run, report(Mode).

 run    :- run(done/t).
 run(X) :- maybe(X). /*

=head2 Assumption management */

 assume(X/Y,_)   :- assumption(X,Z,_),!,Y=Z.
 assume(X/Y,How) :- bassert(assumption(X,Y,How)).

 bassert(X) :- assert(X).
 bassert(X) :- retract(X),fail. /*

=head2 Assumption generation

Standard idiom: look up what to do (in C<maybe0>); then
do it (in C<maybe1>). */

 maybe(X) :- once(maybe0(X,Y)), maybe1(Y).  /*

Look-up table to find our best action: */

 maybe0(true,               do(true)).
 maybe0(inc(N),           do(inc(N))).
 maybe0((X,Y),               rand(L)) :- aslist((X,Y),L).
 maybe0(rand([]),           do(true)).
 maybe0(rand([H|T]),     rand([H|T])).
 maybe0(rany(0,[]),         do(fail)).
 maybe0(rany(_,[]),         do(true)).
 maybe0(rany(N,[H|T]), rany(N,[H|T])).
 maybe0((X;Y),         rany(0,    L)) :- aslist((X;Y),L).
 maybe0(X/Y,               fact(X/Y)) :- clause(X /_,true).
 maybe0(X/Y,               rule(X/Y)) :- clause(X/_,_).
 maybe0(X/Y,          abducible(X/Y)).
 maybe0(X,                     do(X)). /*

Now, do something: */

 maybe1(do(X)) :- X.
 maybe1(rany(N0,L0)) :-
	one(select(X,L0,L)),
	(maybe(X) -> N is N0+1; N=N0),
	maybe(rany(N,L)).
 maybe1(rand(L0)) :-
	one(select(X,L0,L)),
	maybe(X),
	maybe(rand(L)).
 maybe1(abducible(X)) :-
	assume(X,0).
 maybe1(rule(X)) :-
	assume(X,1),
	bagof(Y,clause(X,Y),L),
	maybe(rany(0,L)).
 maybe1(fact(X)) :-
	assume(X,2),
	one(X).  /*

=head2 Random ordering

Return solutions to goal C<X>, in some random order. */

 one(X) :- 
	setof(One,X^one1(X,One),All0), 
	beam(X,All0,All), 
	member(_/X,All).

 one1(X,Score/X) :- 
	X, 
	score(X,Score0), 
	bound(X,Score0), 
	Score is -1 * Score0. % greg- why do i negate it?
/*

If we have no knowledge of X, give it a random number. */

 score(_,N) :- 
	N is  rand(2147483647). /*

If we have knowledge of minimum values for a score,  test it here. */

 bound(_,Score) :- 
	Score > 0. /*

Sometimes, we may just want to select the top "N" values:
makes this a beam search

But right now, we have no selection knowledge. */

 beam(_,L,L).  /*

=head2 Low-level stuff */


 sum([H|T],S) :- sum(T,H,S).
 sum([],Sum,Sum).
 sum([H|T],Temp,Sum) :-
	Temp1 is H + Temp,
	sum(T,Temp1,Sum).

 spit(X) :- write(user,X), flush_output(user).

 aslist((X;Y),[X|T]) :- !,aslist(Y,T).
 aslist((X,Y),[X|T]) :- !,aslist(Y,T).
 aslist(X,    [X]).	

 rand(R,N) :- my_random(R,N).

 defaultSeed(17).
 seed0 :- retractall(seed(_)), defaultSeed(N),assert(seed(N)).

 :- seed0.
 :- arithmetic_function(rand/1).

 my_random(Largest,N) :-
        retract(seed(Number)),
        RN is (25173 * Number + 13849) mod 65536,
        N is (RN mod Largest) + 1,
        asserta(seed(RN)).

 assessSeed :- tell(seeds), forall(assessSeed1(N),format('~w\n',[N])), told.
 assessSeed1(X) :- between(1,35000,_), X is rand(1000). /*


=head2 Patches */

%:- [patch01].

% ex 1.1

search2(E, [E, E | T]).
search2(E, [H | T]) :- search2(E, T).

% ex 2.1

search_two(E, [E, _, E | T]).
search_two(E, [H | T]) :- search_two(E, T).

% ex 1.3 

size([], 0).
size([E | T], R) :- size(T, R1), R is R1 + 1.

% ex 1.4

sum([], 0).
sum([H | T], S) :- sum(T, R), S is R + H. 

% ex 1.5

max_min([], TMax, TMin, TMax, TMin).
max_min([H | T], Max, Min) :- max_min(T, Max, Min, H, H).
max_min([H | T], Max, Min, TMax, TMin) :- H > TMax, max_min(T, Max, Min, H, TMin).
max_min([H | T], Max, Min, TMax, TMin) :- H < TMin, max_min(T, Max, Min, TMax, H).
max_min([H | T], Max, Min, TMax, TMin) :- max_min(T, Max, Min, TMax, TMin).

% ex 1.6 take & split

take(_, 0, TL, TL).
take([], _, TL, TL).

take([], N, TL).
take(List, N, L) :- take(List, N, [], R), reverse(R, L).
take([H | T], N, TL, L) :- 
	N > 0, 
	N1 is N - 1, 
	take(T, N1, [H | TL], L).

split(List, 0, TL, TL, List).
split([], _, TL, TL, []). 

split([H | T], N, TL, L, Rest) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, [H | TL], L, Rest).

split(List, N, L, Rest) :-
    split(List, N, [], R, Rest),
    reverse(R, L).

% ex 1.7

rotate([H | T], L) :- append(T, [H], L).

% ex 1.8

dice(X) :- member(X, [1, 2, 3, 4, 5, 6]).

% ex 1.9

three_dice(N, L) :-     findall([X, Y, Z], 
            (member(X, [1, 2, 3, 4, 5, 6]), 
             member(Y, [1, 2, 3, 4, 5, 6]), 
             member(Z, [1, 2, 3, 4, 5, 6]), 
             X + Y + Z =:= N), 
            L).

% ex 2.1

dropAny(X, [X | T], T).
dropAny(X, [H | Xs], [H | L]) :- dropAny(X, Xs, L).

% ex 2.2

dropFirst(X, [X | T], T) :- !.
dropFirst(X, [H | Xs], [H | L]) :- dropFirst(X, Xs, L).

dropLast(X, L, R) :- reverse(L, R1), dropFirst(X, R1, R2), reverse(R2, R).

% not working... 
dropAll(_, [], []).
dropAll(X, L, T) :- dropFirst(X, L, R), dropAll(X, R, T).

% ex 3.1

fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

% ex 3.2

fromCircList([_], []).
fromCircList([H | T], G) :- append([H | T], [H], R), fromList(R, G). 

% ex 3.3

outDegree([], _, Degree, Degree).
outDegree(Graph, Node, Degree) :- outDegree(Graph, Node, Degree, 0).
outDegree([e(H1, H2) | T], Node, Degree, N) :- H1 =:= Node, N1 is N + 1, outDegree(T, Node, Degree, N1).
outDegree([e(H1, H2) | T], Node, Degree, N) :- H1 \= Node, outDegree(T, Node, Degree, N).

% ex 3.5

reaching(G, E1, L) :- findall(E2, (member(e(E1, E2), G)), L).

% ex 3.6

nodes([], []).
nodes([e(H1, H2) | T], L) :- nodes(T, L), member(H1, L), member(H2, L).
nodes([e(H1, H2) | T], [H2 | L]) :- nodes(T, L), member(H1, L).
nodes([e(H1, H2) | T], [H1 | L]) :- nodes(T, L), member(H2, L).



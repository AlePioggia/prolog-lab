% ex 1.1 

search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

% ex 1.2 search2

search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

% ex 1.3

search_two(X, cons(_, cons(X, Xs))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).

% ex 1.4 part 1

search_anytwo(X, cons(X, cons(_, cons(X, _)))).
search_anytwo(X, cons(X, cons(X, _))).
search_anytwo(X, cons(_, XS)) :- search_anytwo(X, XS).

% ex 1.4 part 2

size(nil, zero).
size(cons(_, Tail), s(Size)) :- size(Tail, Size).

% ex 2.2 

sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

sum_list(nil, zero).
sum_list(cons(H, T), S) :- sum_list(T, R), sum(H, R, S).

% SUM

% sum(s(s(s(zero))), s(s(zero)), N).
% sum(s(s(s(zero))), s(zero), N_1). N\s(N_1)
% sum(s(s(s(zero))), zero, N_2). N_1\s(N_2) & N\s(s(N_2)
% sum(s(s(s(zero))), zero, s(s(s(s(s(N_2))).

% EX 2.4 max

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).
max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), TempMax, Max) :-
    (greater(H, TempMax) -> NewMax = H ; NewMax = TempMax),
    max(T, NewMax, Max).

% ex 2.5 max-min

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

max(X, Y, Y) :- greater(X, Y).
max(X, Y, X) :- greater(Y, X).
max(X, X, X).

min(X, Y, X) :- max(X, Y, Y).
min(X, Y, Y) :- max(X, Y, X).
min(X, X, X).

% base case
f(nil, Min, Max, Min, Max).
% start iteration
f(cons(H, T), Max, Min) :- f(T, H, H, Min, Max).
% case in which you can set new max
f(cons(H, T), TMax, Max, TMin, Min) :- max(TMax, H, H), f(T, TMax, H, TMin, Min).
% case in which you can set new min
f(cons(H, T), TMax, Max, TMin, Min) :- min(TMin, H, H), f(T, TMax, Max, TMin, H).

% ex 3.1

same(nil, nil).
same(cons(H1, T1), cons(H2, T2)) :- H1 = H2, same(T1, T2). 


% ex 3.2

all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), same(T1, T2).

% ex 3.3

sublist(nil, L).
sublist(cons(H1, T1), L) :- search(H1, L), sublist(T1, L). 

% ex 4.1 generates a sequence, it computes size by removing s() step by step

seq(zero, _, nil).
seq(s(N), E, cons(E,T)) :- seq(N, E, T).

% ex 4.2 same as 4.1 but ordering is requested

seqR(zero, nil).
seqR(s(N), cons(N, T)) :- seqR(N, T).

% ex 4.3

last(nil, E, cons(E, nil)).
last(cons(H, T), E, cons(H, R)) :- last(T, E, R).



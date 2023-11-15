-module(math_functions).
-export([odd/1, even/1, filter/2, split/1, split_filter/1]).


even(X) when X rem 2 =:= 0 -> true;
even(_) -> false.

odd(X) -> not even(X).

split(L) -> split(L, [], []).
split([H|T], Odd, Even) when (H rem 2) =:= 0 -> split(T, Odd, [H|Even]);
split([H|T], Odd, Even) -> split(T, [H|Odd], Even);
split([], Odd, Even) -> {lists:reverse(Even), lists:reverse(Odd)}.

split_filter(L) -> {filter(fun even/1, L), filter(fun odd/1, L)}.

filter(F, L) -> [X || X <- L, F(X)].

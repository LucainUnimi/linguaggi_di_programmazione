-module(sequential).
-export([is_palindrome/1, is_an_anagram/2, factors/1, is_perfect/1 ]).

is_palindrome(S) -> 
  L = string:casefold(
        lists:filter(
          fun(X) -> not lists:member(X, [$.,$,,$?,$!,$:,$;,$ ]) end,
          S)
       ), string:reverse(L).

is_an_anagram(_,[]) -> false;
is_an_anagram(S,[H|T]) -> string:equal(lists:sort(S), lists:sort(H)) or is_an_anagram(S, T).


factors(N,C,ACC) when N rem C == 0 -> factors(N div C,C,[C|ACC]);
factors(N,C,ACC) when C > N -> lists:reverse(ACC);
factors(N,C, ACC) -> factors(N, C+1, ACC).

factors(N) -> factors(N,2, []).


divisors(N) -> divisors(N, 2, [1]).
divisors(N, C, ACC) when N == C -> lists:reverse(ACC);
divisors(N, C, ACC) when N rem C == 0 -> divisors(N,C+1,[C|ACC]);
divisors(N, C, ACC) -> divisors(N,C+1,ACC).

is_perfect(N) -> lists:sum(divisors(N)) == N.

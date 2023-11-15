-module(part4es2).
-export([
          my_tuple_to_list/1
        ]).

my_tuple_to_list(T) -> 
  my_tuple_to_list_aux(T, 1, tuple_size(T), []).

my_tuple_to_list_aux(T,N,N,L) -> 
  E = element(N,T),
  lists:reverse([E|L]);
my_tuple_to_list_aux(T,N,M,L) -> 
  E = element(N, T),
  my_tuple_to_list_aux(T, N+1, M, [E|L]).

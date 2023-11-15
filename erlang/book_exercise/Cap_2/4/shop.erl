-module(shop).
-export([
          cost_shopping_list/1,
          total/1,
          total_comprehension/1
        ]).


cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

cost_shopping_list([]) -> 0;
cost_shopping_list([{What, N}|T]) -> 
  cost(What) * N + cost_shopping_list(T).


total(L) -> lists:sum(lists:map( fun({What, N}) -> cost(What)*N end, L)).


total_comprehension(L) -> 
  lists:sum([cost(What) * N || {What, N} <- L]).

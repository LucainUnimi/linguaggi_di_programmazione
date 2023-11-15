-module(my_map).
-export([
         map_search_pred/2
        ]).

map_search_pred(M, P) -> 
  map_search_pred_aux(maps:keys(M),M,P)
  .

map_search_pred_aux([K|T], M, P) ->
  #{K := V} = M,
  case P(K, V) of
      true ->
      {K, V};
      _ ->
          map_search_pred_aux(T, M, P)
  end
  ;
map_search_pred_aux([], _, _) -> {}.

-module(drs).
-export([
         long_reverse_string/1
        ]).

long_reverse_string(S) -> register(master, spawn(fun() -> create_slave(S) end)).

create_slave(S) -> Len = length(S),
                   Mod = Len rem 10,
                   Lsubs = subs(S, Len, Mod, 1, 1),
                   lists:map(fun(Subs) -> spawn( fun() -> slave_reverse(Subs) end ) end, Lsubs),
                   loop(0, [])
                   .

loop(10, L) -> S = lists:concat(lists:map(fun({A, _}) -> A end, L)),
               io:format("~s~n", [S]), S;
loop(C, L) ->
  receive
    { _ , _ } = T -> NewL = lists:usort(fun({_, A}, {_, B}) -> A > B end, [T|L]), loop(C+1, NewL)
  end.

slave_reverse({S, I}) -> master ! {lists:reverse(S), I}.

subs(S, L, _, Pos, C) when (Pos + (L div 10)) > L -> [{lists:sublist(S, Pos, (L div 10)), C}];
subs(S, L, M, Pos, C) when M =/= 0 -> [ {lists:sublist(S, Pos, (L div 10 )+1 ), C} | subs(S, L, M-1, Pos+(L div 10 +1), C+1) ];
subs(S, L, M, Pos, C) -> [{lists:sublist(S, Pos, (L div 10)), C} | subs(S, L, M, (Pos + (L div 10 )), C+1)].

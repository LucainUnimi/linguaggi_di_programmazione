-module(distributedassociativestore).
-export([
         start/0,
         start/1,
         store/3,
         list_all/1
        ]).


start(N) -> L = for(1, N, fun() -> spawn(fun() -> loop([],[]) end) end),
            lists:foreach(fun(Pid) -> Pid ! {addNode, L--[Pid]} end, L),
            L
            .

start() -> start(2).

store(Pid, Key, Value) -> Pid ! {store, {Key, Value}}.

list_all(Pid) -> Pid ! list_all.

for(N, N, F) -> [F()];
for(I, N, F) -> [F() | for(I+1 ,N, F)].

loop(Nodes, L) ->
  receive
    list_all -> io:format("~p", [L]), loop(Nodes, L);
    M = {store, P = {_, _}} -> io:format("~p storing ~p~n", [self(), P]),
                               loop(Nodes, [P|L]);
    show -> io:format("other node is ~p~n", [Nodes]), loop(Nodes, L);
    {addNode, N} -> loop(N, L);
    Any -> io:format("~p received ~s~n", [self(), Any]), loop(Nodes, L)
  end.

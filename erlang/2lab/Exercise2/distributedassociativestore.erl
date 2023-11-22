-module(distributedassociativestore).
-export([
         start/0,
         loop/1
        ]).


start() -> io:format("~p starts the nodes~n", [self()]),
  spawn(fun() -> loop([]) end).


loop(L) ->
  receive
    Any -> io:format("~p received ~s~n", [self(), Any])
  end.

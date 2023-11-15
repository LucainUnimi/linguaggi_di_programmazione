-module(test).
-export([start/3, node/0]).

start(M,1,Message) -> 
  S = spawn(test, node, []),
  S ! Message,
  io:format("~p~n", [S]);
start(M,N,Message) -> 
  S = spawn(test, node, []),
  S ! Message,
  io:format("~p~n", [S]),
  start(M,N-1,Message).


node() ->
  receive
    Other -> io:format("~s~n", [Other])
  end.


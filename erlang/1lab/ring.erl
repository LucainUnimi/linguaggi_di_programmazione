-module(ring).
-export([start/2, node/1]).


node(1) -> io:format("this act has pid: ~p~n", [self()]),
          io:format("this is the last act~n"),
          loop(self());
node(N) -> io:format("this act has pid: ~p~n", [self()]),
          Next = spawn(ring, node, [N-1]),
          io:format("this act spawn a new act: ~p~n", [Next]), 
          loop(self(), Next)
          .

loop(Who) -> 
  receive
    stop -> io:format("the act ~p received the stop comand and propagate it to the next node~n", [Who]);
    Other -> io:format("~s~n",[Other])
  end.


loop(Who, Next) ->
  receive
    stop -> io:format("the act ~p received the stop comand and propagate it to the next node~n, at loop ~p", [Who, self()]),
            Next ! stop;
    Other -> io:format("~s~n",[Other]),
             Next ! Other
  end.

start(N, Message) -> 
  First = spawn(ring, node, [N]),
  First ! Message.

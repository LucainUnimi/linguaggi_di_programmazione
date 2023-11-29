-module(ring).
-export([
         start/3
        ]).

start(M, 1, Message) -> spawn(fun() -> loop_last() end);
start(M, N, Message) -> spawn(fun() -> loop() end).

for  q



loop_last() -> 
  receive
    Any -> io:formt("Hey, I (~p) just received somethinkg (~s)~n", [Any]), loop()
  end.

loop(Pid) ->
  receive
    Any -> io:formt("Hey, I (~p) just received something (~s)~n", [Any]), loop(Pid)
  end.

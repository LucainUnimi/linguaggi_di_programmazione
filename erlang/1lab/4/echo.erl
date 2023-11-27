-module(echo).
-export([
         start/0,
         print/1,
         stop/0
        ]).

start() -> register(server, spawn(fun() -> loop() end)),
           link(whereis(server)),
           ok.

print(Term) -> rpc( server, {msg, Term}).
stop() -> rpc(server, stop).

rpc(Pid, Request) -> 
  Pid ! {self(), Request},
  receive
    Response -> Response
  end.

loop() ->
  receive
    {_, stop} -> io:format("stopping server...~n"), exit("Server Stoped");
    {From, {msg, Any}} -> io:format("received: ~s~n", [Any]),
                        From ! ok,
                        loop()
  end.

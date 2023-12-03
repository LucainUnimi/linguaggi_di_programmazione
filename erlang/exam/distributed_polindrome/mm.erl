-module(mm).
-export([
         start/0
        ]).

start(Server) ->
  group_leader(whereis(user), self()),
  pocess_flag(trap_exit, true),
  io:format("*** ~p im alive: ~p~n", [node(), is_process_alive(self())]),
  receive
    {pidserver, Server} -> loop(Server).
  end.


loop(Server) -> 
  receive
    {client, M} -> io:format("~p just received a message from the client: M~n"),
                   io:format("send it to the server...~n"),
                   send_to_server(Server, M, 0), loop(Server);
    {'EXIT', Pid, Why} -> io:format("stopping...~n");
    Other -> io:fomrat("~p received an unexpected message: ~p~n", [self(), Other]), loop()
  end.


send_to_server(Server, [H|[]], C) -> rpc(Server, {H, C};
send_to_server(Server, [H|T], C) -> rpc(Server, {H, C}), send_to_server(Server, T).

rpc(Pid, M) -> Pid ! {self(), M, C}

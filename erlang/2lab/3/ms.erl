-module(ms).
-export([
         start/1,
         to_slave/2
        ]).

start(N) -> register(master, spawn(fun() -> create_slave(N) end)),
            ok.

create_slave(N) -> process_flag(trap_exit, true),
                   io:format("master: ~p creating ~p slaves", [self(), N]),
                   L = nofor(1, N, fun(A) -> spawn_link(fun() -> loop_slave(A) end) end),
                   % lists:foreach(fun(Pid) -> link(Pid), io:format("~p link to ~p~n", [self(), Pid]) end, L),
                   X = lists:zip(L, lists:seq(1,N)),
                   io:format("list of slaves ~p~n",[X]),
                   loop_master(X),
                   ok.

loop_master(L) ->
  receive
    {'EXIT',Pid, Why} ->  io:format("~p send me a die message ~s. Is it alive ? ~s~n", [Pid, Why, is_process_alive(Pid)]),
                          io:format("restart new slave~n", []),
                          loop_master(new_slave(L, Pid));
    {msg, Message, N} -> send_to(L, Message, N), loop_master(L);
    Any -> Any, loop_master(L)
  end.

send_to([{Pid, N}|_], Message, N) -> Pid ! Message;
send_to([_|T], Message, N) -> send_to(T, Message, N).
% 
to_slave(Message, N) -> master ! {msg, Message, N}, ok.
% 
new_slave(L, Pid) -> new_slave_aux(L, Pid, []).
% 
new_slave_aux([{Pid, N}|T], Pid, ACC) -> NewPid = spawn(fun() -> loop_slave(N) end),
                                         L = lists:merge(lists:reverse(ACC), [{NewPid, N}|T]),
                                         io:format("list of slaves ~p~n", [L]),
                                         L;
new_slave_aux([H|T], Pid, ACC) -> new_slave_aux(T, Pid, [H|ACC]).
% 
loop_slave(Who) ->
  receive
    die -> io:format("~p number ~p die~n", [self(), Who]), exit(die);
    Any -> io:format("*** ~p received: ~s~n",[Who, Any]), loop_slave(Who)
  end.
% 
nofor(M,M,F) -> [F(M)];
nofor(N,M,F) -> [F(N) | nofor(N+1,M,F)].

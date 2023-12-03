-module(client).
-export([
         start/0,
         close/0
        ]).




start() -> spawn(fun() -> create_net() end),
           ok.

create_net() -> PidM1 = spawn_link('mm1@Lucas-MacBook-Pro', mm, start, []),
                PidM2 = spawn_link('mm2@Lucas-MacBook-Pro', mm, start, []),
                PidServer = spawn_link('server@Lucas-MacBook-Pro', server, start, [PidM1, PidM2]),
                PidM1 ! {pidserver, PidServer},
                PidM2 ! {pidserver, PidServer},
                io:format("~p~p~p~n",[PidM1, PidM2, PidServer])
                .


close() -> io:format("stopping...~n"), exit("stop").

rpc(Pid, M) -> Pid ! M.

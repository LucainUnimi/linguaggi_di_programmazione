-module(cc).
-export([
         start/0,
         service/1
        ]).

start() -> register(server, spawn(fun() -> loop([]) end)).

do_stuff(Service) -> io:format("doing some ~s~n", [Service]), timer:sleep(1000).


add_one_to(L, Service) -> add_one_to(L, Service, []).

add_one_to([{Service, C} | T], Service, ACC) -> lists:merge(ACC, [{Service, C+1}|T]);
add_one_to([], Service, ACC) -> [{Service, 1} | ACC];
add_one_to([H|T], Service, ACC) -> add_one_to(T, Service, [H|ACC]).

service(Service) -> server ! Service.

loop(L) -> 
  receive
    tot -> do_stuff(tot), X = add_one_to(L, tot), io:format("~p~n", [X]), loop(X);
    DummyService -> do_stuff(DummyService), loop(add_one_to(L, DummyService))
  end.


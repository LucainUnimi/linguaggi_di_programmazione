-module(server).
-export([
         loop/0
        ]).

start(MM1, MM2) -> 
  group_leader(whereis(user), self()),
  process_flag(trap_exit, true),
  io:format("*** ~p im alive: ~p~n", [node(), is_process_alive(self())]),
  loop().

loop(MM1, MM2) -> 
  receive
    {MM1, M} -> 
      case compare(MM2, M) of
        true -> loop(MM1, MM2);
        false -> io:foramt("not palindrome~n"),
                 clear_mailbox()
    {MM2, M} -> 
      case compare(MM1, M) of
        true -> loop(MM1, MM2);
  end.

clear_mailbox() ->
  receive
   _Any -> clear_mailbox()
  after 0 -> ok
  end.


compare(MM, M) ->
  receive
    {MM, M} -> true;
    {MM, N} -> false
  end.

-module(part4es3).
-export([
         my_time_func/1,
         my_date_string/0
        ]).

my_time_func(F) ->
  Start = erlang:system_time(nanosecond),
  F,
  Stop = erlang:system_time(nanosecond),
  Stop - Start.

my_date_string() -> 
  {Year, Month, Day} = date(),
  {Hours, Minutes, Seconds} = time(),
  io:format("Today is the ~w of the ~w'th month of the ~w, now is ~w:~w:~w", [Day, Month, Year, Hours, Minutes, Seconds])
  .


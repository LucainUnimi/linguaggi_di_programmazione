-module(twofer).
-export([
         twofer/1,
         twofer/0
        ]).

twofer() -> twofer("").
twofer("") ->io:format("One for you, one for me~n"); 
twofer(Nome) -> io:format("One for ~s, one for me~n", [Nome]).

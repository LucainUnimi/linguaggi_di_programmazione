-module(space).
-export([
         age/1
        ]).

age({A,B}) -> io:format("that's ~f ~s-years old.~n",[age_t({A,B}), A]).

age_t({venus, Seconds})     -> Seconds/31557600 / 0.2408467;
age_t({earth, Seconds})     -> Seconds/31557600;
age_t({jupiter, Seconds})   -> Seconds/31557600 / 11.862615;
age_t({mars, Seconds})      -> Seconds/31557600/ 1.8808158;
age_t({saturn, Seconds})    -> Seconds/31557600/ 29.447498;
age_t({urans, Seconds})     -> Seconds/31557600/ 84.016846;
age_t({neptune, Seconds})   -> Seconds/31557600/ 164.79132;
age_t({mercury, Seconds})   -> Seconds/31557600/ 0.2408467.

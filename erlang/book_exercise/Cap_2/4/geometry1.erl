-module(geometry1).
-export([
         area/1,
         test/0,
         perimetres/1
        ]).

test() -> 
  12 = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  92.0 = area({tringle_right_angoled, 8, 23}),
  16 = perimetres({rectangle, 3, 5}),
  12.0 = perimetres({tringle_right_angoled, 3, 4}),
  16 = perimetres({square, 4}),
  tests_worked.


area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14159 * Radius * Radius;
area({tringle_right_angoled, Base, Height}) -> Base * Height / 2;
area({square, Side}) -> Side * Side.

perimetres({rectangle, Width, Height}) -> (Width + Height) * 2;
perimetres({circle, Radius}) -> 3.14159 * Radius * 2;
perimetres({tringle_right_angoled, Base, Height}) -> Base + Height + math:sqrt(Base*Base + Height * Height);
perimetres({square, Side}) -> Side * 4.



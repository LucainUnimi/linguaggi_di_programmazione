type t_unit = Celsius|Fahrenheit|Kelvin|Rankine|Delisle|Newton|Reaumur|Romer ;;
type temperaure = { value : float; tu : t_unit} ;;

let cons = [Celsius; Fahrenheit; Kelvin; Rankine; Delisle; Newton; Reaumur; Romer] ;;
let cons_repr = [(Celsius, "C"); (Fahrenheit, "F"); (Kelvin, "K"); (Rankine, "R"); (Delisle, "De"); (Newton, "N"); (Reaumur, "Ré"); (Romer, "Rø")] ;;

let any2c t =
  match t.tu with
  | Celsius     -> t
  | Fahrenheit  -> { value = (t.value -. 32.) *. 5. /. 9.;    tu = Celsius }
  | Kelvin      -> { value = t.value -. 273.15 ;              tu = Celsius }
  | Rankine     -> { value = (t.value -. 491.67) *. 5. /. 9.; tu = Celsius }
  | Delisle     -> { value = 100. -. t.value *. 2. /. 3.;     tu = Celsius }
  | Newton      -> { value = t.value *. 100. /. 33.;          tu = Celsius }
  | Reaumur     -> { value = t.value *. 5. /. 4.;             tu = Celsius }
  | Romer       -> { value = (t.value -. 7.5) *. 40. /. 21.;  tu = Celsius } ;;

let c2any t tu =
  match tu with
  | Celsius     -> t
  | Fahrenheit  -> { value = (9. /. 5. *. t.value) +. 32.;      tu = Fahrenheit }
  | Kelvin      -> { value = t.value +. 273.15;               tu = Kelvin     }
  | Rankine     -> { value = (9. /. 5. *. t.value) +. 491.67;  tu = Rankine    }
  | Delisle     -> { value = (t.value +. 100.) *. 3. /. 2.;     tu = Rankine    }
  | Newton      -> { value = 33. /. 100. *. t.value;          tu = Delisle    }
  | Reaumur     -> { value = 4. /. 5. *. t.value;             tu = Newton     }
  | Romer       -> { value = (t.value *. 21. /. 40.) +. 7.5;   tu = Romer      } ;;



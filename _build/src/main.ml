open Core.Std
open Core.Option.Monad_infix

(* The monadic |> *)
let (|>=) x y =
  x >>= (fun x -> y x)

type days = {
  max_h : int Option.t;
  sun : int Option.t;
  mon : int Option.t;
  tue : int Option.t;
  wed : int Option.t;
  thu : int Option.t;
  fri : int Option.t;
  sat : int Option.t;
}

type config = {
  name : string Option.t;
  days: days;
}

let get ~f ~toml_blob key =
  try
    Some (f (Toml.key key) toml_blob)
  with
  | Not_found -> None

let get_int = get ~f:Toml.get_int
let get_string = get ~f:Toml.get_string

let toml_to_config toml_blob =
  let get_s = get_string ~toml_blob in
  let get_i = get_int ~toml_blob in
  {
    name = get_s "name";
    days = {
      max_h = get_i "max";
      sun = get_i "sun";
      mon = get_i "mon";
      tue = get_i "tue";
      wed = get_i "wed";
      thu = get_i "thu";
      fri = get_i "fri";
      sat = get_i "sat";
    }
  }

let get_config () =
  Toml.Parser.from_filename "config.toml"
  |> toml_to_config

let print_s name value =
  match value with
  | Some x -> printf "%s: %s\n" name x
  | None -> printf "%s: none\n" name

let print_i name value =
  match value with
  | Some x -> printf "%s: %i\n" name x
  | None -> printf "%s: none\n" name

(**
 Start things off
 *)
let main =
  let config = get_config () in
  print_s "name" config.name;
  print_i "max" config.days.max_h;
  print_i "sun" config.days.sun;
  print_i "mon" config.days.mon;
  print_i "tue" config.days.tue;
  print_i "wed" config.days.wed;
  print_i "thu" config.days.thu;
  print_i "fri" config.days.fri;
  print_i "sat" config.days.sat;

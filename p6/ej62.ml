(* Solo hay una función con esos tipos *)
(* a -> a *)
let f  x = x;;
(* a -> a * a *)
let g  x = x,x;;
(* a * b -> a *)
let h (x,y) = x;;
(* a * b -> b *)
let i (x,y) = y;;
(* a * b -> a list *)
let j x = x::[];;
(* a -> b *)
let l = function x -> raise(Division_by_zero);;
(* a -> b list *)
let k = function x -> raise(Division_by_zero)::[];;

(*
Tienen en común el uso de la función raise,
que permite pasar de un tipo fijo a un tipo polimórfico.
La función es:
let fun_123_ab f = (f [1; 2; 3]) + (f ['a'; 'b']) ;; 
El tipo alfa es un tipo de variable que debe considerarse en algún 
contexto. Por lo tanto, esta función da un error de tipo, ya que cuando
se "instancia" en f [1; 2; 3] se convierte en una función de f en int-> int
y no permite hacer f ['a';'b']
*)

open List;;

let crono f g x = 
  let t = Sys.time() in
    let _ = f g x in 
      Sys.time() -. t;;

let rec init = function i -> function f ->  
  let rec init_aux = (function (l,n,m)->
    if n > m then init_aux ((f m)::l,n,m +1) 
    else l)
  in init_aux ([],i,0);; 
(* 
qsort1 tendrá un bajo rendimiento cuando la lista se ordena en el 
orden inverso a cómo desea ordenar,en cada iteración solo se 
ordena un elemento (h)
 *)
let rec qsort1 ord = function
  [] -> []
  | h::t -> let after, before = partition (ord h) t in
      qsort1 ord before @ h :: qsort1 ord after ;;
(*  
  Siendo qsort2 terminal se puede hacer en listas con muchos 
  elementos sin desbordamiento de pila
*)

let l = init 300_000 (fun x-> Random.int 100_000);;  

(*
Al ordenar 30.000 elementos descendentemente los tiempos de ejecución son:
  qsort1: 61.018979s
  qsort2: 69.679609s
Y la penalización es de 14.19%
*)

let rec qsort2 ord = function
  [] -> []
  | h::t -> let after, before = partition (ord h) t in
    rev_append ( rev (qsort2 ord before)) (h :: qsort2 ord after);;

let qsort3 ord l = 
  let rec sort_asc = function
    [] -> []
    | h::t -> let after,before = partition (ord h) t in
      rev_append (sort_des before) (h::(sort_asc after))
  and sort_des = function
    [] -> []
    | h::t -> let after,before = partition (ord h) t in
      rev_append (sort_asc after) (h::(sort_des before)) 
  in sort_asc l;;

(*
Al ordenar 30.000 elementos descendentemente los tiempos de ejecución son:
  qsort3: 50.11063s
  qsort2: 68.9382670000000246s
  qsort1: 61.6488809999999887

El cambio en el rendimiento es:
  qsort3 es un 37.57% más rapido que qsort2
  qsort3 es un 23.0254 % más rapido que qsort1
*)

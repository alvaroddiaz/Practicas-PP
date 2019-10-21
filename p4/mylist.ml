
let hd = function
    [] -&gt; raise (Failure) "hd"
  | a::l -&gt; a;;


let tl = function	   
    [] -&gt; raise (Failure) "tl"
| a::l -&gt; l;;


let rec length = function
[] -&gt; 0
| _::t -&gt; 1 + length t;;


let rec compare_lengths lista1 lista2 = match (lista1, lista2) with
([],[])-&gt; 0
|([],_)-&gt; -1
|(_,[])-&gt; 1
|(::t1,
::
t2)
-&gt; 
compare_lenghts t1 t2;;


let nth l n =
if n=0 then hd l
else nth (tl l)(n-1);;


let rec append l1 l2 = 
	if l1 =[]
	then l2
else (hd l1)::(append(tl l1) l2);;


let init h f= match h with
	0 -&gt; []
	_ 
-&gt; 
append (init (n-1) f) [f (n-1)];;
	


let rec rev = function
  [] -&gt; []
| h::t -&gt; append (rev t) [h];;


let rev_append l1 l2 =
if l1=[] then []
else append (rev l1) l2;;


let rec concat = function
  [] -&gt; []
| h::t -&gt; append h (concat t);;


let flatten = concat;;


let rec map f = function
  [] -&gt; []
| h::t -&gt; (f h) :: (map f t);;


let rev_map f l=
	let rec rev_map_f accu = function
	[] -&gt; accu 
	| a::l -&gt; rev_map_f (f a::accu) l
	in rev_map_f [] l;;


let rec map2 f l1 = function
  [] -&gt; [] 
| h::t -&gt; (f (hd l1) h) :: map2 f (tl l1) t;;



let rec fold_left f i = function
  [] -&gt; i
| h::t -&gt; fold_left f (f i h) t;;


let rec fold_right f l b = match l with 
	| [] -&gt; b  
	| hd::tl -&gt; f hd (fold_right f tl b);;


let rec find f = function
	[] -&gt; raise Not_found
| h::t -&gt; if f h then h else find f t;;
	


let rec for_all f = function
  	[] -&gt; true
| h::t -&gt; (f h) &amp;&amp; (for_all f t);;


let rec exists f = function
  	[] -&gt; false
| h::t -&gt; (f h) || (exists f t);;


let rec mem f = function
	[] -&gt; false
| h::t -&gt; if (f = h) then true else (mem f t);;


let rec filter f = function
  [] -&gt; []
| h::t -&gt; if (f h) then h::(filter f t) else (filter f t);;


let find_all = filter;;


let rec partition f = function
  [] -&gt; ([],[])
| h::t -&gt; let (si,no) = partition f t
	in if (f h) then (h::si,no) else (si,h::no);;


let rec split = function 
	| [] -&gt; ([],[])
	| (h1,h2)::f -&gt; let (nh1, nh2) = split f in (h1::nh1, h2::nh2);;


let rec combine l1 l2 =
 match (l1,l2) with
  [], [] -&gt; []
  | h1::t1, h2::t2 -&gt; (h1,h2) :: (combine (t1) (t2))
  | _ -&gt; raise (Invalid_argument "combine");;


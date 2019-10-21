let f = function x-&gt; function y-&gt; function z-&gt; 
if (z&gt;y) then true else (if (x&lt;&gt;y) then (z/ (x - y)&gt;y) else false);;

false &amp;&amp; (2 / 0 &gt; 0);;
(*- : bool = false*)

true &amp;&amp; (2 / 0 &gt; 0);;
(*Exception: Division_by_zero.*)

true || (2 / 0 &gt; 0);;
(*- : bool = true*)

false || (2 / 0 &gt; 0);;
(*Exception: Division_by_zero.*)

let con = (&amp;&amp;);;
(*val con : bool -&gt; bool -&gt; bool = &lt;fun&gt;*)

let dis = (||);;
(*val dis : bool -&gt; bool -&gt; bool = &lt;fun&gt;*)

(&amp;&amp;) (1 &lt; 0) (2 / 0 &gt; 0);;
(*- : bool = false*)

con (1 &lt; 0) (2 / 0 &gt; 0);;
(*Exception: Division_by_zero.*)

(||) (1 &gt; 0) (2 / 0 &gt; 0);;
(*- : bool = true*)

dis (1 &gt; 0) (2 / 0 &gt; 0);;
(*Exception: Division_by_zero*)



(*curry and uncurry*)

let curry = function f -&gt; function x -&gt; function y -&gt; f(x,y);;

let uncurry = function f -&gt; function x,y -&gt; f(x)(y);;



uncurry (+);;
(*-: int * int -&gt; int = &lt;fun&gt;*)

let sum = (uncurry (+));;
(*val sum : int * int -&gt; int = &lt;fun&gt;*)

sum 1;;
(*Error: expresion tipo int y se esperaba de tipo int * int *)

sum (2,1);;
(*- : int = 3*)

let g = curry (function p -&gt; 2 * fst p + 3 * snd p);;
(*val g : int -&gt; int -&gt; int = &lt;fun&gt;*)

g (2,5);;
(*Error: Expresion tipo a * b y se esperaba de tipo int *)

let h = g 2;;
(*val h : int -&gt; int = &lt;fun&gt;*)

h 1, h 2, h 3;;
(*- : int * int * int = (7, 10, 13)*)



(*comp : (’a -&gt; ’b) -&gt; (’c -&gt; ’a) -&gt; (’c -&gt; ’b)*)

let comp = function f -&gt; function x -&gt; function y -&gt; f(x(y));;


let f2 = let square x = x * x in comp square ((+) 1);;
(*val f2 : int -&gt; int = &lt;fun&gt;*)


f2 1, f2 2, f2 3;;
(*- : int * int * int = (4, 9, 16)*)
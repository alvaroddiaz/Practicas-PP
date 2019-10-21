let x = 1;;
(*val x : int = 1*)

let y = 2;;
(*val y : int = 2*)

x - y;;
(*- : int = -1*)

let x = y in x - y;;
(*- : int = 0*)

x - y;;
(*- : int = -1*)

z;;
(*Error: Unbound value z*)

let z = x + y;;
(*val z : int = 3*)

z;;
(*- : int = 3*)

let x = 5;;
(*val x : int = 5*)

z;;
(*- : int = 3*)

let y = 5 in x + y;;
(*- : int = 10*)

x + y;;
(*- : int = 7*)

let p = 2,5;;
(*val p : int * int = (2, 5)*)

snd p, fst p;;
(*- : int * int = (5, 2)*)

p;;
(*- : int * int = (2, 5)*)

let p = 0,1 in snd p, fst p;;
(*- : int * int = (1, 0)*)

p;;
(*- : int * int = (2, 5)*)

let x,y = p;;
(*val x : int = 2*)
(*val y : int = 5*)

let z = x + y;;
(*val z : int = 7*)

let x,y = p,x;;
(*val x : int * int = (2, 5)*)
(*val y : int = 2*)

let x = let x,y = 2,3 in x * x + y;;
(*val x : int = 7*)

x + y;;
(*- : int = 9*)

z;;
(*- : int = 7*)

let x = x + y in let y = x* y in x + y + z;;
(*- : int = 34*)

x + y + z;;
(*- : int = 16*)

int_of_float;;
(*- : float -&gt; int = &lt;fun&gt;*)

float_of_int;;
(*- : int -&gt; float = &lt;fun&gt;*)

int_of_char;;
(*- : char -&gt; int = &lt;fun&gt;*)

char_of_int;;
(*- : int -&gt; char = &lt;fun&gt;*)

abs;;
(*- : int -&gt; int = &lt;fun&gt;*)

sqrt;;
(*- : float -&gt; float = &lt;fun&gt;*)

truncate;;
(*- : float -&gt; int = &lt;fun&gt;*)

ceil;;
(*- : float -&gt; float = &lt;fun&gt;*)

floor;;
(*- : float -&gt; float = &lt;fun&gt;*)

Char.code;;
(*- : char -&gt; int = &lt;fun&gt;*)

String.length;;
(*- : string -&gt; int = &lt;fun&gt;*)

fst;;
(*- : 'a * 'b -&gt; 'a = &lt;fun&gt;*)

snd;;
(*- : 'a * 'b -&gt; 'b = &lt;fun&gt;*)

let f = function x -&gt; 2 * x;;
(*val f : int -&gt; int = &lt;fun&gt;*)

f (2+1);;
(*- : int = 6*)

f 2 + 1;;
(*- : int = 5*)

let n = 10;;
(*val n : int = 10*)

let sum = function n -&gt; function x -&gt; n+x;;
(*val sum : int -&gt; int -&gt; int = &lt;fun&gt;*)

sum 5;;
(*- : int -&gt; int = &lt;fun&gt;*)

sum 1 2 ;;
(*- : int = 3*)

let n = 1;;
(*val n : int = 1*)

sum n 10;;
(*- : int = 11*)

let sumn = sum n;;
(*val sumn : int -&gt; int = &lt;fun&gt; *)

sumn 100;;
(*- : int = 101*)

let n = 1000;;
(*val n : int = 1000*)

sumn 100;;
(*- : int = 101*)



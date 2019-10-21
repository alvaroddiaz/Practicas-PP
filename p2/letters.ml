let uppercase = fun c -&gt; if ((Char.code c &lt; 91) &amp;&amp; (Char.code c &gt; 64)) then c else
	if ((Char.code c &gt; 191) &amp;&amp; (Char.code c &lt; 222)) then c 
		else char_of_int (Char.code c-32);;

let lowercase = fun c -&gt; if ((Char.code c &lt; 91) &amp;&amp; (Char.code c &gt; 64)) then char_of_int (Char.code c + 32) else
	if ((Char.code c &gt; 191) &amp;&amp; (Char.code c &lt; 222)) then char_of_int (Char.code c + 32) 
		else c;;
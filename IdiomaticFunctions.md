

```R
X <- sample(1:100,10)
```


```R
class(X);mode(X)
```


'integer'



'numeric'



```R
Y <- as.character(X)
```


```R
Y
```


<ol class="list-inline">
	<li>'63'</li>
	<li>'42'</li>
	<li>'88'</li>
	<li>'95'</li>
	<li>'38'</li>
	<li>'61'</li>
	<li>'87'</li>
	<li>'67'</li>
	<li>'73'</li>
	<li>'94'</li>
</ol>




```R
class(Y)
```


'character'



```R
as.numeric(Y)
```


<ol class="list-inline">
	<li>63</li>
	<li>42</li>
	<li>88</li>
	<li>95</li>
	<li>38</li>
	<li>61</li>
	<li>87</li>
	<li>67</li>
	<li>73</li>
	<li>94</li>
</ol>




```R
Z <- as.factor(Y)
Z
```


```R
as.numeric(Z)
```


<ol class="list-inline">
	<li>4</li>
	<li>2</li>
	<li>8</li>
	<li>10</li>
	<li>1</li>
	<li>3</li>
	<li>7</li>
	<li>5</li>
	<li>6</li>
	<li>9</li>
</ol>




```R
as.character(Z)
```


<ol class="list-inline">
	<li>'63'</li>
	<li>'42'</li>
	<li>'88'</li>
	<li>'95'</li>
	<li>'38'</li>
	<li>'61'</li>
	<li>'87'</li>
	<li>'67'</li>
	<li>'73'</li>
	<li>'94'</li>
</ol>



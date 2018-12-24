---
title: "``l_graph_inspector_navigators``"
output: html_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


l_graph_inspector_navigators
Create a Graph Navigator Inspector

#### Description 

Inpectors provide graphical user interfaces to oversee and modify plot states

#### Usage
<pre><code>
l_graph_inspector_navigators(parent = NULL, ...)

</code></pre>

#### Arguments 
  
* ``parent ``:  parent widget path
* ... state Arguments 
  

#### Examples 
```{r}
i <- l_graph_inspector_navigators()
```

Value
widget handle
See Also
l_create_handle


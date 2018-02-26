Extensions
=========================
The facilities used internally by sparklyr for its dplyr and machine learning interfaces are available to extension packages. 
Since Spark is a general purpose cluster computing system there are many potential applications for extensions (e.g. interfaces 
to custom machine learning pipelines, interfaces to 3rd party Spark packages, etc.).

Here’s a simple example that wraps a Spark text file line counting function with an R function:
<pre><code>
# write a CSV 
tempfile <- tempfile(fileext = ".csv")
write.csv(nycflights13::flights, tempfile, row.names = FALSE, na = "")

# define an R interface to Spark line counting
count_lines <- function(sc, path) {
  spark_context(sc) %>% 
    invoke("textFile", path, 1L) %>% 
      invoke("count")
}

# call spark to count the lines of the CSV
count_lines(sc, tempfile)
## [1] 336777
</code></pre>
To learn more about creating extensions see the Extensions section of the sparklyr website.



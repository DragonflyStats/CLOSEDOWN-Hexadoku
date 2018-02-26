
### Using dplyr
We can now use all of the available dplyr verbs against the tables within the cluster.

We’ll start by copying some datasets from R into the Spark cluster (note that you may need to install the nycflights13 and Lahman packages in order to execute this code):
<pre><code>
install.packages(c("nycflights13", "Lahman"))
library(dplyr)
iris_tbl <- copy_to(sc, iris)
flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
batting_tbl <- copy_to(sc, Lahman::Batting, "batting")
src_tbls(sc)
## [1] "batting" "flights" "iris"
</code></pre>
To start with here’s a simple filtering example:
<pre><code>
# filter by departure delay and print the first few records
flights_tbl %>% filter(dep_delay == 2)
## # Source:   lazy query [?? x 19]
## # Database: spark_connection
##     year month   day dep_time sched_dep_time dep_delay arr_time
##    <int> <int> <int>    <int>          <int>     <dbl>    <int>
##  1  2013     1     1      517            515         2      830
##  2  2013     1     1      542            540         2      923
##  3  2013     1     1      702            700         2     1058
##  4  2013     1     1      715            713         2      911
##  5  2013     1     1      752            750         2     1025
##  6  2013     1     1      917            915         2     1206
##  7  2013     1     1      932            930         2     1219
##  8  2013     1     1     1028           1026         2     1350
##  9  2013     1     1     1042           1040         2     1325
## 10  2013     1     1     1231           1229         2     1523
## # ... with more rows, and 12 more variables: sched_arr_time <int>,
## #   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
## #   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
## #   minute <dbl>, time_hour <dbl>
</code></pre>
Introduction to dplyr provides additional dplyr examples you can try. For example, consider the last example from the tutorial which plots data on flight delays:
<pre><code>
delay <- flights_tbl %>% 
  group_by(tailnum) %>%
  summarise(count = n(), dist = mean(distance), delay = mean(arr_delay)) %>%
  filter(count > 20, dist < 2000, !is.na(delay)) %>%
  collect

# plot delays
library(ggplot2)
ggplot(delay, aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area(max_size = 2)
## `geom_smooth()` using method = 'gam'
</code></pre>

### Window Functions
dplyr window functions are also supported, for example:
<pre><code>
batting_tbl %>%
  select(playerID, yearID, teamID, G, AB:H) %>%
  arrange(playerID, yearID, teamID) %>%
  group_by(playerID) %>%
  filter(min_rank(desc(H)) <= 2 & H > 0)
## # Source:     lazy query [?? x 7]
## # Database:   spark_connection
## # Groups:     playerID
## # Ordered by: playerID, yearID, teamID
##     playerID yearID teamID     G    AB     R     H
##        <chr>  <int>  <chr> <int> <int> <int> <int>
##  1 aaronha01   1959    ML1   154   629   116   223
##  2 aaronha01   1963    ML1   161   631   121   201
##  3 abbotji01   1999    MIL    20    21     0     2
##  4 abnersh01   1992    CHA    97   208    21    58
##  5 abnersh01   1990    SDN    91   184    17    45
##  6 acklefr01   1963    CHA     2     5     0     1
##  7 acklefr01   1964    CHA     3     1     0     1
##  8 adamecr01   2016    COL   121   225    25    49
##  9 adamecr01   2015    COL    26    53     4    13
## 10 adamsac01   1943    NY1    70    32     3     4
## # ... with more rows
</code></pre>
For additional documentation on using dplyr with Spark see the dplyr section of the sparklyr website.



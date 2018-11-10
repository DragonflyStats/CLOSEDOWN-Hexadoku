

## distance_columns
Distance matrix columns
Description
distance_columns extracts columns from the distance matrix.
Usage
<pre><code>
distance_columns(distances, column_indices, row_indices = NULL)
</code></pre>

#### Arguments
* distances A distances object.
* column_indices An integer vector with point indices indicating which columns to be extracted.
* row_indices If NULL, complete rows will be extracted. If integer vector with point indices, only the indicated rows will be extracted.

#### Details
If the complete distance matrix is desired, distance_matrix is faster than distance_columns.

Value
Returns a matrix with the requested columns.


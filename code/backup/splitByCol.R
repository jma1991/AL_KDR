splitByCol <- function(x, f) {

  i <- split(seq_along(f), f)

  v <- vector(mode = "list", length = length(i))

  names(v) <- names(i)

  for (n in names(i)) { v[[n]] <- x[, i[[n]]] }

  return(v)

}

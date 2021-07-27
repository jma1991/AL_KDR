plotHeatmapPseudotime <- function(object, features, columns, order_columns_by) {

  ###

  object <- object[features, columns]

  rownames(object) <- rowData(object)$gene_name

  colnames(object) <- paste("cell", seq_len(ncol(object)), sep = "-")

  ###

  x <- assay(object, "reconstructed")

  x <- as.matrix(x)

  rownames(x) <- rownames(object)

  colnames(x) <- colnames(object)

  ###

  M <- rowMeans(x, na.rm = TRUE)

  DF <- ncol(x) - 1L

  IsNA <- is.na(x)

  if (any(IsNA)) {

    mode(IsNA) <- "integer"

    DF <-  DF - rowSums(IsNA)

    DF[DF == 0L] <- 1L

  }

  x <- x - M

  V <- rowSums(x^2L, na.rm = TRUE) / DF

  x <- x / sqrt(V + 0.01)

  ###

  hc <- order(object[[order_columns_by]])

  hr <- hclust(dist(x, method = "euclidean"), method = "complete")

  ###

  col <- colorRampPalette(rev(brewer.pal(5, name = "RdBu")))(100)

  lim <- max(abs(x))

  brk <- seq(-lim, +lim, length.out = 101)

  ###

  ann <- list(

    col = data.frame(
      Celltype  = object$celltype.mapped,
      Genotype  = object$genotype,
      row.names = colnames(object)
    ),

    colors = list(
      Celltype = EmbryoCelltypeColours[unique(object$celltype)],
      Genotype = EmbryoGenotypeColours[unique(object$genotype)]
    )

  )

  ###

  plt <- pheatmap(
    mat = x[, hc],
    color = col,
    breaks = brk,
    cluster_rows = hr,
    cluster_cols = FALSE,
    annotation_col = ann$col,
    annotation_colors = ann$colors,
    show_colnames = FALSE
  )

  return(plt)

}

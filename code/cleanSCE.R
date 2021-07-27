cleanSCE <- function(x, sample) {

  # Require package
  require("MouseGastrulationData")

  # Clear metadata
  metadata(x) <- list()

  # Replace rownames
  rownames(x) <- rowData(x)$gene_id

  # Clear rowData
  rowData(x) <- NULL

  # Replace rowRanges
  rowRanges(x) <- relist(GRanges(), PartitioningByEnd(integer(length(x)), names = rownames(x)))

  # Clear colnames
  colnames(x) <- NULL

  # Replace colData
  colData(x) <- DataFrame(
    cell = paste(sample, seq_len(ncol(x)), sep = "_"),
    barcode = NA,
    sample = sample,
    pool = NA,
    stage = NA,
    sequencing.batch = NA,
    theiler = NA,
    doub.density = x$doublet_score,
    doublet = x$doublet_cluster,
    cluster = NA,
    cluster.sub = NA,
    cluster.stage = NA,
    cluster.theiler = NA,
    stripped = NA,
    celltype = x$celltype,
    colour = EmbryoCelltypeColours[x$celltype],
    sizeFactor = sizeFactors(x)
  )

  # Clear reducedDims
  reducedDims(x) <- NULL

  # Clear altExp
  altExp(x) <- NULL

  # Return object
  return(x)

}

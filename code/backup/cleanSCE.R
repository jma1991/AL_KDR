cleanSCE <- function(x, sample = NA) {

  # Clear metadata slot
  metadata(x) <- list()

  # Make rownames compatible
  rownames(x) <- rowData(x)$gene_id

  # Clear rowData slot
  rowData(x) <- NULL

  # Replace rowRanges slot
  rowRanges(x) <- relist(GRanges(), PartitioningByEnd(integer(length(x)), names = rownames(x)))

  # Clear colnames slot
  colnames(x) <- NULL

  # Make colData compatible
  colData(x) <- DataFrame(
    cell = NA,
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
    colour = MouseGastrulationData::EmbryoCelltypeColours[x$celltype],
    sizeFactor = sizeFactors(x)
  )

  # Clear reducedDims slot
  reducedDims(x) <- NULL

  # Clear altExp slot
  altExp(x) <- NULL

  # Return experiment object
  return(x)

}

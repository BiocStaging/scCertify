#' Neighbor Agreement Score
#'
#' Computes local neighborhood agreement scores.
#'
#' @param object A Seurat or SingleCellExperiment object.
#' @param reduction Dimensionality reduction to use.
#' @param dims Dimensions to include.
#' @param k Number of nearest neighbors.
#' @param label_column Metadata column containing predicted labels.
#'
#' @return Numeric vector of neighborhood agreement scores.
#'
#' @examples
#' if (
#'   requireNamespace("SingleCellExperiment", quietly = TRUE) &&
#'   requireNamespace("SummarizedExperiment", quietly = TRUE)
#' ) {
#'
#'   set.seed(123)
#'
#'   counts <- matrix(
#'     rpois(1000, lambda = 5),
#'     nrow = 50,
#'     ncol = 20,
#'     dimnames = list(
#'       paste0("Gene", seq_len(50)),
#'       paste0("Cell", seq_len(20))
#'     )
#'   )
#'
#'   sce <- SingleCellExperiment::SingleCellExperiment(
#'     assays = list(
#'       logcounts = log1p(counts)
#'     )
#'   )
#'
#'   SummarizedExperiment::colData(sce)$predicted_label <-
#'     rep(c("T cell", "B cell"), each = 10)
#'
#'   SingleCellExperiment::reducedDim(sce, "PCA") <- prcomp(
#'     t(counts),
#'     rank. = 5
#'   )$x
#'
#'   scores <- neighbor_score(sce)
#'
#'   head(scores)
#' }
#'
#' @export

neighbor_score <- function(
    object,
    reduction = "pca",
    dims = NULL,
    k = 10,
    label_column = "predicted_label"
) {

  if (inherits(object, "Seurat")) {

    return(
      neighbor_score_core(
        object = object,
        reduction = reduction,
        dims = dims,
        k = k,
        label_column = label_column,
        object_type = "Seurat"
      )
    )

  }

  if (inherits(object, "SingleCellExperiment")) {

    return(
      neighbor_score_core(
        object = object,
        reduction = reduction,
        dims = dims,
        k = k,
        label_column = label_column,
        object_type = "SingleCellExperiment"
      )
    )

  }

  stop(
    "'object' must be a Seurat or SingleCellExperiment object.",
    call. = FALSE
  )

}

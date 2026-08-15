#' scCertify: Explainable Confidence Scoring for Single-Cell Annotations
#'
#' @description
#' `scCertify` provides an explainable framework for evaluating the confidence
#' of single-cell RNA sequencing (scRNA-seq) cell-type annotations.
#'
#' The package combines multiple complementary sources of evidence,
#' including marker gene enrichment, neighborhood agreement,
#' entropy-based uncertainty, and doublet information, to produce
#' calibrated confidence scores and interpretable confidence classes.
#'
#' The package is designed to complement existing cell-type annotation
#' methods rather than replace them. Predicted cell labels are supplied by
#' the user and scCertify evaluates the confidence of those assignments.
#'
#' Both `SingleCellExperiment` and `Seurat` objects are supported.
#'
#' @details
#' The main workflow consists of:
#'
#' \enumerate{
#'   \item obtaining predicted cell-type labels from an annotation method;
#'   \item supplying marker genes for the predicted cell types;
#'   \item evaluating marker consistency;
#'   \item evaluating neighborhood agreement;
#'   \item incorporating entropy-based uncertainty and doublet information;
#'   \item combining these components into a calibrated confidence score; and
#'   \item interpreting the resulting confidence using explanation functions.
#' }
#'
#' @section Main functions:
#' \itemize{
#'   \item \code{\link{cell_certify}} computes integrated confidence scores.
#'   \item \code{\link{marker_score}} evaluates marker consistency.
#'   \item \code{\link{neighbor_score}} evaluates neighborhood agreement.
#'   \item \code{\link{entropy_score}} estimates entropy-based uncertainty.
#'   \item \code{\link{calibrate_confidence}} calibrates confidence scores.
#'   \item \code{\link{classify_confidence}} assigns confidence classes.
#'   \item \code{\link{explain_cell}} summarizes confidence for an individual cell.
#'   \item \code{\link{explain_confidence}} identifies major confidence contributors.
#'   \item \code{\link{match_labels}} assists with label matching.
#' }
#'
#' @section Supported data structures:
#' `scCertify` supports both `SingleCellExperiment` and `Seurat` objects.
#' `SingleCellExperiment` is the primary object class used in the package
#' documentation and vignette, consistent with Bioconductor conventions.
#' Seurat compatibility is provided for interoperability with existing
#' single-cell analysis workflows.
#'
#' @section Confidence framework:
#' Confidence scores combine four sources of evidence:
#'
#' \itemize{
#'   \item marker enrichment;
#'   \item neighborhood agreement;
#'   \item entropy-based uncertainty; and
#'   \item doublet information.
#' }
#'
#' The resulting confidence score is classified into Low, Moderate, or High
#' confidence according to user-defined thresholds.
#'
#' @docType package
#' @name scCertify-package
#' @aliases scCertify
#' @keywords package
#'
"_PACKAGE"

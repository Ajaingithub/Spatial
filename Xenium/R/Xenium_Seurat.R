library(Seurat)
xenium.obj <- LoadXenium("/diazlab/data3/.abhinav/projects/Spatial_MB/practice/Xenium/R/rawdata", fov = "fov")
xenium.obj <- subset(xenium.obj, subset = nCount_Xenium > 0)

# BlankCodeword:
# This assay contains information related to blank or empty spots in the experiment. It can be used to track potential background or noise in the dataset, essentially measuring whether non-targeted spots
# have any detected signals.
# ControlCodeword:
# This assay holds data related to control probes, which are used to validate the technical aspects of the experiment. ControlCodewords typically help in assessing the efficiency and specificity of the
# probe hybridization and can be useful for quality control.
# ControlProbe:
# This assay includes data from probes that were specifically designed for quality control purposes. These are typically synthetic or known sequences that allow you to assess the accuracy of the probe
# hybridization and the system's performance.

savedir <- "/diazlab/data3/.abhinav/projects/Spatial_MB/practice/Xenium/R/analysis/"
dir.create(paste0(savedir, "QC"), showWarnings = FALSE, recursive = TRUE)
pdf(paste0(savedir, "QC/feature_and_UMI.pdf"))
VlnPlot(xenium.obj, features = c("nFeature_Xenium", "nCount_Xenium"), ncol = 2, pt.size = 0)
dev.off()

dir.create(paste0(savedir, "spatial_featurePlot"), showWarnings = FALSE, recursive = TRUE)
pdf(paste0(savedir, "spatial_featurePlot/feature_and_UMI.pdf"))
ImageDimPlot(xenium.obj, fov = "fov", molecules = c("Gad1", "Sst", "Pvalb", "Gfap"), nmols = 20000)
dev.off()

pdf(paste0(savedir, "spatial_featurePlot/featureplot.pdf"))
ImageFeaturePlot(xenium.obj, features = c("Cux2", "Rorb", "Bcl11b", "Foxp2"), max.cutoff = "q90", size = 0.25, cols = c("white", "red"))
dev.off()

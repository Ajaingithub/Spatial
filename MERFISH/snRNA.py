import scanpy as sc
import pandas as pd

adata = sc.read_h5ad("/diazlab/data3/.abhinav/.immune/spatial/rawdata/GSE235863_nine_patients_scRNAseq_cd45_raw_counts.h5ad")

# Convert categorical columns to string format (avoids missing 'levels' and 'values' in Seurat)
for col in adata.obs.select_dtypes(['category']).columns:
    adata.obs[col] = adata.obs[col].astype(str)

for col in adata.var.select_dtypes(['category']).columns:
    adata.var[col] = adata.var[col].astype(str)

# Save modified h5ad file
adata.write("your_fixed_file.h5ad")

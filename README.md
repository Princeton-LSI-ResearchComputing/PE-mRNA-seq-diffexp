# mRNA-Seq Workflow

Here, we create two workflows to work with the two subsets of data separately:
`HEK3_1TtoA` and `PRNP_6GtoT`.

The workflows use the publicly available [rna-seq-star-deseq2
workflow](https://snakemake.github.io/snakemake-workflow-catalog/?usage=snakemake-workflows/rna-seq-star-deseq2).

Citation:
https://doi.org/10.5281/zenodo.4737358

1. Install Snakemake and Snakedeploy

    mamba create -c conda-forge -c bioconda --name snakemake snakemake snakedeploy
    mamba activate snakemake

2. Deploy workflow

    snakedeploy deploy-workflow https://github.com/snakemake-workflows/rna-seq-star-deseq2 . --tag v2.0.0
    
  1. Initialize Git Repo

      git init -b main
      git add .

3. Configure workflow

  1. Modify `config/config.yaml`
  2. Add samples to `config/samples.tsv` and `config/units.tsv`

4. Setup workflow specific resources

   1. Modify `workflow/profiles/default/config.yaml` to ensure rules have the
      required resources to run on the cluster.

5. Run the workflow

    export SNAKEMAKE_OUTPUT_CACHE=../snakemake-cache/
    snakemake --use-conda --cache

6. Generate a report

    snakemake --report report.zip

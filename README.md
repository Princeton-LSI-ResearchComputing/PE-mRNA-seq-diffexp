# mRNA-Seq Workflow

[![DOI](https://zenodo.org/badge/)](https://zenodo.org/badge/latestdoi/)

Workflow for the analysis of mRNA-seq data for Yan et. al, "An endogenous
small RNA-binding protein safeguards prime editing" (in press).

The workflow is written using [Snakemake](https://snakemake.github.io/) and
[Quarto](https://quarto.org/).

Dependencies are installed using [Bioconda](https://bioconda.github.io/) where
possible.

The workflow consists of two pieces, one written in Snakemake, the other is
composed of Quarto notebooks.

## Running the Snakemake workflow

Here, we create two workflows to work with the two subsets of data separately:
`HEK3_1TtoA` and `PRNP_6GtoT`. Run the workflow in each directory separately.

The workflows use the publicly available [rna-seq-star-deseq2
workflow](https://snakemake.github.io/snakemake-workflow-catalog/?usage=snakemake-workflows/rna-seq-star-deseq2).
Citation:
[https://doi.org/10.5281/zenodo.4737358](https://doi.org/10.5281/zenodo.4737358)

1. Clone workflow into working directory

    ```bash
    git clone <repository> <dir>
    cd <dir>
    ```

2. Download input data (or skip and use demo-data)

    Copy the fastq files into `data` directory

3. Edit the configuration as needed (not needed if using demo-data)

    ```bash
    # Edit location of fastq files
    nano HEK3_1TtoA/config/units.yaml
    nano PRNP_6GtoT/config/units.yaml
    
    # Generally, these can remain unchanged 
    nano HEK3_1TtoA/config/samples.yaml
    nano PRNP_6GtoT/config/samples.yaml
    nano HEK3_1TtoA/config/config.yaml
    nano PRNP_6GtoT/config/config.yaml
    ```

4. Install Snakemake and Snakedeploy

    mamba create -c conda-forge -c bioconda --name snakemake snakemake snakedeploy
    mamba activate snakemake

5. Setup workflow specific resources

   1. Modify `workflow/profiles/default/config.yaml` to ensure rules have the
      required resources to run on the cluster.

6. Run the workflow (using cluster options is recommended)

    snakemake --use-conda -cores 1

7. Generate a report

    snakemake --report report.zip

## Quarto notebooks

The Quarto notebooks utilize [R](https://www.r-project.org/) and are run
separately.

1. Run the workflows as above

2. Load the Rproject `./pe-mrna-seq-diffexp.Rproj` in RStudio.

3. This project uses
   [`renv`](https://rstudio.github.io/renv/articles/renv.html) to keep track of
   installed packages. Install `renv` if not installed and load dependencies
   with `renv::restore()`.

4. Load the quarto notebook `./mrna-seq-venn-diag.qmd` and run all of the cells
   or use the "Render" button in RStuido.

# Morven Forest Canopy Analysis

R scripts and supporting materials for the analysis of forest structure and canopy characteristics at Morven Sustainability, University of Virginia.

## Overview

This repository contains R code used to process and analyze tree-level forest inventory data collected at Morven Farm. The scripts support analyses of tree height and vertical forest structure, including height correction and classification of trees into shrub, understory, and canopy layers.

These analyses were conducted as part of a study examining relationships between dominant tree species, taxonomic diversity, and structural complexity in secondary forests at Morven Farm.

## Contents

### Morven_Tree_Height_Correction.R

This script develops height-correction coefficients using field measurements of reported tree height and corresponding actual tree height measurements.

#### The script:

Loads tree height correction data.

Assigns trees to sites and transects.

Selects a random sample of trees for height correction.

Fits constrained linear regression models relating reported height to actual height.

Calculates height-correction coefficients for transects.

Exports the resulting correction coefficients for use in subsequent analyses.

### ChinnCanopyClassificationFinal.R

This script classifies trees into vertical forest layers using k-means clustering of tree height within each plot.

#### The script:

Loads tree-level forest inventory data.

Performs k-means clustering of tree heights within each plot using three clusters.

Calculates the mean height of each cluster.

Ranks the clusters by mean height.

Assigns the resulting layers as:

- Shrub

- Understory

- Canopy

Exports the classified tree-level dataset as a CSV file.

### Data

The original analyses used tree-level forest inventory data collected from circular plots at Morven Sustainability Lab. Individual trees were measured for characteristics including species and height, with additional variables used in subsequent analyses.

Raw and processed datasets are not currently included in this repository. File paths in the R scripts will therefore need to be modified to match the user's local directory structure.

### Reproducibility

The scripts were written in R and use packages from the R ecosystem, including:

tidyverse

dplyr

ggplot2

readr

broom

purrr

Package requirements may vary between scripts.

Before running the scripts, update the file paths in the data import and export sections to match the location of the relevant datasets on your computer.

### Study Context

The data were collected at Morven Sustainability Lab, a 320-ha property associated with the University of Virginia in Albemarle County, Virginia. The study examines secondary forest stands with variation in dominant tree species and forest structure.

## Author

Austin Chinn
University of Virginia
B.S. Environmental Science

### Citation

If using these scripts or analyses, please cite the associated manuscript:

Chinn, A. Not all diversity is equal: Taxon-specific impacts of biodiversity in a Mid-Atlantic Hardwood Forest.

### License

This repository is provided for research and educational purposes. Please contact the author before reusing the code or data in another publication.

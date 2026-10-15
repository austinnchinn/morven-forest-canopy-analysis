# Morven Forest Canopy Analysis

R scripts and raw data for the analysis of forest structure and canopy characteristics at the Morven Sustainability Lab, University of Virginia.

## Overview

This repository contains R code used to process and analyze tree-level forest inventory data collected at Morven Farm, and the raw data collected as the first record of a long-term hardwood forest monitoring program. The scripts support analyses of tree height and vertical forest structure, including height correction and classification of trees into shrub, understory, and canopy layers.

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

The data include records of tree-level forest inventory data collected from circular plots at Morven Sustainability Lab. The species of individual trees a ground-level "eyeball" estimate of tree height were recorded, and trees were measured for circumference, which was later converted to diameter at breast height (DBH). 

Data were recorded from the summer of 2024 through the summer of 2025, with a follow-up survey ensuring correct tree identification and data records occuring in the Spring of 2026.

The 45 sites were stratified according to topographical position along a mountain face, with 15 "supersites" organized by elevation across 5 vertical transects from left to right looking up the mountain. Supersite 1 is near the summit, 2 at the midslope, and 3 at the toeslope; supersite 4 is on the summit to the right (Northeast) of supersite 1, and so on. Each supersite contains 3 "subsites" organized based on elevation across minor topographical features. The second letter in the Site ID field corresponds to the subsite topographical position, "S" indicating summit, "M" midslope, and "T" toeslope.

#### A dictionary of field names within the data table are as follows:
- Site ID: The identification code for the survey plot, as described above
- Macrotopo: The broad vertical position of the site on the mountainside
- Microtopo: The vertical position of the subsite along a minor topographical feature
- Tree No.: The tag number of the individual tree recorded
- Year: The year that the datum was recorded, note that 2024-2025 was one complete survey year
- Species: Common name of the tree species
- Height (m): Estimated tree height in meters
- Circumference (cm): Measured circumference of the tree at breast height
- DBH (m): Diameter at breast height of the tree as converted from measured circumference

Processed and intermediate datasets are not included in this repository. File paths in the R scripts will therefore need to be modified to match the user's local directory structure.

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

Chinn, A; Lerdau, M; Shugart, H. Not all diversity is equal: Taxon-specific impacts of biodiversity in a Mid-Atlantic Hardwood Forest.

### License

This repository is provided for research and educational purposes. Please contact the author before reusing the code or data in another publication.

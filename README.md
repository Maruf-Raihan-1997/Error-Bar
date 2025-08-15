Overview
This script analyzes and visualizes the ToothGrowth dataset in R, focusing on supplement type and dosage effects on tooth length.

CI, SE, SD

Error bars are small lines on a graph that show how uncertain or variable your measurements are.
They don’t just show the mean — they give a visual hint about how spread out the data is or how confident you are in the value.

SD (Standard Deviation)
How spread out the data is around the mean.

SE (Standard Error)
How much the sample mean is likely to vary from the true population mean.

CI (Confidence Interval)
A range where you expect the true mean to be with a given probability (e.g., 95%).


1. Dataset

ToothGrowth is a built-in dataset containing:

len → Tooth length.

supp → Supplement type (VC for Vitamin C, OJ for Orange Juice).

dose → Dosage in milligrams.

2. Summary Function

The custom function data_summary(data, varname, groupnames):

Inputs:

data → dataset to summarize.

varname → name of the numeric variable to summarize.

groupnames → vector of grouping variables.

Inner function: summary_func takes a subset of the data and computes:

Mean: mean(x[[col]], na.rm = TRUE).

Standard deviation (SD): sd(x[[col]], na.rm = TRUE).

Uses ddply (from plyr) to:

Split the data by groupnames.

Apply summary_func.

Combine the results into a single data frame.

Renames "mean" column to the original varname for clarity.

3. Data Preparation

Calls data_summary() to get the mean and SD of tooth length grouped by supp and dose.

Converts dose to a factor for categorical plotting.

4. Visualization

Uses ggplot2 to:

Plot grouped bar charts of mean tooth length by dose and supp.

Add error bars showing ±1 SD around the mean.

Apply position_dodge so bars for each supplement appear side-by-side.

Use a minimal theme for a clean presentation.

5. Purpose

This workflow makes it easy to summarize grouped data and visualize both central tendency and variability in one chart, aiding interpretation of how dosage and supplement type affect tooth growth.

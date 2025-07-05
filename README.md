# Data processing and analysis code for the study "When players dislike but keep playing: Net Promoter Score inversion as a marker for problematic digital use"

This repository contains the code used to extract, aggregate, and analyze the dataset for the study "When players dislike but keep playing: Net Promoter Score inversion as a marker for problematic digital use".

On March 25 2019, the project's industry partner provided one export of player telemetry (so, detailed clickstream logs / user behavior data) around a first NPS survey that the company had run. We then asked to obtain a similar dataset for a second NPS survey that the company ran about a month after the first survey. The industry partner shared the SQL (database access language) code used to export these datasets. This code is shown in the following files:
1) First export: query_until_2019-03-25_blinded_annotated.sql (this file is annotated to explain what data columns are exported)
2) Second export: query_after_2019-03-25_blinded.sql (this file is not annotated as it exports the same data as under 1))
   
As the industry partner requested to remain anonymous, both files are blinded with "XXX" where company and game name were shown in the code to access the correct databases.

The resulting datasets were provided as CSV files that I imported to R where I further processed them to create well-behaved datasets for analysis. The R code for this processing is shown in file data_prep_code_2025-07-05.R.

The analysis then centered on the well-behaved cross-sectional dataset generated in the previous step. The code used to analyze the data and produce the results, tables, and figures shown in the manuscript is given in file analysis_code_2025-07-05.R in this repository.

For legal reasons, I am not at liberty to share user-level data publicly. I hence created a dataset that can be shared publicly by aggregating the user-level data as mean and standard deviation across the following categories: country group (United States, all other countries), platform (Apple, Google), and NPS rating level (9-10: promoter; 7-8: passive; 3-6: detractor; 0-2: severe detractor). The smallest resulting segment comprises 196 users, ensuring that no user-level data are contained in this dataset. This dataset is available in this repository as nps_lootboxes_data_public.csv.

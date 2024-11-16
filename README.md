## Contents of the Repository

`raw_data/`

  - includes the raw_data to generate output and report

`data/`

  - includes the data after preprocessing
  
`code/`

  - includes the code files to preprocess the raw data and create a table1 and histograms
  
`output/`

  - includes the output files (table1 and histograms)

## Code Description

`code/01_data_preprocessing.R`

  - preprocess the data
  - save the data as a `.rds` object in `data/` folder

`code/02_data_structure_table1.R`

  - create a table1 that describes the data
  - save the table as a `.rds` object in `output/` folder
  
`code/03_make_histogram.R`

  - create histograms that describe the distribution of covariates
  - save the histograms as `.png` objects in `output/` folder
  
`code/04_render_report.R`
  - renders `GA_Opioid_Report.Rmd`

`report.Rmd`

  - imports data generated by `code/01_data_preprocessing.R`
  - reads table1 generated by `code/02_data_structure_table1.R`
  - reads histograms generated by `code/03_make_histogram.R`

## Contents of the Report

  - The GA_Opioid_Report includes the data set structure, Table1 summarizing the characteristics of variables, maps of each variable, histograms of the covariates of interest, and the results of fitting a Poisson regression model.
  
  - For the maps in the report, I just wrote the code in .rmd files because they required the tmap package and could not be saved as .png flies.
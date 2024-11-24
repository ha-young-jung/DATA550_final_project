# build the report
GA_Opioid_Report.html: code/04_render_report.R \
  GA_Opioid_Report.Rmd table histogram
	Rscript code/04_render_report.R

# code/02_data_structure_table1.R
output/table_one.rds: code/02_data_structure_table1.R data/dat.rds
	Rscript code/02_data_structure_table1.R

# code/03_make_histogram.R
output/hist_poverty.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R
	
output/hist_vacancy.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R
	
output/hist_unemp.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R
	
output/hist_black.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R
	
output/hist_road.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R
	
output/hist_trt.png: code/03_make_histogram.R data/dat.rds
	Rscript code/03_make_histogram.R

.PHONY: table
table: output/table_one.rds

.PHONY: histogram
histogram: output/hist_poverty.png \
  output/hist_vacancy.png \
  output/hist_unemp.png \
  output/hist_black.png \
  output/hist_road.png \
  output/hist_trt.png

.PHONY: clean
clean:
	rm -f output/*.png && rm -f output/*.rds && \
	rm -f GA_Opioid_Report.html

.PHONY:	install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
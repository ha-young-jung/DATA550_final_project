# build the report
GA_Opioid_Report.html: code/04_render_report.R \
  GA_Opioid_Report.Rmd table plots
	Rscript code/04_render_report.R

# code/02_data_structure_table1.R
output/table_one.rds: code/02_data_structure_table1.R data/dat.rds
	Rscript code/02_data_structure_table1.R

# code/03_make_plots.R
output/bar_rucc.png: code/03_make_plots.R data/dat.rds
	Rscript code/03_make_plots.R
	
output/hist_unemp.png: code/03_make_plots.R data/dat.rds
	Rscript code/03_make_plots.R

.PHONY: table
table: output/table_one.rds

.PHONY: plots
plots: output/bar_rucc.png \
  output/hist_unemp.png

.PHONY: clean
clean:
	rm -f output/*.png && rm -f output/*.rds && \
	rm -f GA_Opioid_Report.html

.PHONY:	install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
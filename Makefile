## Report associated rules (run within a docker container) ##
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

## Docker associated rules (run on our local machine) ##	
# rule to build image
PROJECTFILES = GA_Opioid_Report.Rmd code/02_data_structure_table1.R code/03_make_plots.R code/04_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

final_project: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t hayoungjung/final_project .
	touch $@ 

# rule to build the report automatically in our container
report/GA_Opioid_Report.html:
	docker run -v "/$$(pwd)/report":/home/rstudio/project/report hayoungjung/final_project
FROM rocker/rstudio:4.4.1 AS base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN apt-get update
RUN apt-get install -y cmake libcurl4-openssl-dev libudunits2-dev libfontconfig1-dev libxml2-dev libgdal-dev libharfbuzz-dev libfribidi-dev

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
FROM rocker/rstudio:4.4.1

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

RUN apt-get update && apt-get install -y cmake libcurl4-openssl-dev libudunits2-dev libfontconfig1-dev libxml2-dev libgdal-dev libharfbuzz-dev libfribidi-dev

COPY Makefile Makefile
COPY GA_Opioid_Report.Rmd GA_Opioid_Report.Rmd

RUN mkdir code
RUN mkdir output
RUN mkdir raw_data
RUN mkdir data
COPY code code
COPY raw_data raw_data
COPY data data

RUN mkdir report

CMD ["sh", "-c", "make && mv GA_Opioid_Report.html report"]






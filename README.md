# rp-stats
This repository contains data and code used for various statistical analyses and modeling.

## What's included

- [Statistical concepts](#statistical-concepts)
- [Statistical analysis](#statistical-analysis)
- [Modeling](#modeling)

## Statistical concepts

**stats-2018.Rmd** contains a very brief introduction to statistics.

It covers the fundamentals of statistics with examples to illustrate each concept using biological data (**genes.csv**) and a data set about famous statisticians (**statisticians.csv**).

The following topics are included:
- The nature of data
- Descriptive statistics
- Getting a 'feel' for the data
- Data visualization
- Statistical inference
- Linear models
- Generalized linear models

**stats-2019.Rmd** includes more demonstrations of statistical concepts, focusing on T-tests, linear models, and PCA.

## Statistical analysis

**soil-2018.R** contains a analysis of soil conditions depending on land use.

The data set **biogeochemistry.csv** includes various field measurements like pH, microbial biomass or the nitrogen fixing rate.   
This information is used to compare whether the soil differs between the forest and agroforestry sites.

**wg-2019.Rmd** contains a analysis of the rental housing market of Göttingen.

The data set **wg-gesucht.csv** includes information on the rent, location, number of flatmates and so on collected in early 2018.   
Using this data, the process of data analysis process is described and demonstrated.

## Modeling

**climate-2019.Rmd** shows the process of developing a two-pool soil organic carbon model to evaluate the how climate changes affects the carbon pool in soil.

The following field data is used to derive and estimate parameters for model building:
- **incubation-moisture.csv**
- **incubation-temp.csv**
- **incubation-time.csv**

Field data from a tropical forest and predicted climate data is used to investigate climate change-driven effects on soil carbon storage in tropical forest systems:
- **sulawesi-input.csv**
- **sulawesi-rcp26.csv**
- **sulawesi-rcp85.csv**

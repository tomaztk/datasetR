# datasetR: Generating random dataset for R

The `datasetR` helps you generate a random datasets for your R project. It provides a preset random list of values with different data types (interval, ordinal, nominal values). It includes also a function for imputing a NULL, NA or missing values.

## Installing

`datasetR`  package can be installed and downloaded from this Github repository using **devtools** package. More on
[devtools package](https://www.rstudio.com/products/rpackages/devtools/).
 
Installing is done using:

``` r
library(devtools)
install_github("tomaztk/datasetR")
```

## Getting started

Comes prepacked with a main function `dsR()` that will help you generate the dataset. But first, let's create a list with 20 different variable types and a random values.

```         
library(datasetR)set_of_val <- set_of_val
```
And you will get a starting set of values:
![Set of Values](imgs/img1_set_of_vals.png)


### Data Types



### Generating your random dataset

With the following example, the code will create a dataframe of 100 rows with total of 8 variables. The 8 variables will be type:
1. 3 x multi-class (nominal with multiple classes; characters or numbers)
2. 4 x two-class (nominal with two (binary) class ; characters or numbers)
3. 1 x interval (integer)

``` r
library(datasetR)
library(dplyr)

my_dataset <- dsR(vr="ms:3;bi:4;ii:1", nr=100);
```


## Community and distribution

You are welcome to submit suggestions and report bugs: https://github.com/tomaztk/datasetR/issues


This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

This problem set retraces the findings of the article "Gender Differences in the Choice of Major: The Importance of Female Role Models" by Catherine Porter and Danila Serra. They conducted a field experiment to examine the effects of female role models on the share of female students majoring in economics. The article can be found here: https://www.aeaweb.org/articles?id=10.1257/app.20180426.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
install.packages("RTutor",repos = c("https://skranz-repo.github.io/drat/",getOption("repos")))

if (!require(devtools))
  install.packages("devtools")

devtools::install_github("StefanieBuda/RTutorInfluenceOfFemaleRoleModels")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorInfluenceOfFemaleRoleModels)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorInfluenceOfFemaleRoleModels")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorInfluenceOfFemaleRoleModels",
       auto.save.code=TRUE, clear.user=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.

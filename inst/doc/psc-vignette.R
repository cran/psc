## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height= 5
)

## -----------------------------------------------------------------------------
#install.packages("psc")
library(psc)
library(ggpubr)
e4_data <- psc::e4_data

## -----------------------------------------------------------------------------
gemCFM <- psc::gemCFM

## -----------------------------------------------------------------------------
gemCFM$datasumm

## -----------------------------------------------------------------------------
ggarrange(plotlist=gemCFM$datavis)

## ----include=F----------------------------------------------------------------
surv.psc <- pscfit(gemCFM,e4_data)

## -----------------------------------------------------------------------------
attributes(surv.psc)

## -----------------------------------------------------------------------------
surv.post <- surv.psc$posterior
head(surv.post)

## -----------------------------------------------------------------------------
acf(surv.post$beta)

## -----------------------------------------------------------------------------
plot(surv.post$beta,typ="s")

## -----------------------------------------------------------------------------
summary(surv.psc)

## -----------------------------------------------------------------------------
plot(surv.psc)


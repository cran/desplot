## ----setup------------------------------------------------------------------------------
library("knitr")
knitr::opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ----yates------------------------------------------------------------------------------
library(agridat)
library(desplot)
data(yates.oats)
# Older versions of agridat used x/y here instead of col/row
if(is.element("x",names(yates.oats)))
   yates.oats <- transform(yates.oats, col=x, row=y)
desplot(yates.oats, block ~ col+row,
        col=nitro, text=gen, cex=1, out1=block,
        out2=gen, out2.gpar=list(col = "gray50", lwd = 1, lty = 1))

## ----ryder------------------------------------------------------------------------------
library(agridat)
library(desplot)
data(ryder.groundnut)
gnut <- ryder.groundnut
m1 <- lm(dry ~ block + gen, gnut) # Standard RCB model
gnut$res <- resid(m1)
desplot(gnut, res ~ col + row, text=gen, cex=1,
        main="ryder.groundnut residuals from RCB model")


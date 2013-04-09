extinction
==========

Matlab code to reproduce results from the paper 
"Predation effects on mean time to extinction under demographic stochasticity"

The original calculations were done by Gian Marco Palamara and the figures
in the paper are his. This is only the code that I used to reproduce some
of Gian Marco's results.

The file figs.m allows to produce plots similar to those in figures 4 and 5
in the paper that show the mean time to extinction as a function of 
handling time while keeping the overall predation pressure fixed.

fig2.m produces a plot similar to the one in the lower panel of figure 3
showing the mean time to extinction as a function of handling time and
attack rate.

In explore.m one can choose parameter values and then plot the quasistationary
distribution, superimposed with the deterministic rate of change. This
allows to get a feel for the quasistationary distribution. 

The files mte.m and iterative_qs.m hold functions to calculate the 
mean time to extinction and the quasistationary distribution, respectively.

The matlab code is documented with references to equations in the
paper and also uses variable names similar to those chosen in the paper.
# trippart

Supplementary code for Lagrangian particle simulation from the paper: ___Adriatic currents and the population structure of a benthic fish with planktonic larvae___ by Wagner, M. , Koblmüller, S. , Zangl, L. , Hahn, C. & Sefc, K.

The simulations were done using the [Parcels](http://oceanparcels.org/) package, which we have set up in a Docker container (see [here](https://github.com/chrishah/parcels-jupyter-notebook-docker) for details), utilizing daily mean circulation fields produced by the Adriatic Forecasting System ([AFS](http://oceanlab.cmcc.it/afs/)). 

For full reproducibility, we provide here all code for doing the simulations as well as the visualization of the results:
 - [notebook I](https://github.com/chrishah/trippart/tree/master/code/simulations/simu.ipynb): shows how the data was downloaded from the AFS and how the simulations were performed.
 - [notebook II](https://github.com/chrishah/trippart/tree/master/code/simulations/extract_data.ipynb): simulation results are converted into plain text format to be processed in R.
 - [R scripts](https://github.com/chrishah/trippart/tree/master/code/visualization): How the data were plotted.



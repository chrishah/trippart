# trippart

Supplementary code for Lagrangian particle simulations from the paper: 
___Phylogeographic structure and population connectivity of a small benthic fish (*Tripterygion tripteronotum*) in the Adriatic Sea___
Kristina M. Sefc, Maximilian Wagner, Lukas Zangl, Sara Weiß, Bernd Steinwender, Paul Arminger, Theresa Weinmaier, Nejra Balkic, Tobias Kohler, Silvio Inthal, Marcelo Kovačić, Stamatis Zogaris, Christoph Hahn, Stephan Koblmüller

The simulations were done using the [Parcels](http://oceanparcels.org/) package, which we have set up in a Docker container (see [here](https://github.com/chrishah/parcels-jupyter-notebook-docker) for details), utilizing daily mean circulation fields produced by the Adriatic Forecasting System ([AFS](http://oceanlab.cmcc.it/afs/)). 

For full reproducibility, we provide here all code for doing the simulations as well as the visualization of the results (note that via the links below the notebooks are rendered through [nbviewer](https://nbviewer.jupyter.org/)):
 - [notebook I](https://nbviewer.jupyter.org/github/chrishah/trippart/blob/master/code/simulations/simu.ipynb): shows how the AREG data were downloaded from the AFS and how the simulations were performed.
 - [notebook II](https://nbviewer.jupyter.org/github/chrishah/trippart/blob/master/code/simulations/extract_data.ipynb): simulation results are converted into plain text format to be processed in R.
 - [R scripts](https://github.com/chrishah/trippart/tree/master/code/visualization): How the data were plotted.



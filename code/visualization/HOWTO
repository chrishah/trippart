
R code to visualize the results of the simulations on a map.

The script `plot_to_map.R` is designed to be used within an bash loop, like below.

This loops over all data files, for each file replace the filename and location in the Rscript and execute the script, which will plot the data onto the map. One plot for each month and a last one with all datapoints.
```bash
dir=../simulations/data/
for file in $(ls -1 $dir/*.data.tsv)
do
	echo -e "Plotting data from $file"
	Rscript <(cat plot_to_map.R | sed "s/replacefile/$file/" | sed "s/replacelocation/$(echo $file | cut -d "." -f 1)/")
done
```

The remaining two scripts create plots that group data from locations assigned to particular gyres. 

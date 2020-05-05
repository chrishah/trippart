
R code to visualize the results of the simulations on a map.

The script `plot_to_map.R` is designed to be used within an bash loop, like below.

This loops over all data files, for each file replace the filename and location in the Rscript and execute the script, which will plot the data onto the map. One plot for each month and a last one with all datapoints.
```bash
dir=../simulations/data/
for file in $(ls -1 $dir/*.data.tsv)
do
	echo -e "Plotting data from $file"
	Rscript <(cat <(echo "setwd('$(pwd)')") plot_to_map.R | sed "s?replacefile?$file?" | sed "s?replacelocation?$(echo ${file##*/} | cut -d "." -f 1)?")
done
```

The remaining two scripts create plots that group data from locations assigned to particular gyres.

If you don't have R installed on your computer, you can redo the visualizations using an official R-base Docker image - requirement is that you have Docker running (tested with 18.09.7, build 2d0083d). Note that the code in the scripts will produce high quality PDF files of size > 20MB. The \*.png files deposited in the repo were converted from the PDFs with inkscape.

Do the following:
```bash
#start an official base-r Docker container at the base of this repo
docker run -it --rm -v $(pwd):/data -w /data r-base:4.0.0 /bin/bash

#install the R packages that you're going to need
R --vanilla -e 'install.packages("rworldmap", repos="http://cran.wu.ac.at/")'
R --vanilla -e 'install.packages("rworldxtra", repos="http://cran.wu.ac.at/")'

#move to the directory containing the R scripts
cd code/visualization/

dir=../simulations/data/
for file in $(ls -1 $dir/*.data.tsv)
do
        echo -e "Plotting data from $file"
        Rscript <(cat <(echo "setwd('$(pwd)')") plot_to_map.R | sed "s?replacefile?$file?" | sed "s?replacelocation?$(echo ${file##*/} | cut -d "." -f 1)?")
done

#The other two scripts
Rscript <(cat <(echo "setwd('$(pwd)')") plot_by_group.R)
Rscript <(cat <(echo "setwd('$(pwd)')") plot_by_group_by_month.R)

#convert the pdfs to pngs using convert
apt-get update
apt-get install imagemagick
convert by_group_4_panel_paper_convert.pdf -background transparent by_group_4_panel_paper.png

convert the pdfs to pngs using inkscape
apt-get install inkscape
for pdf in $(ls -1 *.pdf)
do 
	inkscape --export-dpi=600 --export-area-drawing --export-type=png $pdf
done
``` 

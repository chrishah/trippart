
#here the data is defined, I am using a bash loop to change the input files/locations on the fly and execute the script
#in bash on the command line
data <- read.table('replacefile', sep = '\t')
location <- 'replacelocation'
colnames(data) <- c("datetime", "lon", "lat")

#read in the tsv file with group assignments of locations
groups <- read.table('Gruppen.tsv', sep='\t')
colnames(groups) <- c("file", "group")

#figure out the group that the given location belongs to
group <- groups$group[grep(location, groups$file)]

#read in the tsv file with the rgb color setting for each group
group_colors <- read.table('group_colors.tsv', sep="\t")
colnames(group_colors) <- c("Group", "red", "green", "blue")

#set some parameters for plotting
#alpha is transparency of points
#pch is point symbol
alpha <- 0.3
pch <- 20
pointsize <- 0.2

library(rworldmap)
#library(rworldxtra)
newmap <- getMap(resolution = 'high')
#newmap <- getMap(resolution = 'low')

#initiate output file
pdf(paste(location, ".pdf", sep=""))

#set the layout for plotting
#individual plots will be organized according to the matrix, first is just the header which will be
#across all three columns (see '1' in the matrix). Then there are 3 further plots per column
layout(matrix(c(1,2,5,8,1,3,6,9,1,4,7,10), ncol = 3), heights = c(0.3,1,1), widths = c(1,1,1,1))

#set the margins for the first plot (the title)
#The 4 numbers are bottom, left, top, right, so we set the margins on the bottom and the top to zero, which
#allows to make the text bigger and reduce the distance to the actual plots
par(mar=c(0, 2, 0, 2))

#plot main title
plot.new()
text(0.5,0.5, location, cex=2, font = 2)

#reset the margins for the individual plots - here we want equal margins in each direction from each plot
par(mar=c(2, 2, 2, 2))

#plot 9 panels, i.e. one for each month, plus one for all - see the script 'plot_by_group_by_month.R' for a more
#elegant solution to plot each month. Essentially I just made a loop instead of manually plotting each month
#The rest is the same.

months <- 2:9 #month numbers
month <- months[1] #do the first month, which is '2', so Febrary for our data
#produce the pattern that will be searched for in the data from the Number. For February it's '-02-', because the date is
#formatted like so in the data: '2004-02-21T00:00:0000000'
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
#plot the empty map with Month as title
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="February", axes=T)
#plot the individual points - note that the data is filtered for month on the fly via grep and pattern
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)

#as above
month <- months[2]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="March", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[3]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="April", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[4]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="May", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[5]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="June", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[6]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="July", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[7]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="August", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)


month <- months[8]
pattern <- paste("-",sprintf("%02d", month), "-", sep="")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="September", axes=T)
points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
       col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)

#finally, in the last plot we display all data for the location across all months, so no filter
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="February-September", axes=T)
points(data$lat, data$lon, col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
               green=(group_colors$green[grep(group, group_colors$Group)]/255), 
               blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
               alpha=alpha), 
       cex=pointsize, pch=pch)



dev.off()

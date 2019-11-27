setwd('/home/chrishah/Desktop/Particles/particles_data/')

library(rworldmap)
#newmap <- getMap(resolution = 'low')
newmap <- getMap(resolution = 'high')

#read in tsv file defining the groups
groups <- read.table('Gruppen.tsv', sep='\t')
colnames(groups) <- c("file", "group")

#read in tsv file defining the rgb setting for each group
group_colors <- read.table('group_colors.tsv', sep="\t")
colnames(group_colors) <- c("Group", "red", "green", "blue")

#set some parameters for plotting
#alpha is transparency of points
#pch is point symbol
alpha <- 0.3
pch <- 20
pointsize <- 0.2

#create a dataframe for the months that will be plotted
numbers <- c(2,3,4,5,6,7,8,9)
names <- c("February", "March", "April", "May", "June", "July", "August", "September")
months <- data.frame(numbers, names)

#plot by month, by location, in 9 panels
for(i in 1:nrow(months)){
  print(months$name[i])
  #produce the pattern that will be searched for in the data from the Number. For February it's '-02-', because the date is
  #formatted like so in the data: '2004-02-21T00:00:0000000'
  pattern <- paste("-",sprintf("%02d", months$numbers[i]), "-", sep="")
  
  #define the output file
  pdf(paste(months$names[i],".by_group_4_panel.pdf",sep=""))
  
  #set the layout for plotting
  #individual plots will be organized according to the matrix, first is just the header which will be
  #across both columns (see '1' in the matrix). Then there are 2 further plots per column
  layout(matrix(c(1,2,4,1,3,5), ncol = 2), heights = c(0.2,1,1), widths = c(1,1,1,1))
  
  #set the margins for the first plot (the title)
  #The 4 numbers are bottom, left, top, right, so we set the margins on the bottom and the top to zero, which
  #allows to make the text bigger and reduce the distance to the actual plots
  par(mar=c(0, 2, 0, 2))
  
  #plot the header of the figure, i.e. the name of the month
  plot.new()
  #text(0.5,0.5, paste(months$name[i], " (2004 - 2018)"), cex=2, font = 2)
  text(0.5,0.5, paste(months$name[i]), cex=2, font = 2)
  
  #reset the margins of the individual plots - here we want equal distance in all directions between plots
  par(mar=c(2, 2, 2, 2))
  
  #do the individual plots by group, first set the group and make just the empty map with the group name as the title
  group <- "Istrian"
  plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste("A -", group, "gyre"), axes=T)
  
  #then for each location that matches the group, plot the datapoints for the current month into the same plot
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    #read in the data
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    #plot the datapoints - note the filter by data via grep and pattern
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
           col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                   green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                   blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                   alpha=alpha), 
           cex=pointsize, pch=pch)
  }
  
  #Next group, the rest is as above
  group <- "Northern"
  plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste("B -", group, "gyre"), axes=T)
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
           col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                   green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                   blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                   alpha=alpha), 
           cex=pointsize, pch=pch)
  }
  
  group <- "Central"
  plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste("C -", group, "gyre"), axes=T)
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
           col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                   green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                   blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                   alpha=alpha), 
           cex=pointsize, pch=pch)
  }
  
  group <- "Southern"
  plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste("D -", group, "gyre"), axes=T)
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
           col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                   green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                   blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                   alpha=alpha), 
           cex=pointsize, pch=pch)
  }
  #finalize the plot
  dev.off()
  
}

#plot by month, all groups in one
dev.off()

#as above, the only difference is that we plot all into the same figure, just a simple plot with header
for(i in 1:nrow(months)){
  print(months$name[i])
  pattern <- paste("-",sprintf("%02d", months$numbers[i]), "-", sep="")
  
  pdf(paste(months$names[i],".by_group_all-in-one.pdf", sep=""))
  plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste(months$names[i]," (2004 - 2018)"), axes=T)

  group <- "Istrian"
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
  }

  group <- "Northern"
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
  }

  group <- "Central"
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
  }

  group <- "Southern"
  for(i in 1:length(groups$file[grep(group, groups$group)])){
    file <- groups$file[grep(group, groups$group)][i]
    print(paste(file))
    data <- read.table(paste(file), sep = '\t')
    colnames(data) <- c("datetime", "lon", "lat")
    points(data[grep(pattern, data$datetime), ]$lat, data[grep(pattern, data$datetime), ]$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
  }
  dev.off()
}

setwd('/home/chrishah/Desktop/Particles/particles_data/')

library(rworldmap)
#newmap <- getMap(resolution = 'low')
newmap <- getMap(resolution = 'high')

groups <- read.table('Gruppen.tsv', sep='\t')
colnames(groups) <- c("file", "group")

group_colors <- read.table('group_colors.tsv', sep="\t")
colnames(group_colors) <- c("Group", "red", "green", "blue")

#set some parameters for plotting
#alpha is transparency of points
#pch is point symbol
alpha <- 0.1
pch <- 20
pointsize <- 0.2

#4 panel
dev.off()

pdf("by_group_4_panel.pdf")
par(mar=c(0, 2, 0, 2))
layout(matrix(c(1,2,4,1,3,5), ncol = 2), heights = c(0.2,1,1), widths = c(1,1,1,1))
plot.new()
text(0.5,0.5, "February - September (2004 - 2018)", cex=2, font = 2)

par(mar=c(2, 2, 2, 2))

group <- "Istrian"
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste(group), axes=T)
for(i in 1:length(groups$file[grep(group, groups$group)])){
  file <- groups$file[grep(group, groups$group)][i]
  print(paste(file))
  data <- read.table(paste(file), sep = '\t')
  colnames(data) <- c("datetime", "lon", "lat")
  points(data$lat, data$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
}

group <- "Northern"
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste(group), axes=T)
for(i in 1:length(groups$file[grep(group, groups$group)])){
  file <- groups$file[grep(group, groups$group)][i]
  print(paste(file))
  data <- read.table(paste(file), sep = '\t')
  colnames(data) <- c("datetime", "lon", "lat")
  points(data$lat, data$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
}

group <- "Central"
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste(group), axes=T)
for(i in 1:length(groups$file[grep(group, groups$group)])){
  file <- groups$file[grep(group, groups$group)][i]
  print(paste(file))
  data <- read.table(paste(file), sep = '\t')
  colnames(data) <- c("datetime", "lon", "lat")
  points(data$lat, data$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
}

group <- "Southern"
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main=paste(group), axes=T)
for(i in 1:length(groups$file[grep(group, groups$group)])){
  file <- groups$file[grep(group, groups$group)][i]
  print(paste(file))
  data <- read.table(paste(file), sep = '\t')
  colnames(data) <- c("datetime", "lon", "lat")
  points(data$lat, data$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
}

dev.off()

#all in one
dev.off()

pdf("by_group_all-in-one.pdf")
plot(newmap, xlim=c(11, 20), ylim=c(39,46), asp=1, main="February - September (2004 - 2018)", axes=T)


group <- "Istrian"
for(i in 1:length(groups$file[grep(group, groups$group)])){
  file <- groups$file[grep(group, groups$group)][i]
  print(paste(file))
  data <- read.table(paste(file), sep = '\t')
  colnames(data) <- c("datetime", "lon", "lat")
  points(data$lat, data$lon, 
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
  points(data$lat, data$lon, 
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
  points(data$lat, data$lon, 
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
  points(data$lat, data$lon, 
         col=rgb(red=(group_colors$red[grep(group, group_colors$Group)]/255), 
                 green=(group_colors$green[grep(group, group_colors$Group)]/255), 
                 blue=(group_colors$blue[grep(group, group_colors$Group)]/255), 
                 alpha=alpha), 
         cex=pointsize, pch=pch)
}
dev.off()

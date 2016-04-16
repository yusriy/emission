# Import data and graph stacked bar plot
criteria_pollutants <- read.csv("data/criteria_pollutants.csv", header=TRUE)

# Rename the headers
rownames(criteria_pollutants) <- criteria_pollutants[,1]#rename header[row,column],using 1st row

# Remove 1st row,-1 remove 1st row
criteria_pollutants <- criteria_pollutants[,-1]

# Change all values to numeric type
criteria_pollutants <- sapply(criteria_pollutants,as.numeric)

# To plot the barplot
png(filename='fig/criteria_pol_barplot_abline.png',height=8,width= 16,units='cm',
    res = 400)

# To set margins and legend position
par(xpd=TRUE,mar=c(2.5,3,0.5,10))

barplot(criteria_pollutants,
      col=c('grey80','grey60','grey50','grey40'),horiz=TRUE,axes = FALSE)
abline(v=seq(10,90,by=10),lty='dotted')
par(new = TRUE)
barplot(criteria_pollutants,
        col=c('grey80','grey60','grey50','grey40'), horiz=TRUE,axes = FALSE)
#grid(ny=NA,nx=10,col='grey20',lty='dotted')
axis(side=1,at=c(0,10,20,30,40,50,60,70,80,90,100),
     labels = c('0%','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'))

legend(110,5,col=c('grey80','grey60','grey50','grey40'),
       pch=c(15,15,15,15),
       legend=c('Industries','Power plant',
                'Others','Motor vehicles'),cex = 1)
dev.off()
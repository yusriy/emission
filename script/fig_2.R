### Script to plot Fig. 2 a

## Import data
active_non_active <- read.csv('data/active_non_active.csv',sep=',',header=TRUE)
# To transpose
active_non_active <- t(active_non_active)
# rename header[row,column],using 1st row
colnames(active_non_active) <- active_non_active[1,]
# remove 1st row,-1 remove 1st row
active_non_active <- active_non_active[-1,]
## To plot the barplot
png(filename='fig/fig_2_active_non_active.png',height=8,width= 16,units='cm',
    res = 400)
# To set margins and legend position
par(xpd=TRUE,mar=c(2.5,5,1,1))
barplot(active_non_active/1000000,
        ylab=expression(paste("Number of vehicles, 10"^"6")),
        beside = TRUE,col=c('grey90','white'),
        names=c('2008','2009','2010','2011','2012','2013'),ylim =c(0,20),
        xlab = 'Year')
legend('topleft',col=c('black','black'),pt.bg=c('grey90','white'),pch=c(22,22),
       legend=c('Active','Non-active'))
#box for barplot
box()
dev.off()

### Script to plot Fig. 2 c

## Import data and graph stacked bar plot
criteria_pollutants <- read.csv("data/criteria_pollutants.csv", header=TRUE)
# Rename the headers; rename header[row,column],using 1st row
rownames(criteria_pollutants) <- criteria_pollutants[,1]
# Remove 1st row,-1 remove 1st row
criteria_pollutants <- criteria_pollutants[,-1]
# Change all values to numeric type
criteria_pollutants <- sapply(criteria_pollutants,as.numeric)

## To plot the barplot
png(filename='fig/fig_2_pollutants.png',height=8,width= 16,units='cm',
    res = 400)
# To set margins and legend position
par(xpd=TRUE,mar=c(4,3,0.5,10))
barplot(criteria_pollutants,
        col=c('red','blue','green','white'),horiz=TRUE,xaxt='n',
        names.arg = c('CO','PM', expression(paste('NO'['2'])),
                      expression(paste('SO'['2']))),xlab = 'Percent contribution')
# grid(ny=NA,nx=10,col='grey20',lty='dotted')
axis(side=1,at=c(0,10,20,30,40,50,60,70,80,90,100),
     labels = c('0%','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'))

legend(110,5,col=c('black','black','black','black'),
       pch=c(22,22,22,22),pt.bg = c('blue','red','green','white'),
       legend=c('Industries','Power plant',
                'Others','Motor vehicles'),cex = 1)
dev.off()
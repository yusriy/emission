# Import data
active_non_active <- read.csv('data/active_non_active.csv',sep=',',header=TRUE)

#do transpose
active_non_active <- t(active_non_active)

#rename header[row,column],using 1st row
colnames(active_non_active) <- active_non_active[1,]

#remove 1st row,-1 remove 1st row
active_non_active <- active_non_active[-1,]

# To plot the barplot
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




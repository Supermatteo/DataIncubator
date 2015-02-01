library(data.table)
library(reshape2)
library(plyr)
library(lubridate)

dat <- fread("hits.csv")
#dat <- dat1[1:10000,]

dat$time <- ymd_hms(dat$time)
dat$user <- as.factor(dat$user)
dat$category <- as.factor(dat$category)

## caculate average time 
maxmin <- dat[,as.list(each(min,max)(time)),by=user]
maxmin$tot <- maxmin$max - maxmin$min
avgTim <- maxmin$tot[maxmin$tot != 0]
avg <- mean(avgTim)
avgtime <- mean(avgTim)
print(avgtime, digits = 10)

meanTime <- data.frame
usrTime <- data.frame

#calculate average time between consecutive pages
usrTime <- dat[ ,list(Diff=diff(time)), by=user]
usrTime$diff <- as.numeric(usrTime$Diff, units = "secs")
usrAgg <- aggregate(diff ~user, data=usrTime, FUN = mean)
avgUsr <- mean(usrAgg$diff)
print(avgUsr, digits = 10)


# calculate average number of pages
tab <- as.data.frame.matrix(table(dat$user, dat$category))
tab$sum <- rowSums(tab[1:17])
avpag <- mean(tab$sum)
print(avpag, digits = 10)

# calculate average number of pages given more than one page
multpage <- tab$sum[tab$sum > 1]
avmult <- mean(multpage)
print(avmult, digits = 10)

# average number of categories per user
catPerUser<-rowSums(tab[1:17]!=0)
avcat <- mean(catPerUser)
print(avcat, digits = 10)

# calculate average number of categories given more than one page
tabMult <- tab[tab$sum > 1,]
tabMult$cat <- rowSums(tabMult[1:17]!=0)
avMultCat <- mean(tabMult$cat)
print(avMultCat, digits = 10)

# calculate adverage number of categories given more than one category
tab$cat <- rowSums(tab[1:17]!=0)
catMorePage <- tab[,c(18,19)]
MoreCat <- catMorePage[catMorePage$cat>1, ]
avgMoreCat <- mean(MoreCat$cat)
print(avgMoreCat, digits = 10)
## Reading from wikipedia API the names of the companies traded in the NY stock exchange and plce them in a list
x <- ("http://en.wikipedia.org//w/api.php?action=query&list=categorymembers&format=json&cmtitle=Category%3ACompanies%20listed%20on%20the%20New%20York%20Stock%20Exchange&cmprop=ids%7Ctitle%7Csortkey%7Csortkeyprefix%7Ctype%7Ctimestamp&cmlimit=max&indexpageids=&rawcontinue=")
x2 <- "http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&format=json&cmtitle=Category%3ACompanies%20listed%20on%20the%20New%20York%20Stock%20Exchange&cmprop=ids%7Ctitle%7Csortkey%7Csortkeyprefix%7Ctype%7Ctimestamp&cmlimit=max&cmstartsortkeyprefix=Enersys&rawcontinue="
x3 <- "http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&format=json&cmtitle=Category%3ACompanies%20listed%20on%20the%20New%20York%20Stock%20Exchange&cmprop=ids%7Ctitle%7Csortkey%7Csortkeyprefix%7Ctype%7Ctimestamp&cmlimit=max&cmstartsortkeyprefix=Nvr%2C%20Inc.&rawcontinue="
x4 <- "http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&format=json&cmtitle=Category%3ACompanies%20listed%20on%20the%20New%20York%20Stock%20Exchange&cmprop=ids%7Ctitle%7Csortkey%7Csortkeyprefix%7Ctype%7Ctimestamp&cmlimit=max&cmstartsortkeyprefix=Wellcare%20Health%20Plans&rawcontinue="
document <- fromJSON(txt=x)
document <-as.data.frame(document)
document2 <- fromJSON(txt=x2)
document2 <-as.data.frame(document2)
document3 <- fromJSON(txt=x3)
document3 <-as.data.frame(document3)
document4 <- fromJSON(txt=x4)
document4 <-as.data.frame(document4)
document <- rbind(document, document2)
document <- rbind(document, document3)
document <- document[,2:9]
document <- rbind(document, document4)
document <- unique(document)
names<- document$query.categorymembers.title

## Use training data from twitter including twit polarity, to evaluate "apple" and "iphone" feeling over a 46 days period
twit <- fread("twsent.csv", header = FALSE)
names(twit) <- c("polarity", "id", "date", "query", "user", "text")
twit$polarity <- as.factor(twit$polarity)
twit$id <- as.factor(twit$id)
twit$date <- as.POSIXct(twit$date,  "%a %b %d %H:%M:%S PDT %Y", tz='PDT')

apple <- twit[grep("(?i)apple", twit$text),]
apple$date <- as.Date(as.character(as.POSIXct(apple$date)))
apptab <- table(apple$polarity, apple$date)
apptab <- as.data.frame(apptab)
p <- ggplot(data=apptab, aes(x=Var2, y=Freq, fill = Var1)) +geom_histogram(stat="identity")+theme(axis.text.x = element_text(angle = -90, hjust = 1))

iphone <- twit[grep("(?i)iphone", twit$text),]
iphone$date <- as.Date(as.character(as.POSIXct(iphone$date)))
iptab <- table(iphone$polarity, iphone$date)
iptab <- as.data.frame(iptab)
p1 <- ggplot(data=iptab, aes(x=Var2, y=Freq, fill = Var1)) +geom_histogram(stat="identity")+theme(axis.text.x = element_text(angle = -90, hjust = 1))

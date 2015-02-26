## February 2015 R Meetup
## 2015-02-25

student <- read.csv('r_graphics_studentdata.csv', stringsAsFactors=FALSE)
head(student)
summary(student)

student_m <- subset(student, Gender=='M')
student_f <- subset(student, Gender=='F')



## Basic plot
plot(student$HrsStudied, student$Grade)

## Customize labels
plot(student$HrsStudied, student$Grade,
     xlab='Hours Studied for Test',
     ylab='Test Score',
     main='Test Score vs. Hours Studied')

## Customize y-axis
plot(student$HrsStudied, student$Grade,
     xlab='Hours Studied for Test',
     ylab='Test Score',
     main='Test Score vs. Hours Studied',
     yaxt='n')
axis(2, at=seq(0,1,.05), lab=paste0(seq(0,1,.05)*100,'%'), las=1, cex.axis=0.8, hadj=0.75)

## Customize plot area
plot(student$HrsStudied, student$Grade,
     xlab='Hours Studied for Test',
     ylab='Test Score',
     main='Test Score vs. Hours Studied',
     yaxt='n',
     pch=21,
     bg=ifelse(student$Gender=='M','blue','orange'))
axis(2, at=seq(0,1,.05), lab=paste0(seq(0,1,.05)*100,'%'), las=1, cex.axis=0.8, hadj=0.75)
grid()
legend('topleft', legend=c('M','F'), fill=c('blue','orange'), inset=.03)

## Add best fit lines
lm_m <- with(subset(student, Gender=='M'), lm(Grade ~ HrsStudied))
lm_f <- with(subset(student, Gender=='F'), lm(Grade ~ HrsStudied))
abline(lm_m, col='blue', lwd=2, lty=2); abline(lm_f, col='orange', lwd=1, lty=1)

## Add point label
hs <- which.max(student$Grade)
text(student[hs,'HrsStudied']+0.12, student[hs,'Grade']+0, student[hs,'Student'], cex=0.7, font=3)
rm(hs)



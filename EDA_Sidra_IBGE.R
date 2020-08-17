#--------------IBGE- SIDRA applications ---------------------------------------#
# first get entrance with the data (spreadsheet) 
# we two-way to o that, online directly or by downloaded archives
# lets demonstrate both:

#---online path---#
x<-read.table("https://raw.githubusercontent.com/G4LV40/EDA/master/dados.csv")

# directory path:
dados<-read.table("dados.csv", header=TRUE)

# perhaps you may have problems on this step, for one reason, your directory
# is in a different path than you data, in this case you have to change it:

setwd("/home/luciano/Desktop/Curso_IBGE_UNEMAT")

# ------------Now your data and processing workspace of R "r" 
#on same spot. let's make our data analysis-----------------------

#First let's active some libraries:
library(fBasics)


#A descriptive analysis, before that,  attach data, and see his 
#variables names:

attach(dados)
head(dados)

#checking if there is any missing data
is.na(dados)

basicStats(dados$Altura)

summary(dados$Peso)

#-------------Or we can made each case by the commands below:-------------------

max (Peso) # Returns the maximum value of a field

min (Peso) # Returns the minimum value of a field

mean(Peso) # Returns the average of a field

median(Peso) #Returns the median of a field

sd (Peso) #Returns the standard deviation of a field

var (Peso) #Returns the variance of a field

sum (Peso) #Returns the (total) sum of a field

length (Peso) # Returns the number of elements in a field

range (Peso) #Return the minimum and maximum values of a field

quantile (Peso) #Returns the quantities of a field

prop.table (table (Peso)) # probabilistic distribution of data by
#every observation

sort (Peso) # sorts data in ascending mode

# organizes in ascending or descending order
order(Peso,decreasing = TRUE)
dd<-c(order(Peso, decreasing = TRUE),Peso);matrix(dd,6,2)

hist(Peso)
plot(prop.table(Peso))

# pies
pie(Peso)
pie(prop.table(Peso))

# in bars
barplot(Peso,
        xlab = "Class ",
        ylab = " Frequency",
        col = c("blue", "red"))

# we con put a text on graphics
text(6,6, "write here")

# set also a dot 
points(6,7,pch=8)

#------EDA with a packages----------------

library (SmartEDA)
library(ds)
library(corrgram)


#Application in categorical variables; we have to transform our data and input
#some simulated data by a binomial distribution, for example:
cat.bin<-rbinom(9,1,0.5)
dados.1<-cbind(dados[,-2],cat.bin)
attach(dados.1)
head(dados.1)

# Summary statistics
ExpCTable(dados.1, Target = NULL,margin = 1,clim = 10,nlim = 10,round = 2,
          bin = 3,per = FALSE)


# Target variable "cat,bin" - simulated
ExpCatStat(dados.1,Target="cat.bin",result = "Stat",clim=10,nlim=10,bins=10,
           Pclass=1,plot=FALSE,top=20,Round=2)

# it says about correlation, let's check:
cor(Peso,cat.bin)
cor(Altura,cat.bin)
cor(Peso,Altura)

# or with a library
dscor(dados.1[,-1])

matcor<-cor(dados.1[,-1])
corrgram(matcor, type = "cor", lower.panel = panel.shade,
         upper.panel = panel.pie)
















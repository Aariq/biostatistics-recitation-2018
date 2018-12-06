# Displaying data: R code for Chapter 2 examples
# Download the R code on this page as a single file <a href="../wp-content/rcode/chap02.r">here.
# ------------------------------------------------------------

# Figure 2.1-2. <a href="../wp-content/data/chapter02/chap02f1_2locustSerotonin.csv">Locust serotonin
# Strip chart of serotonin levels in the central nervous system of desert locusts that were experimentally crowded for 0 (the control group), 1, and 2 hours.
# Read the data and store in data frame (here named locustData). The following command uses read.csv to grab the data from a file on the internet (on the current web site).

locustData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02f1_2locustSerotonin.csv"))

# Show the first few lines of the data, to ensure it read correctly. Determine the number of cases in the data.

head(locustData)
nrow(locustData)

# Draw a stripchart (the tilde "~" means that the first argument below is a formula, relating one variable to the other). 

stripchart(serotoninLevel ~ treatmentTime, data = locustData, method = "jitter", 
	vertical = TRUE)

# We show here how to draw a fancier strip chart, closer to that shown in Figure 2.1-2, by including more options.

# Stripchart with options
par(bty = "l") # plot x and y axes only, not a complete box
stripchart(serotoninLevel ~ treatmentTime, data = locustData, vertical = TRUE, 
	method = "jitter", pch = 16, col = "firebrick", cex = 1.5, las = 1,
	ylab = "Serotonin (pmoles)", xlab = "Treatment time (hours)",
	ylim = c(0, max(locustData$serotoninLevel)))
# The following command calculates the means in each treatment group (time)
meanSerotonin = tapply(locustData$serotoninLevel, locustData$treatmentTime, mean)
# "segments" draws draws lines to indicate the means
segments(x0 = c(1,2,3) - 0.1, y0 = meanSerotonin, x1 = c(1,2,3) + 0.1, 
	y1 = meanSerotonin, lwd = 2)
# ------------------------------------------------------------

# Figure 2.1-3. <a href="../wp-content/data/chapter02/chap02f1_3EducationSpending.csv">Education spending
# A bar graph of education spending per student in different years in British Columbia.
# Read the data into a data frame named educationSpending, and inspect.

educationSpending <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02f1_3EducationSpending.csv"))
head(educationSpending)

# Draw a bar graph. The names argument generates numbers between 1998 and 2004 in 1-year increments, to be used as labels along the horizontal axis.

barplot(educationSpending$spendingPerStudent, names.arg = educationSpending$year,
	ylab = "Education spending ($ per student)")

# A slightly fancier bar graph like that in Figure 2.1-3, which includes additional options, is shown here.

# Bar graph with more options
barplot(educationSpending$spendingPerStudent, names.arg = educationSpending$year, 
	las = 1, col = "firebrick", ylim = c(0,8000),
	ylab = "Education spending ($ per student)")

# ------------------------------------------------------------

# Example 2.2A. <a href="../wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv">Deaths from tigers
# Frequency table and bar graph showing activities of 88 people at the time they were killed by tigers near Chitwan National Park, Nepal, from 1979 to 2006.
# Read the data into data frame named tigerData

tigerData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv"))
head(tigerData)

# Generate a frequency table. The sort function is included to sort the categories by their frequencies.

tigerTable <- sort(table(tigerData$activity), decreasing = TRUE)
tigerTable

# You can arrange the frequency table vertically.

data.frame(Frequency = tigerTable)

# Use the addmargins command to include sums in your frequency table.

data.frame(Frequency = addmargins(tigerTable))

# Draw a bar graph. The additional arguments cex.names = 0.5 shrinks the axis labels by 50%, and las = 2 flips the labels, so that they all fit in the window.

barplot(tigerTable, ylab = "Frequency", cex.names = 0.5, las = 2)

# A slightly fancier bar graph of the data with more options, like that shown in Figure 2.2-1, is shown here.

oldpar = par(no.readonly = TRUE) # stores a backup copy of current graph settings in "oldpar"
par(mar = c(8, 4, 4, 2) + 0.1)   # creates more room for labels below the x-axis
barplot(tigerTable, las = 2, col = "firebrick", cex.names = 0.8, ylim = c(0,50), 
	xlab = "", ylab = "Frequency (number of people)")
mtext("Activity", side = 1, line = 7, cex = 0.9) # adds the text under the x-axis
par(oldpar)  # reverts graph settings back to default

# ------------------------------------------------------------

# Example 2.2B. <a href="../wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv">Desert bird abundance
# Frequency table and histogram illustrating the frequency distribution of bird species abundance at Organ Pipe Cactus National Monument. 
# Read and inspect the data.

birdAbundanceData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv"))
head(birdAbundanceData)

# Generate a frequency table of the numeric bird abundance variable. The option right = FALSE ensures that abundance value 300 (for example) is counted in the 300-400 bin rather than in the 200-300 bin.

birdAbundanceTable <- table(cut(birdAbundanceData$abundance, 
	breaks = seq(0,650,by=50), right = FALSE))
birdAbundanceTable

# The same table oriented vertically and including the sum.

data.frame(Frequency = addmargins(birdAbundanceTable))

# Draw a histogram of bird abundances. 

hist(birdAbundanceData$abundance, right = FALSE)

# Commands to draw a histogram with more options, such as Figure 2.2-3, are here.

# Histogram with options
hist(birdAbundanceData$abundance, right = FALSE, breaks = seq(0,650,by=50),	
	col = "firebrick", las = 1, xlab = "Abundance (No. individuals)",  
	ylab = "Frequency (No. species)", main = "")

# ------------------------------------------------------------

# Figure 2.2-5. <a href="../wp-content/data/chapter02/chap02f2_5SalmonBodySize.csv">Salmon body size
# Histograms of body mass of 228 female sockeye salmon sampled from Pick Creek in Alaska. The same data are plotted for three different interval widths: 0.1 kg, 0.3 kg, and 0.5 kg.
# Read the data into data frame named salmonSizeData

salmonSizeData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02f2_5SalmonBodySize.csv"))
head(salmonSizeData)

# Histograms with different bin widths (0.1, 0.3, and 0.5).

hist(salmonSizeData$massKg, right = FALSE, breaks = seq(1,4,by=0.1), col = "firebrick")
hist(salmonSizeData$massKg, right = FALSE, breaks = seq(1,4,by=0.3), col = "firebrick")
hist(salmonSizeData$massKg, right = FALSE, breaks = seq(1,4,by=0.5), col = "firebrick")

# ------------------------------------------------------------

# Example 2.3A. <a href="../wp-content/data/chapter02/chap02e3aBirdMalaria.csv">Bird malaria
# Contingency table, grouped bar plot, and mosaic plot showing the association between egg removal treatment and incidence of malaria in female great tits. 
# Read the data from the data file and inspect.

birdMalariaData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3aBirdMalaria.csv"))
head(birdMalariaData)

# Optional step: Set the desired order of treatment categories in tables and graphs. The factor command allows us to order the levels so that the category "Egg removal" comes before "Control" in tables and graphs (categories are otherwise ordered alphabetically).

birdMalariaData$treatment <- factor(birdMalariaData$treatment, 
	levels= c("Egg removal", "Control"))

# Create a contingency table. Use table with the names of two categorical variables as arguments, beginning with the response variable.

birdMalariaTable <- table(birdMalariaData$response, birdMalariaData$treatment)
birdMalariaTable

# Include row and column sums in the contingency table.

addmargins(birdMalariaTable, margin = c(1,2), FUN = sum, quiet = TRUE)

# Draw a grouped bar graph using the contingency table.

barplot(as.matrix(birdMalariaTable), beside = TRUE)

# Commands to produce a grouped bar graph with more options are shown here.

# Grouped bar graph with options
barplot(as.matrix(birdMalariaTable), beside = TRUE, space = c(0.1, 0.3),
	las = 1, xlab = "Treatment", ylab = "Frequency",
	col = c("firebrick", "goldenrod1"), legend.text = rownames(birdMalariaTable), 
	args.legend = list(x = 0.3, y = max(birdMalariaTable), xjust = 0))

# Draw a mosaic plot. The "t" command flips (transposes) the table to ensure that the explanatory variable is along the horizontal axis. 

mosaicplot( t(birdMalariaTable), col = c("firebrick", "goldenrod1"), 
	sub = "Treatment", ylab = "Relative frequency", 
	cex.axis = 1.1, main = "")

# ------------------------------------------------------------

# Example 2.3B. <a href="../wp-content/data/chapter02/chap02e3bGuppyFatherSonAttractiveness.csv">Guppy father and son comparison
# Scatter plot of the relationship between the ornamentation of male guppies and the average attractiveness of their sons.
# Read the data from the file.

guppyFatherSonData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3bGuppyFatherSonAttractiveness.csv"))
head(guppyFatherSonData)

# Draw a scatter plot using the formula approach (with the "~").

plot(sonAttractiveness ~ fatherOrnamentation, data = guppyFatherSonData)

# See here for commands to draw a fancier scatter plot like that in Figure 2.3-3.

# Scatter plot with options
plot(sonAttractiveness ~ fatherOrnamentation, data = guppyFatherSonData, 
	las = 1, pch = 16, col = "firebrick", cex = 1.5, bty = "l", 
	xlab = "Father's ornamentation", ylab = "Son's attractiveness")

# ------------------------------------------------------------

# Example 2.3C. <a href="../wp-content/data/chapter02/chap02e3cHumanHemoglobinElevation.csv">Human hemoglobin and elevation
# Strip chart, box plot, and multiple histograms showing hemoglobin concentration in men living at high altitude in three different parts of the world and in a sea level population (USA). 
# Read the data.

hemoglobinData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3cHumanHemoglobinElevation.csv"))
head(hemoglobinData)

# Obtain the sample sizes in each of the four populations

table(hemoglobinData$population)

# Draw a strip chart of the hemoglobin data.

stripchart(hemoglobin ~ population, data = hemoglobinData, method = "jitter",
    vertical = TRUE)

# Commands for a fancier strip chart like that shown in Figure 2.3-4 are here.

par(bty = "l")
stripchart(hemoglobin ~ population, data = hemoglobinData, 
	vertical = TRUE, method = "jitter", jitter = 0.2, pch = 1, col = "firebrick",
	las = 1, xlab = "Male population", ylab = "Hemoglobin concentration (g/dL)")

# Draw a box plot, relating hemoglobin to population. 

boxplot(hemoglobin ~ population, data = hemoglobinData)

# A box plot with more options, like that in Figure 2.3-4, is shown here.

par(bty = "l")
boxplot(hemoglobin ~ population, data = hemoglobinData,
	col = "goldenrod1", boxwex = 0.5, whisklty = 1, outcol = "black", 
	outcex = 1, outlty = "blank", las = 1, 
	xlab="Male population", ylab = "Hemoglobin concentration (g/dL)")

# Show the association between hemoglobin and population using the multiple histograms approach (Figure 2.3-5). The following commands use the lattice package, which must first be loaded.

library(lattice)
histogram(~ hemoglobin | population, data = hemoglobinData,
	layout = c(1,4), col = "firebrick", breaks = seq(10,26,by=1))

# Here we show commands to draw the multiple histograms in basic R, without using the lattice package. This approach is more tedious, but the resulting graphs are often easier to modify.

# Multiple histograms using base graphics, plotting them one at a time.
# The "oma" option adjusts the outer margins of the whole figure
# The "mar" option tweaks the margins within each of the 4 plots.
oldpar = par(no.readonly = TRUE) # make backup of default graph settings
par(mfrow = c(4,1), oma = c(4, 6, 2, 6), mar = c(2, 5, 4, 2))
hist(hemoglobinData$hemoglobin[hemoglobinData$population == "Andes"],
	col = "firebrick", las = 1, main = "Andes",  
	breaks = seq(10,26,by=1), ylab = "Frequency")
hist(hemoglobinData$hemoglobin[hemoglobinData$population == "Ethiopia"],
	col = "firebrick", las = 1, main = "Ethiopia",  
	breaks = seq(10,26,by=1), ylab = "Frequency")
hist(hemoglobinData$hemoglobin[hemoglobinData$population == "Tibet"],
	col = "firebrick", las = 1, main = "Tibet",  
	breaks = seq(10,26,by=1), ylab = "Frequency")
hist(hemoglobinData$hemoglobin[hemoglobinData$population == "USA"],
	col = "firebrick", las = 1, main = "USA",  
	breaks = seq(10,26,by=1), ylab = "Frequency")
mtext("Hemoglobin concentration (g/dL)", side = 1, outer = TRUE, padj = 1.5)
par(oldpar) # revert to default graph settings

# ------------------------------------------------------------

# Example 2.4A. <a href="../wp-content/data/chapter02/chap02e4aMeaslesOutbreaks.csv">Measles outbreaks
# Line graph showing confirmed cases of measles in England and Wales from 1995 to 2011. Annual counts are quarterly.
# Read the data from file.

measlesData <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e4aMeaslesOutbreaks.csv"))
head(measlesData)

# Drawing a line graph uses the same command as a scatter plot but adds the type = "l" argument to draw a line graph instead.

plot(confirmedCases ~ yearByQuarter, data = measlesData, type="l") 

# Commands to draw a fancier line plot (like that in Figure 2.4-1) are shown here.

# Line plot with options
plot(confirmedCases ~ yearByQuarter, data = measlesData, 
	type = "l", las = 1, lwd = 1, bty = "l", xlab = "Year",
	ylab = "Number of cases", xaxp = c(1995,2012,2012-1995))
points(confirmedCases ~ yearByQuarter, data = measlesData, pch = 16, 
	col = "firebrick", cex = 0.7)


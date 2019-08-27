# Biostatistics (BIO 0132) recitation

The initial commit of this repository were the final materials used for the Fall 2018 semester of Biostatistics, a course offered through the biology department at Tufts University.  This was the third semester I had been a TA for the course.  The first semester, the course used SPSS for data analysis and the recitation was offered as optional and mostly an open office hours for help troubleshooting SPSS issues.  The second semester I taught, we made the switch to R.  I migrated course materials including worksheets and homeworks to use R Notebooks.  These materials are in a [separate repository](https://github.com/Aariq/biostats-recitation).  I co-taught a required recitation section with Natalie Kerr, for which we created all the course materials. The primary goal of the recitation was to give students the tools they needed to complete weekly problem sets and reinforce lecture concepts.

The following year (this repo) I co-taught the course with Avalon Owens and we took a tidyverse-centric approach to introducing students to R.  Students were required to install R and RStudio as well as go through the DataCamp [Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) course before the first recitation.

Feel free to fork and edit to use for your own course. If you notice mistakes or have suggestions for improvement, please file an issue.


## Update 2019-08-27

The R ecosystem moves fast, so here are some things I've learned about that might be helpful in modifying this repo:

- RStudio can now knit to Powerpoint by default! You might be able to just change the YAML of the current ioslides presentations and make powerpoints with no problem, but I can't guarantee that.  You can also supply a template .ppt file and R will use it to format your slides when you knit.  More info: https://support.rstudio.com/hc/en-us/articles/360004672913-Rendering-PowerPoint-Presentations-with-RStudio

- Code highlighting!  One thing Avalon and I struggled with, was a way to color-code bits of R code.  When students are new to coding, it's difficult to tell which bits they can edit (e.g. object names, axis labels) and which bits they can't (e.g. function names, argument names).  Color coding might help with that.  You can now do this pretty easily in R Markdown with the [demoR package](https://web.calpoly.edu/~kbodwin/demoR/articles/demoR.html)!  You might also be able to just format the text after knitting to powerpoint.

- This really amazing way of explaining RStudio panes from [@RLadiesNCL](https://twitter.com/RLadiesNCL/status/1138812826917724160):
![](https://pbs.twimg.com/media/D83d2-dW4AULriR?format=jpg&name=medium)

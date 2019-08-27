# Biostatistics (BIO 0132) recitation

The initial commit of this repository were the final materials used for the Fall 2018 semester of Biostatistics, a course offered through the biology department at Tufts University.  This was the third semester I had been a TA for the course.  The first semester, the course used SPSS for data analysis and the recitation was offered as optional and mostly an open office hours for help troubleshooting SPSS issues.  The second semester I taught, we made the switch to R.  I migrated course materials including worksheets and homeworks to use R Notebooks.  These materials are in a [separate repository](https://github.com/Aariq/biostats-recitation).  I co-taught a required recitation section with Natalie Kerr, for which we created all the course materials. The primary goal of the recitation was to give students the tools they needed to complete weekly problem sets and reinforce lecture concepts.

The following year (this repo) I co-taught the course with Avalon Owens and we took a tidyverse-centric approach to introducing students to R.  Students were required to install R and RStudio as well as go through the DataCamp [Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) course before the first recitation.

Feel free to fork and edit to use for your own course. If you notice mistakes or have suggestions for improvement, please file an issue.


## Update 2019-08-27

The R ecosystem moves fast, so here are some things I've learned about that might be helpful in modifying this repo:

- RStudio can now knit to Powerpoint by default! You might be able to just change the YAML of the current ioslides presentations and make powerpoints with no problem, but I can't guarantee that.  You can also supply a template .ppt file and R will use it to format your slides when you knit.  More info: https://support.rstudio.com/hc/en-us/articles/360004672913-Rendering-PowerPoint-Presentations-with-RStudio

- Code highlighting!  One thing Avalon and I struggled with, was a way to color-code bits of R code.  When students are new to coding, it's difficult to tell which bits they can edit (e.g. object names, axis labels) and which bits they can't (e.g. function names, argument names).  Color coding might help with that.  You can now do this pretty easily in R Markdown with the [demoR package](https://web.calpoly.edu/~kbodwin/demoR/articles/demoR.html)!  You might also be able to just format the text after knitting to powerpoint.

- This really amazing way of explaining RStudio panes:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Are you new to R and <a href="https://twitter.com/rstudio?ref_src=twsrc%5Etfw">@rstudio</a>? Check out this amazing analogy by one of our organisers, <a href="https://twitter.com/JKRWard?ref_src=twsrc%5Etfw">@JKRWard</a> - linking the different windows to cooking<br>📜🥔🥦🥚🍳➡️🍲<a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a> <a href="https://twitter.com/hashtag/rladies?src=hash&amp;ref_src=twsrc%5Etfw">#rladies</a> <a href="https://twitter.com/hashtag/pastryRchy?src=hash&amp;ref_src=twsrc%5Etfw">#pastryRchy</a> <a href="https://t.co/8NAQPnUI7v">pic.twitter.com/8NAQPnUI7v</a></p>&mdash; R-Ladies Newcastle (@RLadiesNCL) <a href="https://twitter.com/RLadiesNCL/status/1138812826917724160?ref_src=twsrc%5Etfw">June 12, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
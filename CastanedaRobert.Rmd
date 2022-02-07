---
author: "Robert Castaneda"
title: "Plyr: Blog 3"
layout: post
topic: "03"
short-topic: Split-Apply-Combine Paradigm
due-date: 2022-02-10
root: ../../
output: github_document
---

## Prompt:

The `plyr` package has by now been replaced by other, even faster packages, but the idea of *Split, apply, combine* is as relevant as ever.

Read the paper [The Split-Apply-Combine Strategy for Data Analysis](https://www.jstatsoft.org/article/view/v040i01) by Hadley Wickham.


Write a blog post addressing the following questions: 

1. **The R code for the split-apply-combine paper is posted with the paper. Pick one of the examples demonstrating `plyr` functionality (such as dlply or ddply, ...) and rewrite the example using functionality from the package `dplyr`. Make sure that your example actually works.**

2. **Which (base R) functions do you know that support the split-apply-combine strategy? In your opinion, are these sufficient? State why or why not?**. 


3. **In 50 to 100 words describe the split-apply-combine paradigm.**
 

Submit to your repo. Make sure that all of the github actions pass (check menu item Actions - all of the actions should have green checks)


I picked the following example from the paper:
baseball <- baseball
baseball_n <- ddply(baseball, .(id), transform, 
  cyear = year - min(year) + 1)
  
This code essentially just adds a new column specifying what year in their career it is for each player. I accomplished this same goal using the 'dplyr' package:
baseball %>%
  group_by(id) %>%
  mutate(cyear = year - min(year) + 1) %>%
  arrange(id)
  
The apply function, and its associated functions such as sapply and lapply, all use the split-apply-combine paradigm. I personally think these functions are very efficient and are extremely intuitive to use. 

The split-apply-combine paradigm is a useful way to think about data analysis, and specifically data cleaning and transforming. In today's world we work with such massive tables of data that performing any transformations or functions on certain variables can be tedious and take up a lot of processing power. This paradigm just describes 3 simple steps to help simplify what we want to do, while also being extremely effective. Instead of applying transformations or certain data analysis methods to a massive dataframe, we can split this table up into smaller pieces that are easier to work with. Then we just apply whatever transformation/analysis we would like to do on each piece individually, and finally we just put those results all back together. 

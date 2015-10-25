---
title       : UFC Fighters Explorer
subtitle    : Developing Data Products - Coursera - October 2015
author      : October 2015
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Introduction

This application analyzes current and recently retired UFC fighters, and has for the objective to assess which one have been the 
most successful. 

For those who are not familiar with it UFC stands for Ultimate Fighting Championship, which is the largest MMA promotion company in the world, featuring most of the top-ranked fighters in the sport. 

Likewise, MMA stands for mixed martial arts, and is a full-contact combat sport that allows the use of both striking and grappling techniques, both standing and on the ground, from a variety of other combat sports and martial arts.

In order to run this analysis, I considered the following variables:
- Gender
- Country
- Career Win percentage
- Career Earnings

--- .class #id

## Additional Information

The UFC currently uses ten different weight classes, 2 for women and 8 for men
Current champions of each weight class are indicated below:


 Weight Class Name  | Lower limit (Lb.) | Upper limit (Lb.) | Current Champion                                  |
 ------------------ | ----------------- | ----------------- | ------------------------------------------------- | 
 Strawweight        |                   | 115               | Joanna Jedrzejczyk (W-POL)                        | 
 Flyweight          | 115               | 125               | Ronda Rousey (W-USA) / Demetrious Johnson (M-USA) |
 Bantamweight       | 125               | 135               | T.J. Dillashaw (USA)                              |
 Featherweight      | 135               | 145               | Jose Aldo (BRA)                                   |
 Lightweight        | 145               | 155               | Rafael dos Anjos (BRA)                            | 
 Welterweight       | 155               | 170               | Robbie Lawler (USA)                               |
 Middleweight       | 170               | 185               | Chris Weidman (USA)                               |
 Light Heavyweight  | 185               | 205               | Daniel Cormier (USA)                              |
 Heavyweight        | 205               | 265               | Fabricio Werdum (BRA) (USA)                       |


--- .class #id

## Data Sources

This data his data has been extracted from [Wikipedia](https://en.wikipedia.org/wiki/List_of_current_UFC_fighters), hence the fighter list used in this analysis may not be the most up-to-date

Likewise, UFC Fighters career earnings have been extracted from [MMA Manifesto](http://mma-manifesto.com/ufc-fighter-salary-database/salary-main/ufc-career-fighter-earnings.html), as of October 2015
    

Prior to be loaded in R, this data has been compiled an aggregated in a .csv file, some light cleansing has been performed in order to facilitate the shiny app development

Cleansing including removing special characters such as '*', '+', or accents in names, and breaking down each fighter's record to facilitate our analysis in R: from something like 20-5-1 to 20 Wins, 5 losses and 1 draw



--- .class #id  

## Data Summary

As mentioned, the data is made available in a comma-separated-value (.csv) file
```r
UFCDataAll <- read.csv("UFC.csv")
summary(UFCDataAll)
```

```
##        ID           Gender           WeightClass     Country   
##  Min.   :  1.0   Female: 56   Welterweight :102   USA    :236  
##  1st Qu.:134.8   Male  :480   Lightweight  : 92   BRA    : 96  
##  Median :268.5                Bantamweight : 86   Other  : 59  
##  Mean   :268.5                Featherweight: 68   CAN    : 23  
##  3rd Qu.:402.2                Middleweight : 54   GBR    : 22  
##  Max.   :536.0                Flyweight    : 35   RUS    : 22  
##                               (Other)      : 99   (Other): 78  

```

--- .class #id

## How to explore the data?

In order to identify the most successful fighters, most common criteria include Career Earnings (in thousands of US$) and Career Win Percentage, but also of course, who is the current champion in each Weight Class

This data set can be filter by Gender (first radio button), Country (second drop-down list), min./max. Career Win Percentage (first slider) or min. Career Earnings (second slider)


Only countries with at least 5 active or retired fighters were kept in the list, the item 'Others', include fighters from all other countries. Fighters' names and nicknames are available when hovering on the plot


Enjoy!

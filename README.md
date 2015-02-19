---
title: "Opinion miner"
author: "Matteo"
date: "Thursday, February 15, 2015"
output: html_document
---

### Opinion Miner

Social media has become the barometer of customers sentiments and the current ease of access to data and metadata coupled with proper tools and technology can give companies that want leverage it an unprecedented understanding of their customers and their behavior. 

Tracking public opinion towards a company or a product can be easily automated and reported by parsing a plethora of available sources. Obtaining company's names and their product from Wikipedia it is quite simple by querying the publicly available API, and opens a wide range of possibilities. Parsing social media posts obtained via API from several websites, can yield a database to be mined for opinion over a range of variables (time, product, customer profile and metadata) and associated with major company events (new product, updates, dividend declarations, etc.) 

## Objectives
The main objective is to create an infrastructure that can easily and automatically cross reference data and metadata to discover quantitative and qualitative trends. Finding correlations between meaningfully matching variable, such as age, sex, geographic location, with mentions of the object of interest, a product (iPhone), a company (Apple), an announcement (Apple to make an electric car), etc., can dramatically improve a company's decision making process. Another example can be creating a platform that can match the appearance pattern of keywords to future events, such when the word "Apple" appears n times in the tweets and Facebook posts of influencers, shares of Apple's suppliers increases.     

## Methods
While using Natural Language processing is probably the ultimate goal, initially it would be easy to implement simple statistics like means, counts, medians, applications of Central Limit Theorem, conditional probability, etc., to create exploratory feasibility analyses. 
Data is freely available from many prominent websites and simple scripts can be used to harvest them automatically in R. 
R is currently considered one of the standard languages in Data Science and its ease of use with medium to big databases makes it a valid option for this kind of project. 


## Customers
Companies that want to acquire preliminary analyses:
- to understand general trends and base product development strategy (company A added a feature to their current product and only the small geographical area has mentioned it. When rewording the same announcement 2 weeks later company A received nation-wide reaction)
- tune corporate communication to maximize the desired effect (ex. last time that company A made a similar announcement the general reaction came from female, aged 30-45, living in the north east)

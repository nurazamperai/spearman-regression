* Contents:		Spearman correlation
* file name:	
* version:		6
* created:		14/6/2019
* author:		Nur Azam Perai
* STATA:		15
* modified:		30/07/2019, 10/10/2019


//--------------------------------------------------------------------------\\

* chapter 8

clear all

use "...\MalaysiaData_20190820_v8.dta"

describe
sum
codebook, compact

* 10/10/2019:
* amend label for identification

label variable govhosbed "Number of government hospital beds"
label variable pvthosbed "Number of private hospital beds"

label variable govprimsch "Number of government primary schools"
label variable govsecsch  "Number of government secondary schools"


ssc install spearman2

* 8.4.1 Spearman correlation - 1) registered orgs & citizen population, 2) registered orgs & population density
spearman2 regorgs citizenpop popdens, stats(rho obs p) matrix
* regorgs/pop = .8118, p=.0001
* regorgs/dens = .0441, p=.8711

* 8.4.2 Spearman - 1) registered orgs & economic development (gdpcap), 2) registered orgs & wealth (median inc)
spearman2 regorgs gdpcap medinc, stats(rho obs p) matrix
* regorgs/econdev = .3214, p=.2427
* regorgs/wealth = .2750, p=.3212

* 8.4.3 ethnic organisations & % indigenious pop, 
spearman2 permalaybumi ethnicorg10000, stats(rho obs p) matrix
* -0.7529, p=.0008

* 8.4.4 religious ors & % muslim pop
spearman2 percentmuslim religorg10000, stats(rho obs p) matrix
* -0.5206, p=0.0387

* strength of r/ship percent of malay pop & ethnic orgs per 10000 - to see if malay majority states have more or less no of orgs - percent of pop more appropriate to measure against org per 10000 instead of absolute org numbers            

* chart 8-9:
scatter permalaybumi icnpo7400, saving(mal)
scatter percentmuslim icnpogrp10, saving(mus)
gr combine mus.gph mal.gph  





* for explanation on spearman2 = https://ideas.repec.org/c/boc/bocode/s454301.html


clear
use "\\dochart\users\nbp1\Desktop\MalaysiaData_20190820_v8.dta"
desc

* gdpcap = economic development
* medinc = wealth

** modified on 22/8/2019

* var percentmalaybumi changed to permalaybumi in MalaysiaData_20190820_v8.dta

desc religorg10000 ethnicorg10000 permalaybumi percentmuslim medinc gdpcap
sum religorg10000 ethnicorg10000 permalaybumi percentmuslim medinc gdpcap

* A multiple linear regression was conducted to predict number of registered ethnic organisations in a given State based on its population wealth and percentage of its different ethnic population.

* descriptive stats
asdoc sum religorg10000 ethnicorg10000 permalaybumi perchinese perindian medinc gdpcap

corr gdpcap medinc
* .88 = multicollinearity?!
pwcorr icnpo7400 permalaybumi perchinese perindian medinc, star(0.05) sig



* gdpcap dropped - high corr with medinc, choose medinc as measure of wealth <=> econ dev
regress icnpo7400 medinc permalaybumi 
asdoc regress icnpo7400 medinc permalaybumi 



regress icnpogrp10 medinc percentmuslim
asdoc regress icnpogrp10 medinc percentmuslim
* 1% increase in malaybumi pop = eth orgs reduce by 796, statistically significant




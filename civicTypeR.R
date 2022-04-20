library(tidyverse)
library(rvest)
library(janitor) 
library(dplyr)
R_url = "https://www.ebay.com/sch/Cars-Trucks/6001/i.html?_from=R40&_nkw=honda+civic+type+r+&LH_PrefLoc=1&LH_BO=1&rt=nc&LH_Sold=1&LH_Complete=1&UF_single_selection=Make%3AHonda%2CModel%3ACivic&UF_context=finderType%3AVEHICLE_FINDER&_sacat=6001&_stpos=01810&_fspt=1&_sadis=1000&Model%2520Year=2017%7C2018%7C2019%7C2020%7C2021%7C2022"
page<-read_html(R_url)
 

date = page %>% html_nodes(".s-item__title--tag div") %>% html_text() 
price = page %>% html_nodes(".s-item__price span") %>% html_text() 
 

FK8<-data.frame(price,date)
CTR<-FK8[-c(3,4,5,6),] 


write_csv(CTR,paste0('data/',Sys.Date(),'_Civic_Type_R','.csv')) 

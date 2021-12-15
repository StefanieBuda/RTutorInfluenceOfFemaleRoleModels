# data preparation

library(haven)
library(tidyverse)
library(forcats)


# Read original data
dat <- read_dta("PorterSerraAEJ.dta")


# Create data set used in exercise 1
dat <- dat %>% 
  rename(id = anonid,
         treat2015 = treatment_class,
         year2016 = yr_2016,
         took_intermediate = took_year,
         took_another = tookanother,
         num_econclass = numeconclass,
         econ_major = econmajor,
         class_cluster = class_fe2,
         grade_principles = gradePrinciples) %>%
  select(id, year2016, treat2015, treat2016, female, took_intermediate, took_another, num_econclass, econ_major, class_cluster,
         female_prof, instate, freshman, american, ACumGPA, grade_principles, small_class, 
         Major_STEM, Major_Finance, Major_Business, Major_Marketing, Major_SocSc, Major_Arts, Major_Comm, Major_Hum)


write_dta(dat, file.path(getwd(), "FemaleRoleModels.dta"))



## Save "data_complete"
data_complete <- dat %>%
  mutate(group = case_when( (year2016 == 0 & treat2015 == 0) ~ "control15",
                            (year2016 == 0 & treat2015 == 1) ~ "treatment15",
                            (year2016 == 1 & treat2016 == 0) ~ "control16",
                            (year2016 == 1 & treat2016 == 1) ~ "treatment16"),
         group = as.factor(group)
  )

data_complete$group <- fct_relevel(data_complete$group, c("control15", "treatment15", "control16", "treatment16"))

save(data_complete, file = "FemaleRoleModels_data_complete")



## Save "data"
data <- data_complete %>% filter(female == 1)

save(data, file = "FemaleRoleModels_data")



## Save "table_inter"
table_inter <- data %>% 
  group_by(group) %>% 
  count(took_intermediate) %>% 
  mutate(prop = n/sum(n)) %>% 
  filter(took_intermediate == 1) %>%
  ungroup() %>%
  select(group, prop)

save(table_inter, file = "FemaleRoleModels_table_inter")



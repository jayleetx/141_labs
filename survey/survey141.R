# download survey responses from 141 google form

library(readr)

survey <- read_csv("survey/Math 141 Survey.csv", skip = 2, col_names = FALSE) %>% select(4:36)
questions <- c("social", "economic", "diet", "college_app", "reedie_social", "reedie_economic", 
               "study", "year", "commons", "transportation", "division", "tradition", "awkward", "technology", 
               "historian", "alcohol", "reedie_alcohol", "marijuana", "reedie_marijuana", "social_media", 
               "coffee_tea", "computer", "season", "thai", "ac", "hogwarts", "beach_mountain", "donut", 
               "first_kiss", "meme", "dog_pants", "hot_dog", "duck_horse")
colnames(survey) <- questions

write_csv(survey, path = "survey/survey141.csv")

survey_ez_plot <- survey %>% mutate(alcohol = as.numeric(alcohol),
                                    reedie_alcohol = as.numeric(reedie_alcohol),
                                    marijuana = as.numeric(marijuana),
                                    reedie_marijuana = as.numeric(reedie_marijuana),
                                    first_kiss = as.numeric(first_kiss))

# none of this factor stuff is retained after the write/read

survey_ez_plot$awkward <- factor(survey_ez_plot$awkward, levels = c("Don't know",
                                                                    "Strongly disagree",
                                                                    "Disagree",
                                                                    "Neutral",
                                                                    "Agree",
                                                                    "Strongly agree"))

survey_ez_plot$technology <- factor(survey_ez_plot$technology, levels = c("Don't know",
                                                                          "Strongly disagree",
                                                                          "Disagree",
                                                                          "Neutral",
                                                                          "Agree",
                                                                          "Strongly agree"))

write_csv(survey_ez_plot, path = "survey/survey_ez_plot.csv")

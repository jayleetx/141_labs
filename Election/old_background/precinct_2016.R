library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

raw_states <- c("FL","MD", "NC", "OR", "VA")
states <- c("AR", "CT", "FL", "IL", "KY", "MD",# "MO",
            "NC", "NM", "OR", "SC", "TN", "UT", "VA")
for (x in states) {
  if (x %in% raw_states) {
    assign(x,  read_csv(paste0("https://raw.githubusercontent.com/openelections/openelections-results-",
                               tolower(x),
                               "/master/raw/20161108__",
                               tolower(x),
                               "__general__precinct__raw.csv")) %>%
      filter(str_detect(office, coll("President", ignore_case = TRUE)),
             str_detect(name_raw, coll("trump", ignore_case = TRUE)) |
               str_detect(name_raw, coll("clinton", ignore_case = TRUE)) |
               str_detect(last_name, coll("trump", ignore_case = TRUE)) |
               str_detect(last_name, coll("clinton", ignore_case = TRUE))) %>%
      select(parent_jurisdiction, jurisdiction, party, votes) %>%
      mutate(digit = as.numeric(str_sub(as.character(votes), 1, 1)),
             state = x)# %>%
           #  filter(digit != 0)
    )
  }
  
  else {
    assign(x,  read_csv(paste0("https://raw.githubusercontent.com/openelections/openelections-data-",
                               tolower(x),
                               "/master/2016/20161108__",
                               tolower(x),
                               "__general__precinct.csv")) %>%
             filter(str_detect(office, coll("President", ignore_case = TRUE)),
                    str_detect(candidate, coll("trump", ignore_case = TRUE)) |
                      str_detect(candidate, coll("clinton", ignore_case = TRUE))) %>%
             select(one_of("county", "district", "town", "precinct", "candidate", "party", "votes")) %>%
             mutate(digit = as.numeric(str_sub(as.character(votes), 1, 1)),
                    state = x)# %>%
           #  filter(digit != 0)
    )
  }
}





ggplot(OR, aes(x = digit, color = party)) +
  geom_density() +
  scale_color_manual(values=c("blue", "red")) +
  labs(title = "OR Density Plot- 2016")

ggplot(OR, aes(x = digit, fill = party, color = party)) +
  geom_bar(position = "dodge") +
  scale_color_manual(values=c("blue", "red")) +
  scale_fill_manual(values=c("blue", "red")) +
  labs(title = "OR Bar Chart- 2016")
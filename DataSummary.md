Data
================
Jay Lee
5/22/2017

Below each code output are the variables explicitly used in the exercises.

Introduction to Data
--------------------

### High school and beyond survey

Mentioned as an example in videos, not used in analysis. From `openintro` package.

``` r
data(hsb2)
colnames(hsb2)
```

    ##  [1] "id"      "gender"  "race"    "ses"     "schtyp"  "prog"    "read"   
    ##  [8] "write"   "math"    "science" "socst"

### Emails

From `openintro` package.

``` r
data(email50)
colnames(email50)
```

    ##  [1] "spam"         "to_multiple"  "from"         "cc"          
    ##  [5] "sent_email"   "time"         "image"        "attach"      
    ##  [9] "dollar"       "winner"       "inherit"      "viagra"      
    ## [13] "password"     "num_char"     "line_breaks"  "format"      
    ## [17] "re_subj"      "exclaim_subj" "urgent_subj"  "exclaim_mess"
    ## [21] "number"

`number`, `num_char`, `exclaim_mess`, `spam`

### Gapminder

From `gapminder` package.

``` r
data(gapminder)
colnames(gapminder)
```

    ## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

### Berkeley grad school admissions

Transformed from `UCBAdmissions` in `datasets`.

``` r
data(UCBAdmissions)
ucb_admit <- as.data.frame(UCBAdmissions)
ucb_admit <- transform(ucb_admit[rep(1:nrow(ucb_admit), ucb_admit$Freq),-4])
colnames(ucb_admit)
```

    ## [1] "Admit"  "Gender" "Dept"

All variables used.

### County info

Mentioned as an example in videos, not used in analysis. From `openintro` package.

``` r
data(county)
colnames(county)
```

    ##  [1] "name"          "state"         "pop2000"       "pop2010"      
    ##  [5] "fed_spend"     "poverty"       "homeownership" "multiunit"    
    ##  [9] "income"        "med_income"

`name`, `state`

### US Regions

Transformed from `state` in `datasets`.

``` r
us_regions <- cbind(as.data.frame(state.name),
                    as.data.frame(state.region)) %>%
  transmute(state = state.name,
            region = fct_recode(state.region, "Midwest" = "North Central"))
colnames(us_regions)
```

    ## [1] "state"  "region"

All variables used.

### UT Austin course evals

From `oilabs` package.

``` r
data(evals)
colnames(evals)
```

    ##  [1] "score"         "rank"          "ethnicity"     "gender"       
    ##  [5] "language"      "age"           "cls_perc_eval" "cls_did_eval" 
    ##  [9] "cls_students"  "cls_level"     "cls_profs"     "cls_credits"  
    ## [13] "bty_f1lower"   "bty_f1upper"   "bty_f2upper"   "bty_m1lower"  
    ## [17] "bty_m1upper"   "bty_m2upper"   "bty_avg"       "pic_outfit"   
    ## [21] "pic_color"

`score`, `rank`, `ethnicity`, `gender`, `language`, `age`, `cls_students`, `cls_level`, `cls_profs`, `cls_credits`, `bty_avg`, `pic_outfit`, `pic_color`

Exploratory Data Analysis
-------------------------

### Comics dataset

Adapted from [FiveThirtyEight](https://github.com/fivethirtyeight/data/tree/master/comic-characters)'s data.

Full variable list: "name", "id", "align", "eye", "hair", "gender", "gsm", "alive", "appearances", "first\_appear", "publisher"

Variables used: `align`, `id`, `gender`,

### Pie dataset

Only variable is "flavor", used for a pie chart and a bar graph.

### Cars dataset

`cars`

Data source ???

Full variable list: "name", "sports\_car", "suv", "wagon", "minivan", "pickup", "all\_wheel", "rear\_wheel", "msrp", "dealer\_cost", "eng\_size", "ncyl", "horsepwr", "city\_mpg", "hwy\_mpg", "weight", "wheel\_base", "length", "width"

Variables used: `weight`, `hwy_mpg`, `pickup`, `city_mpg`, `suv`, `ncyl`, `eng_size`, `horsepwr`, `msrp`, `width`, `rear_wheel`

### County public health

`life`

Mentioned as an example in videos, not used in analysis.

Data source ???

Full variable list: "state", "county", "expectancy", "income"

Variables used: `expectancy`, `state`

### Gapminder

From `gapminder` package.

``` r
data(gapminder)
colnames(gapminder)
```

    ## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

`continent`, `year`, `lifeExp`, `pop`

### Full email data

From `openintro` package.

``` r
data(email)
colnames(email)
```

    ##  [1] "spam"         "to_multiple"  "from"         "cc"          
    ##  [5] "sent_email"   "time"         "image"        "attach"      
    ##  [9] "dollar"       "winner"       "inherit"      "viagra"      
    ## [13] "password"     "num_char"     "line_breaks"  "format"      
    ## [17] "re_subj"      "exclaim_subj" "urgent_subj"  "exclaim_mess"
    ## [21] "number"

`spam`, `num_char`, `exclaim_mess`, `image`, `attach`, `dollar`, `number`

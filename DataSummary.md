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

`comics`, adapted from [FiveThirtyEight](https://github.com/fivethirtyeight/data/tree/master/comic-characters)'s data.

Full variable list: "name", "id", "align", "eye", "hair", "gender", "gsm", "alive", "appearances", "first\_appear", "publisher"

Variables used: `align`, `id`, `gender`,

### Cars dataset

`cars`, source unknown.

Full variable list: "name", "sports\_car", "suv", "wagon", "minivan", "pickup", "all\_wheel", "rear\_wheel", "msrp", "dealer\_cost", "eng\_size", "ncyl", "horsepwr", "city\_mpg", "hwy\_mpg", "weight", "wheel\_base", "length", "width"

Variables used: `weight`, `hwy_mpg`, `pickup`, `city_mpg`, `suv`, `ncyl`, `eng_size`, `horsepwr`, `msrp`, `width`, `rear_wheel`

### County public health

`life`, source unknown. Mentioned as an example in videos, not used in analysis.

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

Correlation and Regression
--------------------------

### North Carolina birth info

From `openintro` package.

``` r
data(births)
ncbirths <- births
colnames(ncbirths)
```

    ## [1] "fAge"      "mAge"      "weeks"     "premature" "visits"    "gained"   
    ## [7] "weight"    "sexBaby"   "smoke"

`weeks`, `weight`, `mAge`

### Mammals

From `openintro` package.

``` r
data(mammals)
colnames(mammals)
```

    ##  [1] "Species"     "BodyWt"      "BrainWt"     "NonDreaming" "Dreaming"   
    ##  [6] "TotalSleep"  "LifeSpan"    "Gestation"   "Predation"   "Exposure"   
    ## [11] "Danger"

`BodyWt`, `BrainWt`

### 2010 baseball

From `openintro` package.

``` r
data(mlbBat10)
colnames(mlbBat10)
```

    ##  [1] "name"     "team"     "position" "G"        "AB"       "R"       
    ##  [7] "H"        "2B"       "3B"       "HR"       "RBI"      "TB"      
    ## [13] "BB"       "SO"       "SB"       "CS"       "OBP"      "SLG"     
    ## [19] "AVG"

`OBP`, `SLG`, `SB`, `HR`, `AB`

### Body dimensions

From `openintro` package.

``` r
data(bdims)
colnames(bdims)
```

    ##  [1] "bia.di" "bii.di" "bit.di" "che.de" "che.di" "elb.di" "wri.di"
    ##  [8] "kne.di" "ank.di" "sho.gi" "che.gi" "wai.gi" "nav.gi" "hip.gi"
    ## [15] "thi.gi" "bic.gi" "for.gi" "kne.gi" "cal.gi" "ank.gi" "wri.gi"
    ## [22] "age"    "wgt"    "hgt"    "sex"

`hgt`, `wgt`, `sex`

### UK smoking

From `openintro` package.

``` r
data(smoking)
colnames(smoking)
```

    ##  [1] "gender"               "age"                  "maritalStatus"       
    ##  [4] "highestQualification" "nationality"          "ethnicity"           
    ##  [7] "grossIncome"          "region"               "smoke"               
    ## [10] "amtWeekends"          "amtWeekdays"          "type"

`age`, `amtWeekdays`

### Anscombe regression data

Transformed from `anscombe` in `datasets` package

Full variable list: "id", "set", "x", "y"

Variables used: `set`, `x`, `y`

### Noise dataset

`noise`, randomly generated normal values

Full variable list: "x", "y", "z"

Variables used: `x`, `y`

### Galton data

Source unknown, sets of `Galton_men` and `Galton_women` with the same variables

Full variable list: "family", "father", "mother", "sex", "height", "nkids"

Variables used: `height`, `father`, `mother`

### Textbook prices

Mentioned as an example in videos, not used in analysis. From `openintro` package.

``` r
data(textbooks)
colnames(textbooks)
```

    ## [1] "deptAbbr" "course"   "ibsn"     "uclaNew"  "amazNew"  "more"    
    ## [7] "diff"

`amazNew`, `uclaNew`

Foundations of Inference
------------------------

### NHANES

Mentioned as an example in videos, not used in analysis. From `NHANES` package.

``` r
data(NHANES)
colnames(NHANES)
```

    ##  [1] "ID"               "SurveyYr"         "Gender"          
    ##  [4] "Age"              "AgeDecade"        "AgeMonths"       
    ##  [7] "Race1"            "Race3"            "Education"       
    ## [10] "MaritalStatus"    "HHIncome"         "HHIncomeMid"     
    ## [13] "Poverty"          "HomeRooms"        "HomeOwn"         
    ## [16] "Work"             "Weight"           "Length"          
    ## [19] "HeadCirc"         "Height"           "BMI"             
    ## [22] "BMICatUnder20yrs" "BMI_WHO"          "Pulse"           
    ## [25] "BPSysAve"         "BPDiaAve"         "BPSys1"          
    ## [28] "BPDia1"           "BPSys2"           "BPDia2"          
    ## [31] "BPSys3"           "BPDia3"           "Testosterone"    
    ## [34] "DirectChol"       "TotChol"          "UrineVol1"       
    ## [37] "UrineFlow1"       "UrineVol2"        "UrineFlow2"      
    ## [40] "Diabetes"         "DiabetesAge"      "HealthGen"       
    ## [43] "DaysPhysHlthBad"  "DaysMentHlthBad"  "LittleInterest"  
    ## [46] "Depressed"        "nPregnancies"     "nBabies"         
    ## [49] "Age1stBaby"       "SleepHrsNight"    "SleepTrouble"    
    ## [52] "PhysActive"       "PhysActiveDays"   "TVHrsDay"        
    ## [55] "CompHrsDay"       "TVHrsDayChild"    "CompHrsDayChild" 
    ## [58] "Alcohol12PlusYr"  "AlcoholDay"       "AlcoholYear"     
    ## [61] "SmokeNow"         "Smoke100"         "Smoke100n"       
    ## [64] "SmokeAge"         "Marijuana"        "AgeFirstMarij"   
    ## [67] "RegularMarij"     "AgeRegMarij"      "HardDrugs"       
    ## [70] "SexEver"          "SexAge"           "SexNumPartnLife" 
    ## [73] "SexNumPartYear"   "SameSex"          "SexOrientation"  
    ## [76] "PregnantNow"

`Gender`, `HomeOwn`, `SleepHrsNight`, `SleepTrouble`, `HealthGen`

### Gender discrimination

`disc`, source unknown.

Full list of variables: "promote", "sex"

All variables used

### Opportunity cost

`opportunity`, source unknown.

Full list of variables: "decision", "group"

All variables used.

### Polling data

`all_polls`, source unknown.

Full list of variables: "poll", "vote"

All variables used.

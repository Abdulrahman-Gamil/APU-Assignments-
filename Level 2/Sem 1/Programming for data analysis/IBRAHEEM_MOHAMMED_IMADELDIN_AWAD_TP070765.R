install.packages("dplyr")
library(dplyr)
install.packages("plotrix")
library(plotrix)
install.packages ("ggplot2")
library (ggplot2)
install.packages("plotly")
library(plotly)
install.packages("fmsb")
library(fmsb)
install.packages(("gridExtra"))
library(gridExtra)


Dataset_assignmet = read.csv("C:\\Users\\omare\\Downloads\\student_prediction.csv")

Dataset_assignmet<- na.omit(Dataset_assignmet)
Dataset_assignmet<- unique(Dataset_assignmet)

nrow(Dataset_assignmet) 

Dataset_assignmet
View(Dataset_assignmet) 
head(Dataset_assignmet)
head(Dataset_assignmet,10)
tail(Dataset_assignmet)
tail(Dataset_assignmet,10)
names(Dataset_assignmet)
ncol(Dataset_assignmet)
nrow(Dataset_assignmet)
class(Dataset_assignmet)
Dataset_assignmet$SEPAL_LENGTH
min(Dataset_assignmet$SEPAL_LENGTH)
max(Dataset_assignmet$SEPAL_LENGTH)
mean(Dataset_assignmet$SEPAL_LENGTH)
summary(Dataset_assignmet$SEPAL_LENGTH)
summary(Dataset_assignmet)
#factor(Dataset_assignmet$)



Dataset_assignmet$GENDER <- factor(Dataset_assignmet$GENDER,levels=c(1,2),labels=c("female","male"))
Dataset_assignmet$WORK <- factor(Dataset_assignmet$WORK,levels=c(1,2),labels=c("YES","NO"))
Dataset_assignmet$ACTIVITY <- factor(Dataset_assignmet$ACTIVITY,levels=c(1,2),labels=c("YES","NO"))
Dataset_assignmet$SALARY <- factor(Dataset_assignmet$SALARY,levels=c(1,2,3,4,5),labels=c("135$ - 200$","201$ - 270$","271$ - 340$","341$ - 410$"," >= 410$"))
Dataset_assignmet$TRANSPORT <- factor(Dataset_assignmet$TRANSPORT,levels=c(1,2,3,4),labels=c("BUS","PRIVATE CAR/TAXI","BICYCLE","OTHER"))
Dataset_assignmet$GRADE <- factor(Dataset_assignmet$GRADE,levels=c(0,1,2,3,4,5,6,7),labels=c("FAIL","DD","DC","CC","CB","BB","BA","AA"))
Dataset_assignmet$AGE <- factor(Dataset_assignmet$AGE,levels=c(1,2,3),labels=c("18-21","22-25"," >=26"))                                                                                           
Dataset_assignmet$HS_TYPE <- factor(Dataset_assignmet$HS_TYPE,levels=c(1,2,3),labels=c("PRIVATE","STATE","OTHER"))                                                                                 
Dataset_assignmet$SCHOLARSHIP <- factor(Dataset_assignmet$SCHOLARSHIP,levels=c(1,2,3,4,5),labels=c("0%","25%","50%","75%","100%"))                                                                 
Dataset_assignmet$PARTNER <- factor(Dataset_assignmet$PARTNER,levels=c(1,2),labels=c("YES","NO"))                                                                                                  
Dataset_assignmet$LIVING <- factor(Dataset_assignmet$LIVING,levels=c(1,2,3,4),labels=c("RENTAL","DEORMITORY","WITH FAMILY","OTHER"))                                                               
Dataset_assignmet$MOTHER_EDU <- factor(Dataset_assignmet$MOTHER_EDU,levels=c(1,2,3,4,5,6),labels=c("PRIMARY SCHOOL","SECONDARY SCHOOL","HIGH SCHOOL","UNIVERSTIY","MSc.","Bh.d."))                 
Dataset_assignmet$FATHER_EDU <- factor(Dataset_assignmet$FATHER_EDU,levels=c(1,2,3,4,5,6),labels=c("PRIMARY SCHOOL","SECONDARY SCHOOL","HIGH SCHOOL","UNIVERSTIY","MSc.","Bh.d."))                 
Dataset_assignmet$X._SIBLINGS <- factor(Dataset_assignmet$X._SIBLINGS,levels=c(1,2,3,4,5),labels=c("1","2","3","4",">=5"))

# Rename the "kids" column to "Parental status" using names
colnames(Dataset_assignmet)[15] ="Parental_status"

Dataset_assignmet$Parental_status <- factor(Dataset_assignmet$Parental_status,levels=c(1,2,3,4),labels=c("MARRIED","DIVORCED","DIED","ONE OF THEM OR BOTH"))                                                             
Dataset_assignmet$MOTHER_JOB <- factor(Dataset_assignmet$MOTHER_JOB,levels=c(1,2,3,4,5,6),labels=c("RETIRED","HOUSEWIFE","GOVERNMENT OFFICER","PRIVATE SECTOR EMPLOYEE","SELF-EMPLOYMENT","OTHER"))
Dataset_assignmet$FATHER_JOB <- factor(Dataset_assignmet$FATHER_JOB,levels=c(1,2,3,4,5),labels=c("RETIRED","HOUSEWIFE","GOVERNMENT OFFICER","PRIVATE SECTOR EMPLOYEE","OTHER"))                    
Dataset_assignmet$STUDY_HRS<- factor(Dataset_assignmet$STUDY_HRS,levels=c(1,2,3,4,5),labels=c("NONE","<5 HOURS","6-10 HOURS","11-20 HOURS","<20"))                                                 
Dataset_assignmet$READ_FREQ <- factor(Dataset_assignmet$READ_FREQ,levels=c(1,2,3),labels=c("NONE","SOMETIMES","OFTEN"))                                                                            
Dataset_assignmet$READ_FREQ_SCI <- factor(Dataset_assignmet$READ_FREQ_SCI,levels=c(1,2,3),labels=c("NONE","SOMETIMES","OFTEN"))                                                                    
Dataset_assignmet$ATTEND_DEPT <- factor(Dataset_assignmet$ATTEND_DEPT,levels=c(1,2),labels=c("YES","NO"))                                                                                          
Dataset_assignmet$IMPACT <- factor(Dataset_assignmet$IMPACT,levels=c(1,2,3),labels=c("POSITIVE","NEGATIVE","NEUTRAL"))                                                                             
Dataset_assignmet$ATTEND <- factor(Dataset_assignmet$ATTEND,levels=c(1,2,3),labels=c("ALWAYS","SOMETIMES","NEVER"))                                                                                
Dataset_assignmet$PREP_STUDY<- factor(Dataset_assignmet$PREP_STUDY,levels=c(1,2,3),labels=c("ALONE","WITH FRIENDS","NOT APPLICABLE"))                                                              
Dataset_assignmet$PREP_EXAM <- factor(Dataset_assignmet$PREP_EXAM,levels=c(1,2,3),labels=c("CLOSES DATE TO THE EXAM","REGULARLY DURING THE SEM","NEVER"))                                          
Dataset_assignmet$NOTES<- factor(Dataset_assignmet$NOTES,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                                   
Dataset_assignmet$LISTENS <- factor(Dataset_assignmet$LISTENS,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                              
Dataset_assignmet$LIKES_DISCUSS<- factor(Dataset_assignmet$LIKES_DISCUSS,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                   
Dataset_assignmet$CLASSROOM<- factor(Dataset_assignmet$CLASSROOM,levels=c(1,2,3),labels=c("NOT USEFUL","USEFUL","NOT APPLICABLE")) 
Dataset_assignmet$CUML_GPA<- factor(Dataset_assignmet$CUML_GPA,levels=c(1,2,3,4,5),labels=c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49",">3.49"))                                                                   
Dataset_assignmet$EXP_GPA<- factor(Dataset_assignmet$EXP_GPA,levels=c(1,2,3,4,5),labels=c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49",">3.49"))   
View(Dataset_assignmet)

#____________________________________________________________________________________________________________________________


# Plotting for the second objective "impact of regular preparation for the midterms on achieving a higher grade"

# Plot a bar graph for all grades with count numbers
ggplot(Dataset_assignmet, aes(x = GRADE, fill = PREP_EXAM)) +
  geom_bar(position = "dodge") +
  labs(
    title = "STUDENTS AND THEIR STUDYING HABITS",
    x = "Grade",
    y = "Count"
  ) +
  scale_fill_manual(
    values = c(
      "REGULARLY DURING THE SEM" = "lightblue",
      "CLOSES DATE TO THE EXAM" = "royalblue",
      "NEVER" = "darkblue"
    )
  ) +
  theme_minimal()

# Plot a line graph for the impact of EXAM preparation for the midterms on achieving a higher grade

ggplot(Dataset_assignmet, aes(x = GRADE, y = ..count.., color = PREP_EXAM, group = PREP_EXAM)) +
  geom_line(position = position_dodge(width = 0.5), stat = "count") +
  labs(
    title = "Impact of Exam Preparation on All Grades",
    x = "Grade",
    y = "Count"
  ) +
  scale_color_manual(
    values = c(
      "REGULARLY DURING THE SEM" = "purple",
      "CLOSES DATE TO THE EXAM" = "red",
      "NEVER" = "pink"
    )
  ) +
  theme_minimal()


# Calculate count for each GRADE
grade_counts <- table(Dataset_assignmet$GRADE)

# Create a pie chart
plot_ly(
  labels = names(grade_counts),
  values = grade_counts,
  type = "pie",
  marker = list(colors = c("purple", "red", "pink","cyan","yellow","#fdbf6f","#e6e6fa","deeppink")),
  textinfo = "label+percent",
  hoverinfo = "label+percent",
  domain = list(x = c(0, 0.5), y = c(0, 1)),
  showlegend = FALSE
) %>%
  layout(
    title = "PERCENTAGE OF STUDENTS IN EACH GRADE CATEGORY ",
    scene = list(
      aspectmode = "manual",
      aspectratio = list(x = 2, y = 2, z = 0.5)
    )
  )


#BAR GRAPH where the impact of EXAM preparation is shown

# Filter the data set to include only "BA" and "AA" grades and count their occurrences
filtered_data <- Dataset_assignmet %>%
  filter(GRADE %in% c("BA", "AA")) %>%
  group_by(PREP_EXAM, GRADE) %>%
  summarise(count = n())

# Create a grouped bar graph showing the impact of exam preparation on "BA" and "AA" grades with count numbers
ggplot(filtered_data, aes(x = PREP_EXAM, y = count, fill = GRADE)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(
    aes(label = count),
    position = position_dodge(width = 0.9),
    vjust = -0.5,
    size = 3
  ) +
  labs(
    title = "Impact of Exam Preparation on 'BA' and 'AA' Grades",
    x = "Exam Preparation",
    y = "Count"
  ) +
  scale_fill_manual(values = c(
    "BA" = "deeppink",
    "AA" = "yellow"
  )) +
  theme_minimal()

#Finding external factors that contribute in addition to "exam preparation being close to the date of the exam
# on getting AA and BA"
filtered_data <- filter(Dataset_assignmet, GRADE %in% c("AA", "BA"))
View(filtered_data)
nrow(filtered_data)

#Adding the 2 "EXTERNAL FACTOR" columns (Attend and Impact)
filtered_data <- Dataset_assignmet %>% select(GRADE, ATTEND, IMPACT, PREP_EXAM)

# View the filtered data
# Since we cannot actually execute `View` in this environment, you would run this in your R console
View(filtered_data)


# Filter the data set to include only "BA" and "AA" grades and where the impact of preparation is close to the exam date and they always attend.
filtered_data <- Dataset_assignmet %>%
  filter(GRADE %in% c("AA", "BA") & PREP_EXAM == "CLOSES DATE TO THE EXAM" & ATTEND == "ALWAYS") %>%
  select(GRADE, PREP_EXAM, IMPACT, ATTEND)
View(filtered_data)


# After combing through the data set using data filtering method shown above the 2 external factors identified for achieving
# a higher grade (EITHER AA OR BA) are the following columns
# "IMPACT" where the impact on the project is positive and "ATTEND" where the student always attends the lecture.
# although the students were studying closer to the exam their imapct on their projects was always positve and they always
# attended the classes hence their final grade is high.


# Define a blue color palette for grades
blue_palette <- c(
  "FAIL" = "navy",
  "DD" = "mediumblue",
  "DC" = "royalblue",
  "CC" = "dodgerblue",
  "CB" = "deepskyblue",
  "BB" = "lightskyblue",
  "BA" = "lightblue",
  "AA" = "powderblue"
)

# Create the faceted bar chart
ggplot(Dataset_assignmet, aes(x = IMPACT, fill = GRADE)) +
  geom_bar(position = "dodge") +
  facet_grid(PREP_EXAM ~ ATTEND) +
  labs(
    title = "Grade Distribution by Impact, Attendance, and Exam Preparation",
    x = "Impact",
    y = "Count of Students",
    fill = "Grade"
  ) +
  scale_fill_manual(values = blue_palette) +
  theme_minimal()


# Filter the dataset for "BA" and "AA" grades
filtered_dataset <- Dataset_assignmet %>%
  filter(GRADE %in% c("BA", "AA"))

# Define a blue color palette for grades
blue_palette <- c(
  "BA" = "blue",
  "AA" = "red"
)

# Create the faceted bar chart using the filtered dataset
ggplot(filtered_dataset, aes(x = IMPACT, fill = GRADE)) +
  geom_bar(position = position_dodge(width = 0.9), stat = "count") +  # Ensure the count is used
  geom_text(
    aes(label = ..count.., y = ..count..), 
    stat = "count",  # Add stat = "count" for geom_text
    position = position_dodge(width = 0.9), 
    vjust = -0.3,  # Adjust vertical position to be just above the bars
    size = 3
  ) +
  facet_grid(PREP_EXAM ~ ATTEND) +
  labs(
    title = "Grade Distribution by Impact, Attendance, and Exam Preparation for Top Grades",
    x = "Impact",
    y = "Count of Students",
    fill = "Grade"
  ) +
  scale_fill_manual(values = blue_palette) +
  theme_minimal()


#Chi Sqaure Test to find out whether there is a relationship between studying 

Attendace_Table <- table(Dataset_assignmet$GRADE, Dataset_assignmet$PREP_EXAM)
print(Attendace_Table)
# Remove Empty Values ('Never') since it will cause an error in Chi Square Test
Attendace_Table <- Attendace_Table[rowSums(Attendace_Table) > 0, colSums(Attendace_Table) > 0]
chisq.test(Attendace_Table)

#Since the p value is 0.6046, then there is no relationship present between prep_exam and grade. 
#____________________________________________________________________________________________________
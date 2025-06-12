Dataset_assignmet = read.csv("C:\\Users\\moham\\Downloads\\student_prediction.csv")
Dataset_s<- na.omit(Dataset_assignmet)
datasets<- unique(Dataset_assignmet)
View(Dataset_assignmet)
install.packages("plotrix")
library(plotrix)
install.packages("ggplot2")
library(ggplot2)
install.packages("tidyr")
library(tidyr)
install.packages("rgl")
library(rgl)


nrow(Dataset_assignmet[Dataset_assignmet$GENDER == 1,])
nrow(Dataset_assignmet[Dataset_assignmet$GENDER == 2,])


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



New_Sample_Data = Dataset_assignmet[,c(20,25,26,18,33)]
View(New_Sample_Data)
ncol(New_Sample_Data)

    
    
   #---------------------- 1
    
    
    # Filter dataset for all study hours
    filtered_data <- Dataset_assignmet
    
    # Create a grouped bar chart for study hours and grade
    ggplot(filtered_data, aes(x = STUDY_HRS, fill = GRADE)) +
      geom_bar(position = "dodge", width = 0.7) +
      labs(title = "Relationship between Study Hours and Grades",
           x = "Study Hours",
           y = "Number of Students",
           fill = "GRADE") +
      theme_minimal()
   
    
    
    #----------------------------  2
    
    
    # Filter dataset for all study hours and higher grades
    filtered_data <- subset(Dataset_assignmet, GRADE %in% c("BB", "BA", "AA"))
    
    # Create a grouped bar chart for study hours and higher grades
    ggplot(filtered_data, aes(x = STUDY_HRS, fill = GRADE)) +
      geom_bar(position = "dodge", width = 0.7) +
      labs(title = "Relationship between Study Hours and Higher Grades",
           x = "Study Hours",
           y = "Number of Students",
           fill = "GRADE") +
      theme_minimal()
    
    
    
    #------------------------------------- 3

   
    # Filter dataset for study hours from 11 to 20 hours and higher grades
    filtered_data <- subset(Dataset_assignmet, STUDY_HRS == "11-20 HOURS" & GRADE %in% c("BB", "BA", "AA"))
    
    
    ggplot(filtered_data, aes(x = STUDY_HRS, fill = LIVING)) +
      geom_bar(position = "stack", color = "white", alpha = 0.7, stat = "count") +
      facet_grid(. ~ GRADE) +
      labs(title = "Relationship between Study Hours (11-20 hours), Living Situation, and Grade",
           x = "Study Hours",
           y = "Number of Students",
           fill = "Living Situation") +
      theme_minimal()
    
  
    
   
    
  #----------------------------- 4
    
    # Assuming your dataset has columns named "STUDY_HRS," "GRADE," "SCHOLARSHIP," "HS_TYPE," and other relevant variables
    # If your column names are different, please replace them accordingly
    
    # Filter dataset for study hours from 11 to 20 hours and higher grades
    filtered_data <- subset(Dataset_assignmet, STUDY_HRS == "11-20 HOURS" & GRADE %in% c("BB", "BA", "AA"))
    
    # Create a grouped bar chart for study hours (11-20 hours), scholarship, HS type, and higher grades
    ggplot(filtered_data, aes(x = STUDY_HRS, fill = GRADE)) +
      geom_bar(position = "dodge", width = 0.4) +
      geom_text(aes(label = ..count..), stat = "count", position = position_dodge(width = 0.4), vjust = -0.5) +
      facet_grid(SCHOLARSHIP ~ HS_TYPE) +
      labs(title = "Relationship between Study Hours (11-20 hours), Scholarship, HS Type, and Higher Grades",
           x = "Study Hours",
           y = "Number of Students",
           fill = "GRADE") +
      theme_minimal()
    
    
    # Filter dataset for study hours from 11 to 20 hours and higher grades
    filtered_data <- subset(Dataset_assignmet, STUDY_HRS == "11-20 HOURS" & GRADE %in% c("BB", "BA", "AA"))
    
    # Create a grouped bar chart for study hours (11-20 hours), scholarship, HS type, and higher grades
    ggplot(filtered_data, aes(x = STUDY_HRS, fill = GRADE)) +
      geom_bar(position = "dodge", width = 0.4) +
      geom_text(stat = "count", aes(label = ..count..), position = position_dodge(width = 0.4), vjust = -0.5) +
      facet_grid(SCHOLARSHIP ~ HS_TYPE) +
      labs(title = "Relationship between Study Hours (11-20 hours), Scholarship, HS Type, and Higher Grades",
           x = "Study Hours",
           y = "Number of Students",
           fill = "GRADE") +
      theme_minimal()
  
    
    
    
    #--------------------------------------
    
    # Load necessary library
    library(gmodels)  # For CrossTable function
    
    # Assuming 'Studying 11-20 Hours' and 'Higher Grade Achievement' columns exist in Dataset_assignmet
    
    # Create a contingency table between 'STUDY HOURS' and 'Higher Grade Achievement'
    contingency_table <- table(Dataset_assignmet$STUDY_HRS, Dataset_assignmet$GRADE)
    
    # Perform Chi-square test of independence
    chi_sq_test <- chisq.test(contingency_table)
    
    # Display the contingency table
    print(CrossTable(Dataset_assignmet$STUDY_HRS, Dataset_assignmet$GRADE))
    
    # Display the result of the Chi-square test
    print(chi_sq_test)
    
  
  

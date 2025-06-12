install.packages("plotrix")
library(plotrix)

install.packages("ggplot2")
library(ggplot2)

install.packages("dplyr")
library(dplyr)

Dataset_assignmet= read.csv("/Users/aboodkaf/Downloads/student_prediction.csv")
Dataset_s<- na.omit(Dataset_assignmet)
Dataset_s<- unique(Dataset_assignmet)
View(Dataset_assignmet)
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



#Analysis 3.1 : Impact of taking notes with grade -----------------------------------
library(ggplot2)
library(plotrix)
library(dplyr)

# Create a table of counts for NOTES and GRADE
notes_grade_counts <- table(Dataset_assignmet$NOTES, Dataset_assignmet$GRADE)

# Convert the table to a data frame
notes_grade_counts_df <- as.data.frame(notes_grade_counts)

# Rename columns for clarity
colnames(notes_grade_counts_df) <- c("Notes", "Grade", "Count")

# Plotting a grouped bar chart
ggplot(notes_grade_counts_df, aes(x = Notes, y = Count, fill = Grade)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  labs(title = "Impact of taking notes with grade",
       x = "Notes Taken",
       y = "Count of Students",
       fill = "Grade") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )


#Analysis 3.2 --------------------------------------------------------------------------------------------
# Filter the dataset for BB, BA, and AA grades
high_grade_categories <- c("BB", "BA", "AA")
filtered_data <- Dataset_assignmet[Dataset_assignmet$GRADE %in% high_grade_categories, ]

# Calculate the counts for each note category within high grades
high_grade_notes_counts <- table(filtered_data$NOTES)

# Create a data frame
high_grade_notes_df <- as.data.frame(high_grade_notes_counts)

# Rename columns for clarity
colnames(high_grade_notes_df) <- c("Notes", "Count")

# Create labels with counts
labels_with_counts <- paste(high_grade_notes_df$Notes, "\n", "Students: ", high_grade_notes_df$Count)

# Plotting a 3D pie chart for notes distribution within high grades
library(plotrix)

pie3D(high_grade_notes_df$Count, labels = labels_with_counts, radius = 1, 
      main = "Impact of Taking Notes on High Grades (BB, BA, AA)", col = c("red", "darkblue", "orange"))


#Analysis 3.3 -------------------------------------------------------------------------------------------- 
ggplot(Dataset_assignmet, aes(x = GENDER, fill = NOTES)) +
  geom_bar(position = "stack", stat = "count") +
  scale_fill_manual(values = c("NEVER" = "red", "SOMETIMES" = "yellow", "ALWAYS" = "green")) +
  labs(title = "Note-Taking Distribution by Gender",
       x = "Gender",
       y = "Count") +
  theme_minimal()

# Assuming Dataset_assignmet is your data frame and 'GENDER' and 'GRADE' are factors

# Load necessary library
library(ggplot2)

# Convert GENDER to categorical levels (if not done already)
# Plotting a grouped bar chart for GENDER and GRADE
ggplot(Dataset_assignmet, aes(x = GENDER, fill = GRADE)) +
  geom_bar(position = "dodge", width = 0.7) +
  labs(title = "Relationship between Gender and Grade",
       x = "Gender",
       y = "Count",
       fill = "Grade") +
  theme_minimal()


#Analysis 3.4 -----------------------------------------------------------------
# Plot the grouped bar plot for High School Type and Notes
ggplot(Dataset_assignmet, aes(x = HS_TYPE, y = ..count.., fill = NOTES)) +
  geom_bar(position = "dodge", stat = "count") +
  scale_fill_manual(values = c("NEVER" = "forestgreen", "SOMETIMES" = "maroon", "ALWAYS" = "cyan")) +
  labs(title = "Note-Taking Distribution by High School Type",
       x = "High School Type",
       y = "Count") +
  theme_minimal()

# Calculate counts of each grade within each high school type
grade_counts <- table(Dataset_assignmet$HS_TYPE, Dataset_assignmet$GRADE)

# Convert table to a data frame
grade_counts_df <- as.data.frame.matrix(grade_counts)
grade_counts_df$HS_TYPE <- rownames(grade_counts_df)

# Reshape data for plotting
library(reshape2)
grade_counts_melted <- melt(grade_counts_df, id.vars = "HS_TYPE")

# Plotting stacked bar chart for HS_TYPE and GRADE
ggplot(grade_counts_melted, aes(x = HS_TYPE, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Relationship between High School Type and Grades",
       x = "High School Type",
       y = "Count",
       fill = "Grade") +
  theme_minimal()


#Analysis 3.5 ------------------------------------------------------------------
library(ggplot2)
# Calculate counts of notes and attendance
notes_attendance_counts <- table(Dataset_assignmet$NOTES, Dataset_assignmet$ATTEND)

# Convert the table to a data frame and create a factor for 'Notes'
notes_attendance_counts_df <- as.data.frame(notes_attendance_counts)
notes_attendance_counts_df$Notes <- factor(notes_attendance_counts_df$Var1,
                                           levels = c("NEVER", "SOMETIMES", "ALWAYS"))

# Rename columns for clarity
colnames(notes_attendance_counts_df) <- c("Notes", "Attendance", "Count")

# Plotting
ggplot(notes_attendance_counts_df, aes(x = Notes, y = Count, group = Attendance, color = Attendance)) +
  # Customize the line aesthetics
  geom_line(size = 1.5, linetype = "solid") +
  # Customize the point aesthetics
  geom_point(size = 3, shape = 16) +
  # Customize plot labels and title
  labs(title = "Relationship between Notes Taken and Attending Class",
       x = "Notes",
       y = "Nmber of students",
       color = "Attendance") +
  # Apply a minimal theme
  theme_minimal() +
  # Additional theme customization for better readability
  theme(
    text = element_text(size = 12),  # Increase text size
    axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis text for better visibility
  )

# Filter data for high grades ('BB', 'BA', 'AA')
high_grade_data <- Dataset_assignmet[Dataset_assignmet$GRADE %in% c("BB", "BA", "AA"), ]

# Calculate counts of high grades within each attendance level
grade_counts <- table(high_grade_data$ATTEND, high_grade_data$GRADE)

# Convert table to a data frame
grade_counts_df <- as.data.frame.matrix(grade_counts)
grade_counts_df$ATTEND <- rownames(grade_counts_df)

# Plotting a line graph for ATTEND and high grades (BB, BA, AA)
ggplot(grade_counts_df, aes(x = ATTEND, y = `BB` + `BA` + `AA`, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 3) +
  labs(title = "Relationship between Attendance and High Grades (BB, BA, AA)",
       x = "Attendance",
       y = "Count of (BB,BA,AA) Grades",
       color = "High Grades") +
  theme_minimal()

# TESTING-------------------------------------------------------------------------
# Load necessary library
library(gmodels)  # For CrossTable function
install.packages("gmodels")
# Assuming 'Taking Notes' and 'Higher Grade Achievement' columns exist in Dataset_assignmet

# Create a contingency table between 'Taking Notes' and 'Higher Grade Achievement'
contingency_table <- table(Dataset_assignmet$NOTES, Dataset_assignmet$GRADE)

# Perform Chi-square test of independence
chi_sq_test <- chisq.test(contingency_table)

# Display the contingency table
print(CrossTable(Dataset_assignmet$NOTES, Dataset_assignmet$GRADE))

# Display the result of the Chi-square test
print(chi_sq_test)






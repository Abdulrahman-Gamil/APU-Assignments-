install.packages("plotrix")
library(plotrix)
install.packages("ggplot2")
library(ggplot2)
install.packages("tidyr")
library(tidyr)
install.packages("rgl")
library(rgl)
Dataset_assignmet= read.csv("C:\\Users\\96656\\OneDrive - Asia Pacific University\\Desktop\\sem 3\\programming for data analysis\\student_prediction.csv", TRUE)


Dataset_s<- unique(Dataset_assignmet) # delete duplicated rows.
Dataset_s<- na.omit(Dataset_assignmet) # delete the column with no values.



ncol(Dataset_assignmet)   # Get the number of columns in the dataset
nrow(Dataset_assignmet)   # Get the number of rows in the dataset
head(Dataset_assignmet)   # Display the top 6 rows of the dataset
head(Dataset_assignmet, 10)   # Display the top 10 rows of the dataset
tail(Dataset_assignmet)   # Display the last 6 rows of the dataset
tail(Dataset_assignmet, 10)   # Display the last 10 rows of the dataset
names(Dataset_assignmet)   # Get the column names of the dataset
summary(Dataset_assignmet)   # Display a summary of the dataset (including min, Q1, median, mean, Q3, max)
min(Dataset_assignmet$AGE)   # Get the minimum value in the "AGE" column
max(Dataset_assignmet$AGE)   # Get the maximum value in the "AGE" column
mean(Dataset_assignmet$AGE)   # Get the mean (average) value in the "AGE" column


Dataset_s<- names(Dataset_assignmet) #names of the columns.
class(Dataset_assignmet) # show the datatype of Dataset_asignment
# Rename the "kids" column to "Parental status" using names
colnames(Dataset_assignmet)[15] ="Parental_status"
# change the values:
Dataset_assignmet$GENDER <- factor(Dataset_assignmet$GENDER,levels=c(1,2),labels=c("female","male"))
Dataset_assignmet$WORK <- factor(Dataset_assignmet$WORK,levels=c(1,2),labels=c("YES","NO"))
Dataset_assignmet$ACTIVITY <- factor(Dataset_assignmet$ACTIVITY,levels=c(1,2),labels=c("YES","NO"))
Dataset_assignmet$SALARY <- factor(Dataset_assignmet$SALARY,levels=c(1,2,3,4,5),labels=
                                     c("135$ - 200$","201$ - 270$","271$ - 340$","341$ - 410$"," >= 410$"))
Dataset_assignmet$TRANSPORT <- factor(Dataset_assignmet$TRANSPORT,levels=c(1,2,3,4),labels=c("BUS","PRIVATE CAR/TAXI","BICYCLE","OTHER"))
Dataset_assignmet$GRADE <- factor(Dataset_assignmet$GRADE,levels=c(0,1,2,3,4,5,6,7),labels=c("FAIL","DD","DC","CC","CB","BB","BA","AA"))
Dataset_assignmet$AGE <- factor(Dataset_assignmet$AGE,levels=c(1,2,3),labels=c("18-21","22-25"," >=26"))                                                                                           
Dataset_assignmet$HS_TYPE <- factor(Dataset_assignmet$HS_TYPE,levels=c(1,2,3),labels=c("PRIVATE","STATE","OTHER"))                                                                                 
Dataset_assignmet$SCHOLARSHIP <- factor(Dataset_assignmet$SCHOLARSHIP,levels=c(1,2,3,4,5),labels=c("0%","25%","50%","75%","100%"))                                                                 
Dataset_assignmet$PARTNER <- factor(Dataset_assignmet$PARTNER,levels=c(1,2),labels=c("YES","NO"))                                                                                                  
Dataset_assignmet$LIVING <- factor(Dataset_assignmet$LIVING,levels=c(1,2,3,4),labels=c("RENTAL","DEORMITORY","WITH FAMILY","OTHER"))                                                               
Dataset_assignmet$MOTHER_EDU <- factor(Dataset_assignmet$MOTHER_EDU,levels=c(1,2,3,4,5,6),labels=c
                                       ("PRIMARY SCHOOL","SECONDARY SCHOOL","HIGH SCHOOL","UNIVERSTIY","MSc.","Bh.d."))                 
Dataset_assignmet$FATHER_EDU <- factor(Dataset_assignmet$FATHER_EDU,levels=c(1,2,3,4,5,6),labels=
                                         c("PRIMARY SCHOOL","SECONDARY SCHOOL","HIGH SCHOOL","UNIVERSTIY","MSc.","Bh.d."))                 
Dataset_assignmet$X._SIBLINGS <- factor(Dataset_assignmet$X._SIBLINGS,levels=c(1,2,3,4,5),labels=c("1","2","3","4",">=5"))
Dataset_assignmet$Parental_status <- factor(Dataset_assignmet$Parental_status,levels=c(1,2,3,4),labels=
                                              c("MARRIED","DIVORCED","DIED","ONE OF THEM OR BOTH"))                                                             
Dataset_assignmet$MOTHER_JOB <- factor(Dataset_assignmet$MOTHER_JOB,levels=c(1,2,3,4,5,6),labels=
                                         c("RETIRED","HOUSEWIFE","GOVERNMENT OFFICER","PRIVATE SECTOR EMPLOYEE","SELF-EMPLOYMENT","OTHER"))
Dataset_assignmet$FATHER_JOB <- factor(Dataset_assignmet$FATHER_JOB,levels=c(1,2,3,4,5),labels=
                                         c("RETIRED","HOUSEWIFE","GOVERNMENT OFFICER","PRIVATE SECTOR EMPLOYEE","OTHER"))                    
Dataset_assignmet$STUDY_HRS<- factor(Dataset_assignmet$STUDY_HRS,levels=c(1,2,3,4,5),labels=
                                       c("NONE","<5 HOURS","6-10 HOURS","11-20 HOURS","<20"))                                                 
Dataset_assignmet$READ_FREQ <- factor(Dataset_assignmet$READ_FREQ,levels=c(1,2,3),labels=c("NONE","SOMETIMES","OFTEN"))                                                                            
Dataset_assignmet$READ_FREQ_SCI <- factor(Dataset_assignmet$READ_FREQ_SCI,levels=c(1,2,3),labels=c("NONE","SOMETIMES","OFTEN"))                                                                    
Dataset_assignmet$ATTEND_DEPT <- factor(Dataset_assignmet$ATTEND_DEPT,levels=c(1,2),labels=c("YES","NO"))                                                                                          
Dataset_assignmet$IMPACT <- factor(Dataset_assignmet$IMPACT,levels=c(1,2,3),labels=c("POSITIVE","NEGATIVE","NEUTRAL"))                                                                             
Dataset_assignmet$ATTEND <- factor(Dataset_assignmet$ATTEND,levels=c(1,2,3),labels=c("ALWAYS","SOMETIMES","NEVER"))                                                                                
Dataset_assignmet$PREP_STUDY<- factor(Dataset_assignmet$PREP_STUDY,levels=c(1,2,3),labels=
                                        c("ALONE","WITH FRIENDS","NOT APPLICABLE"))                                                              
Dataset_assignmet$PREP_EXAM <- factor(Dataset_assignmet$PREP_EXAM,levels=c(1,2,3),labels=
                                        c("CLOSES DATE TO THE EXAM","REGULARLY DURING THE SEM","NEVER"))                                          
Dataset_assignmet$NOTES<- factor(Dataset_assignmet$NOTES,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                                   
Dataset_assignmet$LISTENS <- factor(Dataset_assignmet$LISTENS,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                              
Dataset_assignmet$LIKES_DISCUSS<- factor(Dataset_assignmet$LIKES_DISCUSS,levels=c(1,2,3),labels=c("NEVER","SOMETIMES","ALWAYS"))                                                                   
Dataset_assignmet$CLASSROOM<- factor(Dataset_assignmet$CLASSROOM,levels=c(1,2,3),labels=c("NOT USEFUL","USEFUL","NOT APPLICABLE")) 
Dataset_assignmet$CUML_GPA<- factor(Dataset_assignmet$CUML_GPA,levels=c(1,2,3,4,5),labels=
                                      c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49",">3.49"))                                                                   
Dataset_assignmet$EXP_GPA<- factor(Dataset_assignmet$EXP_GPA,levels=c(1,2,3,4,5),labels=
                                     c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49",">3.49"))   
DATA = Dataset_assignmet[, c(20, 25, 26, 18, 33)]





# Obj1: The impact of reading scientific books on achieving higher grade

nrow(DATA)   # Number of rows in the new dataset (1534)
ncol(DATA)   # Number of columns in the new dataset (5)

# Check unique values in the GRADE and READ_FREQ columns
unique(DATA$GRADE)        # Levels: FAIL DD DC CC CB BB BA AA
unique(DATA$READ_FREQ_SCI)    # Levels: NONE SOMETIMES OFTEN

# Count the number of rows for different READ_FREQ_SCI values
sometimes_count <- nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES",]) # 1090
often_count <- nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN",])     # 231
none_count <- nrow(DATA[DATA$READ_FREQ_SCI == "NONE",])      # 213

# Total number of students
total_students <- sometimes_count + often_count + none_count

# Calculate percentages
percentage_sometimes <- (sometimes_count / total_students) * 100
percentage_often <- (often_count / total_students) * 100
percentage_none <- (none_count / total_students) * 100


# Count the number of rows for different GRADE values
aa_count=nrow(DATA[DATA$GRADE == "AA",])        
ba_count=nrow(DATA[DATA$GRADE == "BA",])        
bb_count=nrow(DATA[DATA$GRADE == "BB",])        
cb_count=nrow(DATA[DATA$GRADE == "CB",])        
cc_count=nrow(DATA[DATA$GRADE == "CC",])        
dc_count=nrow(DATA[DATA$GRADE == "DC",])        
dd_count=nrow(DATA[DATA$GRADE == "DD",])        
fail_count=nrow(DATA[DATA$GRADE == "FAIL",]) 
# Total number of students
total_students_grades <- aa_count + ba_count + bb_count + cb_count + cc_count + dc_count + dd_count + fail_count

# Calculate percentages
percentage_aa <- (aa_count / total_students_grades) * 100
percentage_ba <- (ba_count / total_students_grades) * 100
percentage_bb <- (bb_count / total_students_grades) * 100
percentage_cb <- (cb_count / total_students_grades) * 100
percentage_cc <- (cc_count / total_students_grades) * 100
percentage_dc <- (dc_count / total_students_grades) * 100
percentage_dd <- (dd_count / total_students_grades) * 100
percentage_fail <- (fail_count / total_students_grades) * 100


ALL_grades=c(aa_count,ba_count,bb_count,cb_count,cc_count,dc_count,dd_count,fail_count)


# Calculate the number of students in different combinations of READ_FREQ_SCI and GRADE
SOMETIMES_AA = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "AA",])
SOMETIMES_BA = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "BA",])
SOMETIMES_BB = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "BB",])
SOMETIMES_CB = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "CB",])
SOMETIMES_CC = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "CC",])
SOMETIMES_DC = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "DC",])
SOMETIMES_DD = nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "DD",])
SOMETIMES_FAIL =  nrow(DATA[DATA$READ_FREQ_SCI == "SOMETIMES" & DATA$GRADE == "FAIL",])

OFTEN_AA = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "AA",])
OFTEN_BA = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "BA",])
OFTEN_BB = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "BB",])
OFTEN_CB = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "CB",])
OFTEN_CC = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "CC",])
OFTEN_DC = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "DC",])
OFTEN_DD = nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "DD",])
OFTEN_FAIL =  nrow(DATA[DATA$READ_FREQ_SCI == "OFTEN" & DATA$GRADE == "FAIL",])

NEVER_AA = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" &DATA$GRADE == "AA",])
NEVER_BA = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "BA",])
NEVER_BB = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "BB",])
NEVER_CB = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "CB",])
NEVER_CC = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "CC",])
NEVER_DC = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "DC",])
NEVER_DD = nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "DD",])
NEVER_FAIL =  nrow(DATA[DATA$READ_FREQ_SCI == "NONE" & DATA$GRADE == "FAIL",])





SOMETIMES = c(SOMETIMES_AA, SOMETIMES_BA, SOMETIMES_BB, SOMETIMES_CB, SOMETIMES_CC, SOMETIMES_DC, SOMETIMES_DD, SOMETIMES_FAIL)
OFTEN = c(OFTEN_AA, OFTEN_BA, OFTEN_BB, OFTEN_CB, OFTEN_CC, OFTEN_DC, OFTEN_DD, OFTEN_FAIL)
NONE = c(NEVER_AA, NEVER_BA, NEVER_BB, NEVER_CB, NEVER_CC, NEVER_DC, NEVER_DD, NEVER_FAIL)
ALL = c(sum(SOMETIMES),sum(OFTEN),sum(NONE))
# Define labels
LEVELS <- c("Sometimes", "Often", "None")
grades<- c("FAIL","DD","DC","CC","CB","BB","BA","AA")

DisOften <- c(OFTEN_FAIL, OFTEN_DD, OFTEN_DC, OFTEN_CC, OFTEN_CB, OFTEN_BB, OFTEN_BA, OFTEN_AA)
DisSome <- c(SOMETIMES_FAIL, SOMETIMES_DD, SOMETIMES_DC,SOMETIMES_CC,SOMETIMES_CB,SOMETIMES_BB,SOMETIMES_BA, SOMETIMES_AA)
DisNone <- c(NEVER_FAIL, NEVER_DD,NEVER_DC, NEVER_CC, NEVER_CB,NEVER_BB, NEVER_BA, NEVER_AA)


# Define the data
High_grades_Sometimes <- sum(SOMETIMES_AA, SOMETIMES_BA, SOMETIMES_BB)
High_grades_Often <- sum(OFTEN_AA, OFTEN_BA, OFTEN_BB)
High_grades_None <- sum(NEVER_AA, NEVER_BA, NEVER_BB)
Low_grades_Sometimes <- sum(SOMETIMES_CC, SOMETIMES_DD, SOMETIMES_FAIL, SOMETIMES_DC, SOMETIMES_CB)
Low_grades_Often <- sum(OFTEN_CC, OFTEN_DD, OFTEN_FAIL, OFTEN_DC, OFTEN_CB)
Low_grades_None <- sum(NEVER_FAIL, NEVER_CC, NEVER_DD, NEVER_CB, NEVER_DC)

# Create data vectors
HIGH <- c(High_grades_Sometimes, High_grades_None, High_grades_Often)
LOW <- c(Low_grades_None, Low_grades_Often, Low_grades_Sometimes)


# Create 3D pie chart for levels of students
pie3D(ALL, labels = LEVELS, radius = 1, main = "Distribution of Reading Levels", col = c("purple", "pink", "red"))


# Create  pie chart for levels of grades
colors = c("red", "#4169E1", "pink", "#DC143C", "#DAA520", "#800080", "#008080", "#708090")
pie(ALL_grades, labels = grades, explode = 0.1, main = "Distribution of Grades", col =colors)

# Create line plot for people who read sometimes distribution
plot(1:8, DisSome, type = "l", col = "blue", xaxt = "n", xlab = "", ylab = "Count",main = "The Impact of Reading on Grades")
axis(1, at = 1:8, labels = grades)

lines(1:8, DisOften, col = "black")

# Create line plot for people who do not read distribution
lines(1:8, DisNone, col = "red")
legend("topright", legend = c(LEVELS), col = c("blue", "black", "red"), lty = 1, cex = 0.8)




MATRIX_FORMAT <- matrix(c(SOMETIMES,OFTEN,NONE),
                        nrow =3 ,
                        ncol =8 ,
                        byrow = TRUE,
                        list(c("SOMETIMES:","OFTEN:","NONE:"),
                             c(" AA "," BA ","BB "," CB "," CC"," DC "," DD "," FAIL")))
data <- data.frame(
  LEVELS = c("NEVER", "SOMETIMES", "ALWAYS"),
  HIGH = c(High_grades_Sometimes, High_grades_None, High_grades_Often),
  LOW = c(Low_grades_None, Low_grades_Often, Low_grades_Sometimes)
)

# Reshape data to long format for ggplot2
MATRIX_FORMAT <- tidyr::gather(data, key = "Grade Level", value = "Count", -LEVELS)

ggplot(MATRIX_FORMAT, aes(x = LEVELS, y = Count, fill = `Grade Level`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Reading Level", y = "Count", fill = "Grade Level") +
  ggtitle("Impact of Reading on Grades") +
  theme_minimal()




# Create a stacked bar plot based on reading levels and grades
barplot(rbind(DisSome, DisOften, DisNone), beside = TRUE, col = c("blue", "black", "red"),
        legend.text = c("Sometimes", "Often", "None"),
        names.arg = c("FAIL", "DD", "DC", "CC", "CB", "BB", "BA", "AA"),
        xlab = "Grades", ylab = "Count", main = "Distribution of Reading Levels and Grades")


#create a table
Reading_table <- table(DATA$GRADE ,DATA$READ_FREQ_SCI)
Reading_table

# Create a new table excluding "Never" and "Often"
Reading_table <- Reading_table[, c("SOMETIMES", "OFTEN")]

# Perform Chi-square test
Reading_table <- chisq.test(Reading_table)

# Print the result
print(Reading_table)


#==============================================================================
# STEP 1. Merges the training and the test sets to create one data set.
#=============================================================================

# Read data from train/ and test/ folders
X.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Bind and X, y and subject to create a single data frame for test and a train, respectively
test <- cbind(X.test, y.test, subject.test)
train <- cbind(X.train, y.train, subject.train)

# Bind test and train full datasets (merge the two datasets)
data <- rbind(test, train)

#==============================================================================
# STEP 2. Extracts only the measurements on the mean and standard deviation 
#         for each measurement. 
#==============================================================================

# Read features names from features.txt
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Get those features with mean and std in it's name
means.index <- grep("mean\\(\\)", features[,2])
std.index <- grep("std\\(\\)", features[,2])

# Create an ordered feature data frame with means and std only
features <- rbind(features[means.index,], features[std.index,])
features <- features[order(features[1]),]

# Add activity and sunject o features
features <- rbind(list(c(ncol(data)-1, ncol(data)), c("activity", "subject")), features)

# Keep on data only columns in features
data <- data[, features$V1]

#==============================================================================
# STEP 4. Appropriately labels the data set with descriptive variable names. 
#==============================================================================

# For this step, we are going to keep the original descriptive variable names.
# For a more detailed description, please refer to the codebook (which will be
# generated based on this data)

# Give descriptive names to variables (columns)
colnames(data) <- features$V2

#==============================================================================
# STEP 3. Uses descriptive activity names to name the activities in the data set
#==============================================================================

# Read file with activity labels
activity.label <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# Set labels to lowercase, for consistence
activity.label$V2 <- tolower(activity.label$V2)

# Merge data with activity.label by activity 
data <- merge(data, activity.label, by.x = "activity", by.y = "V1")

# Keep only descriptive activities column
data$activity <- data$V2
data$V2 <- NULL

#==============================================================================
# STEP 5. Creates a second, independent tidy data set with the average of each 
#         variable for each activity and each subject.  
#==============================================================================

# We will use functions from reshape2 package
# Install it if it's not already instaled
if(!require(reshape2)){install.packages("reshape2")}

# Melt data using activity and subject as IDs
data.melt <- melt(data, id=c("activity", "subject"))

# Cast melted data using mean as aggregator function
data.cast <- dcast(data.melt, subject + activity ~ variable, mean)

# Save data.cast as our final tidy data set
# In short, it's tidy because we have one column per variable, 
# one observation per row and it's contained in a single dataset
# (contrary to the original data)
write.table(data.cast, file = "data/uci-har-tidy.txt", row.names = FALSE)

#==============================================================================
# STEP 6. Create a codebook
#==============================================================================

# Function to split the variables names (which is in camelCase)
feature.split <- function (feature.name) {
    strsplit(gsub("([A-Z-])", " \\1", feature.name), " ")[[1]]
}  

# Function to create variables description based on their names
features.description <- function (feature.name) {
    # Split features
    feature.keywords <- feature.split(feature.name)

    # If activity or subject, return custom description
    if ("subject" %in% feature.keywords) {
        return("ID of the subject.")
    }
    
    if ("activity" %in% feature.keywords) {
        return("Activity type performed.")
    }
    
    # Other features
    
    # Std or mean?
    description <- c()
    if ("-std()" %in% feature.keywords) {
        description <- cbind(description, "Mean ofstandard deviations of")
    } else if ("-mean()" %in% feature.keywords) {
        description <- cbind(description, "Mean of means of")
    }
    
    # Magnitude?
    if ("Mag" %in% feature.keywords) {
        description <- cbind(description, "the magnitude of")
    }
    
    # Jerk?
    if ("Jerk" %in% feature.keywords) {
        description <- cbind(description, "jerk signal of")
    }
    
    # Accelerometer or Gyroscope?
    if ("Acc" %in% feature.keywords) {
        description <- cbind(description, "accelerometer")
    } else if ("Gyro" %in% feature.keywords) {
        description <- cbind(description, "giroscope")
    }

    # Body or gravity?
    if ("Body" %in% feature.keywords) {
        description <- cbind(description, "body")
    } else if ("Gravity" %in% feature.keywords) {
        description <- cbind(description, "gravity")
    }
    
    # Just the word data
    description <- cbind(description, "data")
    
    # Time or frequency domain?
    if ("t" %in% feature.keywords) {
        description <- cbind(description, "in time domain")
    } else if ("f" %in% feature.keywords) {
        description <- cbind(description, "in frequency domain")
    }
    
    # Directions
    if ("X" %in% feature.keywords) {
        description <- cbind(description, "in the X direction")
    } else if ("Y" %in% feature.keywords) {
        description <- cbind(description, "in the Y direction")
    } else if ("Z" %in% feature.keywords) {
        description <- cbind(description, "in the Z direction")
    }
      
    # Ending sentence
    description <- cbind(description, "for each given subject and activity type")
    
    # Concatenate the description
    description.string <- paste(description, collapse=" ")
    
    # Period
    paste(cbind(description.string,"."), collapse="")
}

# Create codebook table

# Get variables names from data.cast
codebook.variables.names <- names(data.cast)

# Apply our features.descriptions to names(data.cast) to get descriptions
codebook.variables.descriptions <- unlist(lapply(names(data.cast),features.description))

# Get variables widths

# Create ranges vector
activity.range <- sprintf("string in {%s}",paste(activity.label$V2, collapse=", "))
subject.range <- "integer in [1, 30]"
others.range <- rep("float in [-1,1]", length(codebook.variables.names) -2)

codebook.variables.range <- c(activity.range, subject.range, others.range)

# Create data frame from previous vectors
codebook.df <- data.frame(variable = codebook.variables.names, 
                         description = codebook.variables.descriptions, 
                         range = codebook.variables.range)

# We will use knitr to export a markdown table version of our codebook  
# Install it if it's not already instaled
if(!require(knitr)){install.packages("knitr")}

kable(codebook.df)

sink("CODEBOOK.md")
cat("==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================\n\n")
cat("## Data collection \n\n")  
cat("The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.\n
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.\n
The data were aggregated to give the means of the means and standard deviations of each variable for each subject and activity.\n\n")
cat("## Codebook (table format)")
kable(codebook.df)
cat("\n\n")
cat("## Codebook (plain format) \n\n")
sink()

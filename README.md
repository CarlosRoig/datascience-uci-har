# Summarizing UCI HAR Dataset with R (data science project)

We provide a R script for reading the original [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), summarizing it to contain only mean values grouped by subject and activity. See a full description of the dataset following the provided link.

It's is a Course Project for Coursera's Getting and Cleaning Data, which is the third course in a Data Science Specialization provided by Johns Hopkins University.

## Requirements

Before running the script, we must [download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the UCI HAR Dataset into a folder named `UCI HAR Dataset` under this repo's root.

## The script

The script responsible for running the dataset analysis is [run_analysis.R](./run_analysis.R). 

It is heavily documented, but we summarize here its main functionalities.

### Step 1: Merges the training and the test sets to create one data set

Here we just read the main dataset files for test and training, vertically merging them into a data frame.

The files we read in this step:
```
UCI HAR Dataset/
├── test
│   ├── subject_test.txt
│   ├── X_test.txt
│   └── y_test.txt
└── train
    ├── subject_train.txt
    ├── X_train.txt
    └── y_train.txt
```

The files under the `Ìnertial Signals` are raw data used to create the data we are already precessing. As we want to summarize it even more, we have nothing to do with them.

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

Here we read one more file, containing the variables names for the columns read in the previous step in the `X_*.txt` files.

The read file:
```
UCI HAR Dataset/
├── features.txt

```

After reading it, we extract only those columns having either `mean()` or `std()` in it's names.

### Step 4: Appropriately labels the data set with descriptive variable names.

We call it step 4, even being executed before step 3, to keep pace with project's description in Coursera.

In this step we just apply the naming in the file read in step 2 to our merged data frame, also adding names to subject and activity variables (the data read from `subject_*.txt` and `y_*.txt` files).


### Step 3: Uses descriptive activity names to name the activities in the data set

We read a file containg descriptive names for each of the six activities in the dataset. 

The file is this one:
```
UCI HAR Dataset/
├── activity_labels.txt

```

After reading it, we merge the descriptive names to our data frame, eventually replacing the old activity column (with numeric data) with the new one (with meaningful activities names). 


### Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject

In this step we aggregate the information for each subject in each activity done. The aggregate function used is the mean.

To perform this, we used an R package called `reshape2`, which contains the functions `melt` and `dcast`. We first used `melt()` to create an data frame with subject and activity as IDs, after which we used `dcast()` on this newly create object to perform the variables aggregation.

The resulting data fram containde our final tidy dataset. In short, it's tidy because we have one column per variable, one observation per row and it's contained in a single dataset (contrary to the original data).

### Step 6: Creates a codebook

This step is not part of the project's description for `run_analysis.R` script, but it's better to programmaticaly do it here, as we use the data already in memory to create it.

The output is file `CODEBOOK.md`.
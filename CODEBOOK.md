```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
```

## Data collection 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data were aggregated to give the means of the means and standard deviations of each variable for each subject and activity.

## Codebook (table format)

|variable                    |description                                                                                                   |range                                                                                |
|:---------------------------|:-------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------|
|subject                     |ID of the subject.                                                                                            |string in {walking, walking_upstairs, walking_downstairs, sitting, standing, laying} |
|activity                    |Activity type performed.                                                                                      |integer in [1, 30]                                                                   |
|tBodyAcc-mean()-X           |Mean of means of accelerometer body data in time domain in the X direction.                                   |float in [-1,1]                                                                      |
|tBodyAcc-mean()-Y           |Mean of means of accelerometer body data in time domain in the Y direction.                                   |float in [-1,1]                                                                      |
|tBodyAcc-mean()-Z           |Mean of means of accelerometer body data in time domain in the Z direction.                                   |float in [-1,1]                                                                      |
|tBodyAcc-std()-X            |Mean of standard deviations of accelerometer body data in time domain in the X direction.                     |float in [-1,1]                                                                      |
|tBodyAcc-std()-Y            |Mean of standard deviations of accelerometer body data in time domain in the Y direction.                     |float in [-1,1]                                                                      |
|tBodyAcc-std()-Z            |Mean of standard deviations of accelerometer body data in time domain in the Z direction.                     |float in [-1,1]                                                                      |
|tGravityAcc-mean()-X        |Mean of means of accelerometer gravity data in time domain in the X direction.                                |float in [-1,1]                                                                      |
|tGravityAcc-mean()-Y        |Mean of means of accelerometer gravity data in time domain in the Y direction.                                |float in [-1,1]                                                                      |
|tGravityAcc-mean()-Z        |Mean of means of accelerometer gravity data in time domain in the Z direction.                                |float in [-1,1]                                                                      |
|tGravityAcc-std()-X         |Mean of standard deviations of accelerometer gravity data in time domain in the X direction.                  |float in [-1,1]                                                                      |
|tGravityAcc-std()-Y         |Mean of standard deviations of accelerometer gravity data in time domain in the Y direction.                  |float in [-1,1]                                                                      |
|tGravityAcc-std()-Z         |Mean of standard deviations of accelerometer gravity data in time domain in the Z direction.                  |float in [-1,1]                                                                      |
|tBodyAccJerk-mean()-X       |Mean of means of jerk signal of accelerometer body data in time domain in the X direction.                    |float in [-1,1]                                                                      |
|tBodyAccJerk-mean()-Y       |Mean of means of jerk signal of accelerometer body data in time domain in the Y direction.                    |float in [-1,1]                                                                      |
|tBodyAccJerk-mean()-Z       |Mean of means of jerk signal of accelerometer body data in time domain in the Z direction.                    |float in [-1,1]                                                                      |
|tBodyAccJerk-std()-X        |Mean of standard deviations of jerk signal of accelerometer body data in time domain in the X direction.      |float in [-1,1]                                                                      |
|tBodyAccJerk-std()-Y        |Mean of standard deviations of jerk signal of accelerometer body data in time domain in the Y direction.      |float in [-1,1]                                                                      |
|tBodyAccJerk-std()-Z        |Mean of standard deviations of jerk signal of accelerometer body data in time domain in the Z direction.      |float in [-1,1]                                                                      |
|tBodyGyro-mean()-X          |Mean of means of giroscope body data in time domain in the X direction.                                       |float in [-1,1]                                                                      |
|tBodyGyro-mean()-Y          |Mean of means of giroscope body data in time domain in the Y direction.                                       |float in [-1,1]                                                                      |
|tBodyGyro-mean()-Z          |Mean of means of giroscope body data in time domain in the Z direction.                                       |float in [-1,1]                                                                      |
|tBodyGyro-std()-X           |Mean of standard deviations of giroscope body data in time domain in the X direction.                         |float in [-1,1]                                                                      |
|tBodyGyro-std()-Y           |Mean of standard deviations of giroscope body data in time domain in the Y direction.                         |float in [-1,1]                                                                      |
|tBodyGyro-std()-Z           |Mean of standard deviations of giroscope body data in time domain in the Z direction.                         |float in [-1,1]                                                                      |
|tBodyGyroJerk-mean()-X      |Mean of means of jerk signal of giroscope body data in time domain in the X direction.                        |float in [-1,1]                                                                      |
|tBodyGyroJerk-mean()-Y      |Mean of means of jerk signal of giroscope body data in time domain in the Y direction.                        |float in [-1,1]                                                                      |
|tBodyGyroJerk-mean()-Z      |Mean of means of jerk signal of giroscope body data in time domain in the Z direction.                        |float in [-1,1]                                                                      |
|tBodyGyroJerk-std()-X       |Mean of standard deviations of jerk signal of giroscope body data in time domain in the X direction.          |float in [-1,1]                                                                      |
|tBodyGyroJerk-std()-Y       |Mean of standard deviations of jerk signal of giroscope body data in time domain in the Y direction.          |float in [-1,1]                                                                      |
|tBodyGyroJerk-std()-Z       |Mean of standard deviations of jerk signal of giroscope body data in time domain in the Z direction.          |float in [-1,1]                                                                      |
|tBodyAccMag-mean()          |Mean of means of the magnitude of accelerometer body data in time domain.                                     |float in [-1,1]                                                                      |
|tBodyAccMag-std()           |Mean of standard deviations of the magnitude of accelerometer body data in time domain.                       |float in [-1,1]                                                                      |
|tGravityAccMag-mean()       |Mean of means of the magnitude of accelerometer gravity data in time domain.                                  |float in [-1,1]                                                                      |
|tGravityAccMag-std()        |Mean of standard deviations of the magnitude of accelerometer gravity data in time domain.                    |float in [-1,1]                                                                      |
|tBodyAccJerkMag-mean()      |Mean of means of the magnitude of jerk signal of accelerometer body data in time domain.                      |float in [-1,1]                                                                      |
|tBodyAccJerkMag-std()       |Mean of standard deviations of the magnitude of jerk signal of accelerometer body data in time domain.        |float in [-1,1]                                                                      |
|tBodyGyroMag-mean()         |Mean of means of the magnitude of giroscope body data in time domain.                                         |float in [-1,1]                                                                      |
|tBodyGyroMag-std()          |Mean of standard deviations of the magnitude of giroscope body data in time domain.                           |float in [-1,1]                                                                      |
|tBodyGyroJerkMag-mean()     |Mean of means of the magnitude of jerk signal of giroscope body data in time domain.                          |float in [-1,1]                                                                      |
|tBodyGyroJerkMag-std()      |Mean of standard deviations of the magnitude of jerk signal of giroscope body data in time domain.            |float in [-1,1]                                                                      |
|fBodyAcc-mean()-X           |Mean of means of accelerometer body data in frequency domain in the X direction.                              |float in [-1,1]                                                                      |
|fBodyAcc-mean()-Y           |Mean of means of accelerometer body data in frequency domain in the Y direction.                              |float in [-1,1]                                                                      |
|fBodyAcc-mean()-Z           |Mean of means of accelerometer body data in frequency domain in the Z direction.                              |float in [-1,1]                                                                      |
|fBodyAcc-std()-X            |Mean of standard deviations of accelerometer body data in frequency domain in the X direction.                |float in [-1,1]                                                                      |
|fBodyAcc-std()-Y            |Mean of standard deviations of accelerometer body data in frequency domain in the Y direction.                |float in [-1,1]                                                                      |
|fBodyAcc-std()-Z            |Mean of standard deviations of accelerometer body data in frequency domain in the Z direction.                |float in [-1,1]                                                                      |
|fBodyAccJerk-mean()-X       |Mean of means of jerk signal of accelerometer body data in frequency domain in the X direction.               |float in [-1,1]                                                                      |
|fBodyAccJerk-mean()-Y       |Mean of means of jerk signal of accelerometer body data in frequency domain in the Y direction.               |float in [-1,1]                                                                      |
|fBodyAccJerk-mean()-Z       |Mean of means of jerk signal of accelerometer body data in frequency domain in the Z direction.               |float in [-1,1]                                                                      |
|fBodyAccJerk-std()-X        |Mean of standard deviations of jerk signal of accelerometer body data in frequency domain in the X direction. |float in [-1,1]                                                                      |
|fBodyAccJerk-std()-Y        |Mean of standard deviations of jerk signal of accelerometer body data in frequency domain in the Y direction. |float in [-1,1]                                                                      |
|fBodyAccJerk-std()-Z        |Mean of standard deviations of jerk signal of accelerometer body data in frequency domain in the Z direction. |float in [-1,1]                                                                      |
|fBodyGyro-mean()-X          |Mean of means of giroscope body data in frequency domain in the X direction.                                  |float in [-1,1]                                                                      |
|fBodyGyro-mean()-Y          |Mean of means of giroscope body data in frequency domain in the Y direction.                                  |float in [-1,1]                                                                      |
|fBodyGyro-mean()-Z          |Mean of means of giroscope body data in frequency domain in the Z direction.                                  |float in [-1,1]                                                                      |
|fBodyGyro-std()-X           |Mean of standard deviations of giroscope body data in frequency domain in the X direction.                    |float in [-1,1]                                                                      |
|fBodyGyro-std()-Y           |Mean of standard deviations of giroscope body data in frequency domain in the Y direction.                    |float in [-1,1]                                                                      |
|fBodyGyro-std()-Z           |Mean of standard deviations of giroscope body data in frequency domain in the Z direction.                    |float in [-1,1]                                                                      |
|fBodyAccMag-mean()          |Mean of means of the magnitude of accelerometer body data in frequency domain.                                |float in [-1,1]                                                                      |
|fBodyAccMag-std()           |Mean of standard deviations of the magnitude of accelerometer body data in frequency domain.                  |float in [-1,1]                                                                      |
|fBodyBodyAccJerkMag-mean()  |Mean of means of the magnitude of jerk signal of accelerometer body data in frequency domain.                 |float in [-1,1]                                                                      |
|fBodyBodyAccJerkMag-std()   |Mean of standard deviations of the magnitude of jerk signal of accelerometer body data in frequency domain.   |float in [-1,1]                                                                      |
|fBodyBodyGyroMag-mean()     |Mean of means of the magnitude of giroscope body data in frequency domain.                                    |float in [-1,1]                                                                      |
|fBodyBodyGyroMag-std()      |Mean of standard deviations of the magnitude of giroscope body data in frequency domain.                      |float in [-1,1]                                                                      |
|fBodyBodyGyroJerkMag-mean() |Mean of means of the magnitude of jerk signal of giroscope body data in frequency domain.                     |float in [-1,1]                                                                      |
|fBodyBodyGyroJerkMag-std()  |Mean of standard deviations of the magnitude of jerk signal of giroscope body data in frequency domain.       |float in [-1,1]                                                                      |

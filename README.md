Run_Analysis
============

Getting and Cleaning Data course assignment.

==================================================================
Transformation of UCI HAR Dataset into a tidy dataset
==================================================================

The starting UCI HAR Dataset was generated from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 

For each record, the following is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information on the specifications of the original UCI HAR Dataset, reference http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

==================================================================

The dataset includes the following files:

- 'README.txt'

- 'run_analysis_codebook': shows information about the variables used in the tidy dataset xAgg, the result of transformation of the UCI HAR Dataset files.

- 'run_analysis.R': contains the code to transform the origina UCI HAR dataset files into the tidy dataset.

The original UCI HAR Dataset files were combined to generate one large dataset: 

The subject test and train data tables are combined to create one dataset of Subjects who participated in the experiments (1 through 30)
- 'subject_text.txt'
- 'subject_train.txt'

The x test and train data tables are combined so that the 70%/30% split for the Train and Test datasets in the origina UCI HAR Dataset becomes one dataset of observations. 
- 'x_test.txt'
- 'x_train.txt'

The y test and train data tables are combined to create one dataset of Activities (Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs) which can be associated to experiment observations.
- 'y_test.txt'
- 'y_train.txt'


The x dataset of experiment observations is subset down to only those representing a calculation of mean or standard deviation of experimental data. 

The subject dataset and y dataset (representing Acivity) is then attached to the x dataset, providing one large dataset with observations by Subject and Activity.

The activities originally from the y dataset are renamed with descriptive activity names that easily identify the activity type for each observation (Laying, Sitting, Standing, Walking, WalkingDownstairs, WalkingUpstairs).

The observation columns originally from the x dataset are renamed with descriptive, tidy variable names that identify the observation specifications (e.g. tBodyAcc_mean_X,tGravityAcc_mean_X, tBodyAccJerk_mean_X, etc).

The dataset is reshaped into a tidy dataset with the average of each variable observation, by Subject and by Activity. Each row represents one unique Subject-Activity-average observation.


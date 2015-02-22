---
title: "Codebook"
author: "Andy Kozak"
date: "Sunday, February 22, 2015"
output: html_document
---

# Data set overview


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.



# Data transformation overview



Code is assuming source data loaded into working directory into sub folder  "UCI HAR Dataset"
data are in original form.

Load and unzip source data into working directory before executing code

1. Read and merge  data files from working directory to relevant variables: 

subject_test.txt
X_test.txt
Y_test.txt
subject_train.txt
x_train.txt
Y_train.txt
features.txt
activity_labels.txt

 training and testing sets are merged using rbind total set is joined using cbind

2. Give  id columns proper names and label other columns based on features files content  
 addin subject and activity column names to first columns and other columns titles are used/loaded from 
features files


3. Replace activity Id with activity name .In this step each activity ID is replaced ith activity name loaded from activity_labels.txt



4. Create reduced data with only mean and st.dev features 
   removing not relevant columns by searching mean and stadard,
   significant amount of data reduction is done in this step  

5. Remove parenthesys from names as Minor adjustment fro improving readability

6. Group and calculate average by activity and subject, write results to file result_data.txt in project speficic format
  ddply is used from plyr package for this operation
 

# Variables

subtest,xtest,ytest,subtrain,xtrain,ytrain,features and activities are coresponding to their releveant source file

merged_Data - test and train datatogether with subject and activity

reduced_data - only meand and stadard deviation columns

result_Data - agregated by activity and subject


README.md

This project is part of the specialized data science program in coursera in this I intend to get organize and put in condition for a next review a data set that is part of the experiment carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.


the experiment was carried out at Smartlab a Laboratory of non-linear complex systems carried out at DITEN - Universit ‡ degli Studi di Genova, Via Opera Pia 11A, I-16145, Genoa, Italy.

For more information you can contact activityrecognition@smartlab.ws
www.smartlab.ws



this dataset included a voluntary recruitment of subjects aged 19 - 48 years, each person carried out 6 activities, (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) at the waist. Using its built-in accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant speed of 50Hz. The experiments were videotaped to label the data manually. The data set obtained has been randomly divided into two sets, where 70% of the volunteers were selected to generate the training data and 30% of the test data.

Sensor signals (accelerometer and gyroscope) were preprocessed by applying noise filters and then samples were taken in 2.56-second fixed width sliding windows with 50% overlap (128 readings / window). The sensor's acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter on body acceleration and gravity. It is assumed that the gravitational force only has low frequency components, therefore, a filter with a cutoff frequency of 0.3 Hz was used. From each window, a vector of characteristics was obtained by calculating variables of the time domain and frequency. See 'features_info.txt' for more details.

Although this project includes 561 variables for our purpose, we will only use 88 that correspond to the means and standard deviations and included the procedure that I carried out to arrive at the data set.


the files included in this project are:

Fade: dataset in ordered csv format, this contains "NAs" values that are characteristic of the fade of the data, and must be loaded in R, for its own visualization.

CodeBook.md. - Codebook that describes the variables, the data, and any transformation or work you've done to clean up the data.

README.md: this contains the repository with its scripts. This repository explains how all scripts work and how they are connected.

script: this contains the codes made in order to obtain the resulting data
* import of data.
* create a variable to rename datatest.
* named of the variables in datatest.
* load the tidyverse library to select only the variables that contain the
requested qualities, these are only variables that contain the mean and the standard deviation.
* renaming subjects and activity labels.
* merge everything into a single dataframe.
* create unique names of the variables.
* repeat the procedure for the data set that we are going to merge.
* merge the two data tables into one.
* take the mean from the desired variables.
* create a csv document that contains the data to work with them soon.

- you can see the complete procedure in the "script" file included in the repository.

- the descriptions of the variables used are found in the file "CodeBook.md." .









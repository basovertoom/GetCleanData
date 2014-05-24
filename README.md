## Getting-and-Cleaning-Data-Course

### Basic information 

The project users the following files:

    run_analysis.R
    features.txt
    activity_labels.txt
    subject_test.txt
    X_test.txt
    y_test.txt
    subject_train.txt
    X_train.txt
    y_train.txt
    tidy_data.txt

All processing is performed in run_analysis.R which assumes the additional files are in the working directory under the same file structure where test text files are in a test subfolder and train text files are in a test subfolder.

The "tidy_data.txt" file is created as an output.

It also uses the "plyr" library

### Process of the analysis:

* Firstly, we read all the data needed

* Then we add the 'subject' (subject_test.txt and subject_train.txt) and 'activity' data (y_test.txt and y_train.txt) though column bing
, follow by a row bind - adding the train and test set together

* Then we set the column names for the data_set by add the 

* We subset data for 'mean' and 'std' values and reorder the data set on Subject and Activity 

* We split the data set for unique activity AND subject and calculate column means for each subject and each activity,
and create a new data_set with these values

* We add the Subject and Activity numbers to the new data set and subsitute Acitvity_labels

* We have finished our new tidy data set and write the "tidy_data.txt" file


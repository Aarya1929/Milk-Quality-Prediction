MILK QUALITY PREDICTION

Introduction
This R script predicts milk grades using various machine learning algorithms applied to a dataset stored in "milknew.csv". It handles missing values, checks for class imbalance, creates training and testing data partitions, and applies decision trees, SVM radial, and neural network algorithms for prediction.

File Description
Kaggle dataset link: https://www.kaggle.com/datasets/cpluzshrijayan/milkquality
milknew.csv: CSV file containing the milk dataset.
Milk_Grade_Prediction.R: R script for data preprocessing, model training, and prediction.
README.md: This file providing information about the project.

Dependencies
R packages: caret, rpart, rpart.plot

Usage
Place the "milknew.csv" file in the same directory as the R script.
Ensure R and necessary packages (caret, rpart, rpart.plot) are installed.
Run the Milk_Grade_Prediction.R script in an R environment.

Description of Script
Data Preprocessing: Checks for missing values and converts the "Grade" column to a factor.
Class Imbalance: Checks for class imbalance in the "Grade" column.
Data Partitioning: Creates training and testing data partitions using the caret package.
Model Training:
    Decision Trees: Uses rpart method to train decision tree models.
    SVM Radial: Applies svmRadial method for support vector machine models.
    Neural Network: Utilizes nnet method for neural network models.
Prediction: Predicts milk grades using the trained models and evaluates performance using confusion matrices.

Outputs
Confusion matrices for decision tree, SVM radial, and neural network models.
Decision tree visualization using rpart.plot.

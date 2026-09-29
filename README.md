# Hybrid Signature-Based Intrusion Detection System

## Project Overview

The Hybrid Signature-Based Intrusion Detection System is a network security project designed to detect malicious network activity by combining traditional signature-based detection with machine-learning-based detection.

The system first applies predefined signature rules and then uses a Random Forest machine learning model to classify the test data. The final hybrid decision combines the outputs of both approaches.

## Objectives

* Detect malicious network traffic and potential attacks.
* Identify known attack patterns using signature-based detection.
* Apply machine learning to classify network traffic.
* Evaluate the performance of the detection system using appropriate metrics.

## Technologies Used

- MATLAB
- Random Forest
- TreeBagger
- Signature-Based Detection
- Machine Learning
- Network Intrusion Detection
- ROC Curve and AUC Analysis

## System Approach

The project follows a hybrid detection approach:

1. A simulated network intrusion dataset is generated with normal and attack samples.
2. Signature-based rules are applied to identify known attack patterns.
3. The dataset is divided into training and testing sets.
4. A Random Forest classifier is trained using MATLAB's TreeBagger function.
5. The signature-based results and machine-learning predictions are combined.
6. The hybrid IDS performance is evaluated using accuracy, detection rate, false positive rate, F1 score, and ROC-AUC.
   
## Results

The evaluated Hybrid IDS achieved:

- Accuracy: **93.33%**
- Detection Rate (TPR): **95.33%**
- False Positive Rate (FPR): **8.67%**
- F1 Score: **0.935**
- ROC-AUC: **0.990**

The Random Forest model achieved:

- Training Accuracy: **100.00%**
- Testing Accuracy: **94.00%**

## My Contribution

* Worked on the implementation of the hybrid intrusion detection approach.
* Worked with data preprocessing and feature handling.
* Contributed to integrating signature-based detection with machine-learning-based classification.
* Worked on evaluating and analyzing the system results.

## Project Workflow

```text
Simulated Network Dataset
          ↓
   Signature-Based Rules
          ↓
    Known Attack Detection
          ↓
    Random Forest Model
          ↓
      ML Probability
          ↓
   Hybrid Decision Logic
          ↓
     Performance Evaluation
```

## Conclusion

This project demonstrates the application of both traditional signature-based techniques and machine learning for network intrusion detection. It provided practical experience in MATLAB, machine learning, classification, performance evaluation and cybersecurity concepts.


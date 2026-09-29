# Hybrid Signature-Based Intrusion Detection System

## Project Overview

The Hybrid Signature-Based Intrusion Detection System is a network security project designed to detect malicious network activity by combining traditional signature-based detection with machine-learning-based detection.

The system uses predefined signatures to identify known attack patterns and network traffic that is not detected by the signature rules is further evaluated using a Random Forest machine learning model.. This hybrid approach helps combine rule-based detection with data-driven classification.

The final hybrid decision combines the outputs of both detection approaches.

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

1. Network traffic data is collected and prepared for analysis.
2. The data is preprocessed and relevant features are handled.
3. Signature-based rules are used to identify known attack patterns.
4. A Random Forest classifier is used for machine-learning-based classification.
5. The detection results are evaluated using performance metrics.

## Results

The implemented system achieved **93.33% accuracy** on the evaluated dataset.

## My Contribution

* Worked on the implementation of the hybrid intrusion detection approach.
* Worked with data preprocessing and feature handling.
* Contributed to integrating signature-based detection with machine-learning-based classification.
* Worked on evaluating and analyzing the system results.

## Project Structure

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

This project demonstrates the application of both traditional signature-based techniques and machine learning for network intrusion detection. It provided practical experience in Python, data processing, machine learning, and cybersecurity concepts.


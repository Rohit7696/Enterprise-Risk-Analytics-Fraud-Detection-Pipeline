# 🛡️ Enterprise Financial Integrity & Risk Mitigation Engine

### **Project Overview**
This project delivers a high-performance **End-to-End Data Pipeline** designed to identify and mitigate financial fraud in real-time. By integrating **SQL-based Data Engineering**, **Python-driven Machine Learning**, and **Executive Business Intelligence**, the system provides a robust defense against 1M+ suspicious transactional records.

---

## 📈 Executive Business Insights
* **The "Value-Threshold" Discovery:** Identified a critical segment where transactions exceeding **12.7x the median price** have a **63.59% fraud probability** (vs. 8.7% baseline).
* **Digital Channel Vulnerability:** Quantified a **10x increase in risk** for Online vs. Offline channels, supporting the case for enhanced 2FA on digital portals.
* **Proprietary Risk Scoring:** Developed a weighted scoring algorithm that serves as the #1 lead indicator for fraudulent activity.

---

## 🏗️ Technical Architecture & Pipeline

### 1. Data Engineering Layer (SQL)
Managed 1M+ records in a MySQL environment. Performed schema optimization and utilized **Common Table Expressions (CTEs)** to extract behavioral features.
* **Key Tech:** MySQL, Window Functions, Data Ingestion.

### 2. Intelligence Layer (Python/ML)
Built a **Random Forest Classifier** optimized for high-stakes financial environments.
* **Feature Engineering:** Created a custom `risk_score` combining spatial and behavioral variables.
* **Performance:** Achieved **100% Precision and Recall**, ensuring zero financial leakage.

### 3. Business Intelligence Layer (Power BI)
Architected an Executive Dashboard to translate complex ML outputs into actionable strategy.

---

## 📊 Insight Discovery & Visualization

### A. Feature Correlation & Risk Drivers
The heatmap below illustrates the strong correlation between **Price Variance (Ratio to Median)** and fraudulent outcomes.

![Correlation Heatmap](dashboard/screenshot/correlation_heatmap.png) 
*Insight: Identified that Distance and Price Ratio are the primary non-linear drivers of risk.*

### B. High-Value Segment Analysis
The Violin Plot highlights the "Smoking Gun"—fraudulent activity is almost exclusively concentrated in high-value outliers.

![Price Ratio Distribution](dashboard/screenshot/violin_plot.png)
*Insight: Transactions in the 99th percentile of price variance represent over 60% of total fraud volume.*

### C. Digital Risk Landscape
A clear visualization of why Digital Transformation requires advanced security protocols.

![Online vs Offline Risk](dashboard/screenshot/bar_chart.png)
*Insight: Online transactions carry a 13% inherent risk rate compared to <2% for physical chip-based transactions.*

---

## 🛠️ Model Performance Report
| Metric | Score |
| :--- | :--- |
| **Accuracy** | 1.00 |
| **Precision (Fraud)** | 1.00 |
| **Recall (Fraud)** | 1.00 |
| **F1-Score** | 1.00 |

> **Consultant Note:** While 100% accuracy is achieved here due to strong feature signals, in production, we prioritize **Recall** to ensure zero high-value fraud cases go undetected.

---

## 📂 Repository Structure
* `/sql_scripts`: Database schema and analytical queries.
* `/notebooks`: Python EDA and Machine Learning model.
* `/dashboards`: Power BI file and executive screenshots.

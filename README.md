# 🏥 Healthcare Insurance Cost Analysis & Prediction

![Python](https://img.shields.io/badge/Python-3.10-blue)
![ML](https://img.shields.io/badge/Machine%20Learning-Model-green)
![SQL](https://img.shields.io/badge/SQL-Analysis-orange)
![Streamlit](https://img.shields.io/badge/Streamlit-App-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

A complete **end-to-end Data Analytics + Machine Learning project** that analyzes healthcare insurance data and predicts medical costs using real-world features such as age, BMI, smoking habits, and region.

---

## 📌 Project Overview

This project integrates multiple tools and technologies:

- 📊 Exploratory Data Analysis (EDA)
- 🧠 Machine Learning Model
- 🗄️ SQL-Based Data Analysis
- 📈 Power BI & Excel Dashboards
- 🌐 Interactive Streamlit Web Application

➡️ Delivering a **full-stack data analytics solution**

---

## 🎯 Objectives

- Understand factors affecting medical insurance costs  
- Identify high-risk customer segments  
- Build a predictive model for insurance charges  
- Present insights through dashboards and web app  

---

## 📂 Project Structure

```bash
healthcare-insurance-analysis/
│
├── data/ # Dataset (insurance.csv)
├── python_analysis/ # EDA & preprocessing
├── sql_analysis/ # SQL queries
├── excel_dashboard/ # Excel dashboard
├── powerbi_dashboard/ # Power BI dashboard
├── model/ # Trained ML model (.pkl)
├── streamlit_app/ # Streamlit app
├── app/ / src/ # Supporting scripts
├── visuals/ # Charts & assets
├── requirements.txt # Dependencies
└── README.md # Documentation
```

## Dataset Description

The dataset contains the following features:

Feature	Description
age -	Age of the individual
sex	- Gender (male/female)
bmi	- Body Mass Index
children - Number of dependents
smoker -	Smoking status
region - Residential region
charges -	Medical insurance cost

## Key Insights
🚬 Smokers have significantly higher insurance costs
⚖️ Higher BMI → Higher medical expenses
👨‍👩‍👧 More children slightly increase cost
🌍 Region has minimal impact compared to smoking

## Machine Learning Model
Model trained to predict insurance charges
Input features:
Age
Sex
BMI
Children
Smoker
Region
Handles:
Raw categorical input (pipeline model)
Legacy encoded input (fallback)

## Streamlit Web App
Features:
📊 Dataset Explorer
📈 Visual Insights
💰 Insurance Cost Predictor
Run the app:
cd streamlit_app
streamlit run medicalinsurance_frontend.py

## Installation & Setup
1. Clone Repository
git clone https://github.com/your-username/healthcare-insurance-analysis.git
cd healthcare-insurance-analysis

2. Create Virtual Environment
python -m venv .venv
.venv\Scripts\activate   # Windows

3. Install Dependencies
pip install -r requirements.txt

## SQL Analysis

SQL file: sql_analysis/insurance_queries.sql

Includes:

Data cleaning checks
Aggregations
Business insights
High-risk segmentation
Example Insight Query:
SELECT smoker, AVG(charges)
FROM insurance
GROUP BY smoker;

## Dashboards
📈 Excel Dashboard
KPI metrics
Pivot analysis
Visual charts
<img width="1525" height="1097" alt="Screenshot 2026-03-28 175318" src="https://github.com/user-attachments/assets/e6826a19-7116-4aa6-8837-af1d50220e4e" />

📊 Power BI Dashboard
Interactive filters
Segment analysis
Business insights
<img width="2101" height="1176" alt="Screenshot 2026-03-28 202119" src="https://github.com/user-attachments/assets/fabea706-64d0-46d0-a67e-8fb2d8947d54" />

## Future Improvements
Deploy Streamlit app online (Streamlit Cloud / Render)
Add model performance metrics (R², RMSE)
Use advanced models (XGBoost, Random Forest)
Add user authentication
Connect real-time database

## Tech Stack
Python (Pandas, NumPy, Scikit-learn)
SQL (MySQL)
Streamlit
Power BI
Excel

## Use Cases
Insurance companies → Risk assessment
Healthcare analytics → Cost prediction
Data science portfolio project
Business decision support

## Author

Amrutha Thalla

Data Analyst | AI Engineer | ML Enthusiast
⭐ If you like this project

Give it a ⭐ on GitHub and share it!

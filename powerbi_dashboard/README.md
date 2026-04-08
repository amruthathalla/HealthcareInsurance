# Healthcare Insurance Cost Dashboard (Power BI)

## Project Overview

This project presents an interactive dashboard built using **Power BI** to analyze healthcare insurance data. The goal was to identify key factors influencing insurance charges and highlight high-risk customer segments.

## Objectives

- Analyze how factors like smoking, BMI, age, and region affect insurance costs
- Identify high-risk customers based on health and lifestyle conditions
- Build a clean and interactive dashboard for data-driven decision making

## Dataset

- **Source**: Insurance dataset (CSV file)
- **Total Records**: 1,338
- **Features**:
  - Age
  - Sex
  - BMI
  - Number of Children
  - Smoker Status
  - Region
  - Charges

## Data Preparation (DAX Calculated Columns)

To enhance analysis, the following columns were created:

### 🔹 BMI Category
Categorized BMI values into:
- Underweight
- Normal
- Overweight
- Obese

### 🔹 Age Band
Grouped ages into:
- 18–25
- 26–35
- 36–45
- 46–55
- 56–65
- 66+

### 🔹 High Risk Flag
Defined high-risk customers as:
- Smoker AND Obese
- Values: 1 (High Risk), 0 (Not High Risk)

## Measures Created (DAX)

- `Total Customers = COUNTROWS(insurance)`
- `Average Charges = AVERAGE(insurance[charges])`
- `Median Charges = MEDIAN(insurance[charges])`
- `Smoker % = % of customers who smoke`
- `High Risk % = % of high-risk customers`

## Dashboard Features

### KPI Section
- Total Customers
- Average Charges
- Median Charges
- Smoker Percentage
- High Risk Percentage

### Visualizations

- **Avg Charges by Smoker** – Shows strong cost difference between smokers and non‑smokers
- **Avg Charges by BMI Category** – Highlights higher costs for obese individuals
- **Avg Charges by Age Band** – Displays increasing trend with age
- **Avg Charges by Region** – Shows regional variations
- **Scatter Plot (BMI vs Charges)** – Demonstrates relationship between BMI and insurance cost, highlighting clustering of smokers at higher charge levels

### Interactivity

Slicers were added for dynamic filtering:
- Region
- Sex
- Smoker
- Age Band
- BMI Category

This allows users to explore the data interactively and customize insights.

## Dashboard Design

- **Structured layout**:
  - Top → KPI cards
  - Middle → Key comparisons
  - Bottom → Detailed insights
  - Right → Slicers
- Consistent color theme
- Clear titles and labels
- Clean and user‑friendly interface

## Key Insights

- Smokers incur significantly higher insurance charges compared to non‑smokers
- Obese individuals tend to have higher medical costs
- Insurance charges increase with age
- High‑risk customers (smoker + obese) form a small but critical segment
- Region has relatively minor impact on charges

## Dashboard Preview

<img width="2101" height="1176" alt="Screenshot 2026-03-28 202119" src="https://github.com/user-attachments/assets/fa2e442a-183d-4f45-9edc-19ab7195b08d" />


## Tools Used

- Power BI
- DAX (Data Analysis Expressions)
- Data Visualization Techniques

# Healthcare Insurance Analysis

This project performs a complete analysis of medical insurance charges, including data cleaning, exploratory data analysis (EDA), feature engineering, machine learning modeling, and an interactive web application. The analysis is implemented in Python (Jupyter Notebook) and also provided as SQL queries for database users. A Streamlit app allows non‑technical users to explore the dataset and predict insurance costs.

## Overview

The goal is to understand which factors influence medical insurance costs and to build a predictive model. Key questions answered:

- Does smoking increase insurance costs?
- How does BMI affect charges?
- Which demographic groups have higher medical charges?
- Can we predict insurance costs from patient data?

## The project follows a complete data science workflow:

1. **Data Cleaning** – missing values, duplicates, inconsistent categories.
2. **Univariate Analysis** – distributions of age, BMI, children, charges.
3. **Outlier Detection** – boxplots and IQR method.
4. **Feature Engineering** – BMI category, age band, high‑risk flag.
5. **Bivariate & Multivariate Analysis** – relationships between features and charges.
6. **Machine Learning Model** – Linear Regression pipeline with one‑hot encoding.
7. **Model Export** – saved for the Streamlit app.
8. **SQL Analysis** – replicate core insights in SQL.
9. **Streamlit App** – interactive dataset explorer and cost predictor.

## Project Structure
healthcare-insurance-analysis/
├── data/insurance.csv
├── model/medical_cost_model.pkl
├── app/app.py
├── python_analysis/analysis.ipynb
├── sql_analysis/insurance_analysis.sql
└── README.md

## Dataset

The dataset (`insurance.csv`) contains 1,338 records with the following columns:

| Column     | Description                                      |
|------------|--------------------------------------------------|
| `age`      | Age of primary beneficiary (integer)             |
| `sex`      | Gender: male / female                            |
| `bmi`      | Body Mass Index (kg/m²)                          |
| `children` | Number of children covered by insurance          |
| `smoker`   | Smoking status: yes / no                         |
| `region`   | Residential region: northeast, northwest, southeast, southwest |
| `charges`  | Individual medical costs billed by insurance (target variable) |

## Python Analysis (Jupyter Notebook)

The notebook `analysis.ipynb` contains the full analysis with detailed markdown explanations and visualisations.

### Key Steps and Insights

1. **Data Cleaning**  
   - No missing values found.  
   - One duplicate row removed.  
   - Categorical values are consistent.

2. **Univariate Analysis**  
   - Age: mostly 18–40 years.  
   - BMI: many individuals in overweight range (25–30).  
   - Children: most have 0–2 children.  
   - Charges: right‑skewed – a small number of very high costs.

3. **Outlier Detection**  
   - Charges have 139 outliers above ~$34,500 (IQR method).  
   - These likely represent real high‑cost cases (major surgery, chronic illness).  
   - Outliers were kept because they are realistic in healthcare data.

4. **Feature Engineering**  
   - `bmi_category`: Underweight / Normal / Overweight / Obese.  
   - `age_band`: 18‑25, 26‑35, 36‑45, 46‑55, 56‑65.  
   - `is_high_risk`: 1 if smoker and obese, else 0.

5. **Bivariate Analysis**  
   - **Smoking** has the strongest effect – smokers pay 3–4 times more.  
   - **Age** positively correlates with charges.  
   - **BMI** has a moderate positive relationship.  
   - Region and children have minimal impact.

6. **Multivariate Analysis**  
   - The highest‑cost segment is **smoker + obese**.  
   - Age and BMI together gradually increase costs.  
   - Regional differences remain small compared to lifestyle factors.

7. **Machine Learning Model**  
   - **Algorithm**: Linear Regression.  
   - **Preprocessing**: One‑hot encoding for `sex`, `smoker`, `region`; numeric features passed through.  
   - **Pipeline**: `ColumnTransformer` + `LinearRegression`.  
   - **Evaluation** (test set, 20% holdout):  
     - MAE: ~$4,200  
     - RMSE: ~$6,000  
     - R²: ~0.78  
   - **Model saved** as `medical_cost_model.pkl`.

## SQL Analysis

The file `insurance_analysis.sql` replicates the core insights using SQL queries. It includes:

- Database and table creation.
- Data loading (MySQL `LOAD DATA INFILE`).
- Data quality checks (null counts, distinct values).
- Baseline metrics (average, min, max charges).
- Group‑by comparisons: smoker vs non‑smoker, region, age, BMI category, children.
- High‑cost and high‑risk segment identification.
- Combined segment table (smoker × BMI category).

This allows analysts who prefer SQL to obtain the same business insights without Python.

## Streamlit Web Application

The `app.py` file provides an interactive web interface with two tabs:

### 1. Explorer Tab
- Displays the first 10 rows of the dataset.
- Shows total records, average charges, and median charges.
- Bar charts for average charges by smoker status and by region.

### 2. Predictor Tab
- User inputs: age, BMI, children, sex, smoking status, region.
- Predicts insurance cost using the trained Linear Regression model.
- Displays risk notes when smoking or high BMI is detected.

## Installation and Requirements

### Prerequisites
- Python 3.8+ (for Jupyter notebook and Streamlit)
- MySQL (for SQL analysis, optional)
- Required Python packages (see below)

### Install Python Dependencies
pip install pandas numpy matplotlib seaborn scikit-learn streamlit
For the Jupyter notebook, also install jupyter if needed.

**How to Run**
**1. Run the Jupyter Notebook**
bash
cd python_analysis
jupyter notebook analysis.ipynb
Execute cells sequentially. The model will be saved to ../model/medical_cost_model.pkl.

**2. Run the Streamlit App**
From the project root directory:
streamlit run app/app.py
Then open http://localhost:8501 in your browser.

**3. Run SQL Analysis (MySQL)**
Ensure MySQL is installed and running.
Update the LOAD DATA INFILE path in insurance_analysis.sql to point to your insurance.csv file.
Execute the script in a MySQL client (e.g., MySQL Workbench, command line).

## Results and Recommendations
Smoking is the strongest cost driver – insurance companies should heavily weight smoking status in pricing.
Age and BMI are secondary but significant factors.
Region and number of children have little impact – resources can be focused elsewhere.
The highest‑cost segment is smokers with obesity. Targeted wellness programs could reduce risk.
The linear regression model provides a simple, explainable baseline with reasonable predictive performance (R² ~0.78).

## Future Work
Experiment with non‑linear models (Random Forest, XGBoost).
Include interaction features (e.g., smoker * bmi).
Log‑transform the target variable to handle skewness.
Add more features (family history, pre‑existing conditions).
Deploy the Streamlit app on a cloud platform (Streamlit Cloud, Heroku).

## License
This project is open‑source and available under the MIT License.

## Acknowledgements
Dataset: Medical Cost Personal Dataset on Kaggle.
Built with Python, scikit‑learn, Streamlit, and the scientific Python stack.

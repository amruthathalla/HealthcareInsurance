# Healthcare Insurance Cost Analysis

This project explores the factors that influence medical insurance charges using a publicly available dataset. The goal is to identify key drivers of insurance costs and build a predictive model that estimates charges based on patient characteristics. A Streamlit web application is also provided for interactive exploration and cost prediction.

## Business Problem

Insurance companies need to understand which factors influence medical charges to price policies correctly. This analysis answers questions such as:

- Does smoking increase insurance costs?
- Does BMI affect healthcare expenses?
- Which demographic groups have higher medical charges?
- Can we build a model to predict insurance costs from patient data?

## Dataset

The dataset (`insurance.csv`) contains 1,338 records with the following features:

- `age`: Age of the primary beneficiary
- `sex`: Gender (male/female)
- `bmi`: Body Mass Index (kg/m²)
- `children`: Number of children covered by health insurance
- `smoker`: Smoking status (yes/no)
- `region`: Residential region in the US (northeast, northwest, southeast, southwest)
- `charges`: Individual medical costs billed by health insurance (target variable)

## Analysis Steps

The Jupyter notebook walks through a complete data science workflow:

1. **Data Cleaning**: Check for missing values, duplicates, and inconsistent categories.
2. **Univariate Analysis**: Distributions of age, BMI, children, charges, and categorical variables.
3. **Outlier Detection**: Use boxplots and IQR method to identify extreme values in charges.
4. **Feature Engineering**: Create new columns:
   - `bmi_category`: Underweight / Normal / Overweight / Obese
   - `age_band`: Age ranges (18-25, 26-35, etc.)
   - `is_high_risk`: 1 if smoker and obese, else 0
5. **Bivariate Analysis**: Relationship between each feature and charges.
6. **Multivariate Analysis**: Combined effects (e.g., smoker + BMI category vs charges).
7. **Machine Learning Model**: Linear Regression with one‑hot encoding to predict charges.
8. **Model Evaluation**: MAE, RMSE, R².
9. **Model Export**: Save the trained model for the Streamlit app.

## Key Insights

- **Smoking** is the strongest driver of insurance costs – smokers pay 3‑4 times more than non‑smokers.
- **Age** positively correlates with charges; older individuals generally pay more.
- **Higher BMI** tends to increase costs, especially in combination with smoking.
- **Region** and **number of children** have minimal impact.
- The highest‑cost segment is **smoker + obese**.
- The linear regression model explains a reasonable portion of variance in charges (R² ~0.78) with an average error of about $4,200.

## Machine Learning Model

- **Algorithm**: Linear Regression
- **Preprocessing**: One‑hot encoding for categorical features (`sex`, `smoker`, `region`); numeric features (`age`, `bmi`, `children`) passed through.
- **Pipeline**: `ColumnTransformer` + `LinearRegression` in a single scikit‑learn pipeline.
- **Evaluation Metrics** (on test set):
  - MAE (Mean Absolute Error): ~$4,200
  - RMSE (Root Mean Squared Error): ~$6,000
  - R²: ~0.78

The model is saved as `medical_cost_model.pkl` for use in the Streamlit app.

## Streamlit Web Application

The app (`app.py`) provides two main tabs:

### 1. Explorer Tab
- Displays a preview of the dataset.
- Shows total records, average charges, and median charges.
- Bar charts for average charges by smoker status and by region.

### 2. Predictor Tab
- Interactive form to enter patient details: age, BMI, children, sex, smoking status, region.
- Predicts insurance cost using the trained model.
- Displays risk notes when smoking or high BMI is detected.

## Project Structure
healthcare-insurance-analysis/
├── data/
│ └── insurance.csv
├── model/
│ └── medical_cost_model.pkl
├── app/
│ └── app.py
├── python_analysis/
│ └── analysis.ipynb
└── README.md

## Requirements

**Install the required Python packages:**
pip install pandas numpy matplotlib seaborn scikit-learn streamlit

**How to Run**
**1. Run the Jupyter Notebook**
Open python_analysis/analysis.ipynb in Jupyter Lab/Notebook and execute cells sequentially.
This will generate the model and save it to model/medical_cost_model.pkl.

**2. Run the Streamlit App**
From the project root directory:
streamlit run app/app.py
Then open the URL shown (usually http://localhost:8501) in your browser.

## Results and Recommendations
**For insurance companies:** Smoking status should be a primary pricing factor. Policies should also account for age and BMI, especially for smokers.

**For future work:** Explore non‑linear models (Random Forest, XGBoost) and include interaction features (e.g., smoker × bmi). Consider log‑transforming the target variable to handle skewness.

## Future Improvements
Add more features (e.g., family history, pre‑existing conditions).
Try regularisation (Ridge, Lasso) to reduce overfitting.
Deploy the Streamlit app on a cloud platform (e.g., Streamlit Cloud, Heroku).
Add a "What‑If" analysis tool in the app.

## License
This project is open‑source and available under the MIT License.

## Acknowledgements
Dataset: Medical Cost Personal Dataset on Kaggle
Built with Python, scikit‑learn, Streamlit, and the scientific Python stack.

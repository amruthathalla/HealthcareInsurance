# Healthcare Insurance Analysis App

A beginner-friendly **Streamlit** web application for exploring medical insurance data and predicting individual insurance costs based on personal characteristics. The app loads a pre‑trained machine learning model (linear regression or similar) and provides two main views:

- **Explorer** – browse the dataset, view summary statistics, and see average charges by smoker status and region.
- **Predictor** – enter age, BMI, number of children, sex, smoking status, and region to get an estimated insurance charge.

![App screenshot placeholder](https://via.placeholder.com/800x400?text=Healthcare+Insurance+App)

## Features

- **Dataset Explorer**  
  - Displays the first 10 rows of the `insurance.csv` dataset.  
  - Shows total records, average charges, and median charges.  
  - Bar charts for average charges by `smoker` and by `region`.

- **Cost Predictor**  
  - Interactive form with number inputs, select boxes, and a predict button.  
  - Uses a trained model (loaded from `medical_cost_model.pkl`) to estimate charges.  
  - Handles two model versions automatically (legacy one‑hot encoded input vs. raw pipeline).  
  - Displays risk notes when smoking or high BMI is present.

## Project Structure
.
├── app/
│ └── app.py # Main Streamlit application (the code you provided)
├── model/
│ └── medical_cost_model.pkl # Pre‑trained model (pickle file)
├── data/
│ └── insurance.csv # Raw dataset (optional – only needed for Explorer tab)
└── README.md

text

> **Note**: The code assumes that `medical_cost_model.pkl` and `insurance.csv` are located one directory above the script (i.e., `PROJECT_ROOT = Path(__file__).resolve().parents[1]`). Adjust the paths or place your files accordingly.

## Installation

1. **Clone or download** this repository.

2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate      # Linux/macOS
   venv\Scripts\activate         # Windows
Install required packages:

bash
pip install streamlit pandas
The code also uses pathlib and pickle, which are part of the Python standard library.

Prepare the model and data:

Place your trained model pickle file at model/medical_cost_model.pkl.

(Optional) Place insurance.csv at data/insurance.csv if you want to use the Explorer tab.

If you do not have a model yet, you can train one using the same insurance.csv dataset (e.g., with linear regression and one‑hot encoding) and save it as medical_cost_model.pkl. The predictor will work as long as the model expects either:

Raw columns: age, sex, bmi, children, smoker, region (recommended), or

Manually encoded columns: age, bmi, children, sex_male, smoker_yes, region_northwest, region_southeast, region_southwest.

Usage
Run the Streamlit app from the terminal:

bash
streamlit run app/app.py
If your script is named differently or located elsewhere, adjust the path accordingly.

Once running, open your browser at the local URL shown (usually http://localhost:8501). You will see two tabs:

Explorer – works only if insurance.csv is present.

Predictor – works as long as the model file exists.

Example Prediction
Age: 30

BMI: 27.5

Children: 1

Sex: male

Smoker: yes

Region: southeast

Click Predict Insurance Cost to see an estimated charge, e.g., $23,450.00. The app also shows a risk note when smoking or high BMI is detected.

Customisation
Model retraining: Replace model/medical_cost_model.pkl with your own model. Ensure the input format matches the one expected by the predict() method. The code tries raw input first (age, sex, bmi, children, smoker, region) and falls back to the legacy encoded format.

Data source: Modify DATA_PATH in the script to point to a different CSV file.

UI layout: Change colours, add more plots, or include additional metrics by editing the Streamlit calls.

Troubleshooting
Problem	Likely solution
FileNotFoundError for model	Verify that medical_cost_model.pkl exists at the expected path (model/ folder one level above the script).
Explorer tab shows warning	Place insurance.csv in the data/ folder (one level above the script) or remove the warning by commenting out the st.warning.
Prediction fails with both input formats	Check your model’s expected feature names and number of features. Update build_input_for_legacy_model or the raw input DataFrame to match.
Module not found	Install missing packages: pip install streamlit pandas.
License
This project is open‑source and available under the MIT License. Feel free to use, modify, and distribute it.

Acknowledgements
Built with Streamlit

Dataset: typical insurance.csv from medical cost personal datasets (e.g., Kaggle Medical Cost Personal Dataset)

Created as a beginner‑friendly example for healthcare analytics and machine learning deployment.

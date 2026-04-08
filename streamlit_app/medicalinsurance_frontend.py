from pathlib import Path
import pickle

import pandas as pd
import streamlit as st

PROJECT_ROOT = Path(__file__).resolve().parents[1]
MODEL_PATH = Path("D:/healthcare-insurance-analysis/model/medical_cost_model.pkl")
DATA_PATH = PROJECT_ROOT / "data" / "insurance.csv"


@st.cache_resource
def load_model():
    with open(MODEL_PATH, "rb") as f:
        return pickle.load(f)


@st.cache_data
def load_data():
    if DATA_PATH.exists():
        return pd.read_csv(DATA_PATH)
    return None


def build_input_for_legacy_model(age, sex, bmi, children, smoker, region):
    return pd.DataFrame(
        [
            {
                "age": age,
                "bmi": bmi,
                "children": children,
                "sex_male": 1 if sex == "male" else 0,
                "smoker_yes": 1 if smoker == "yes" else 0,
                "region_northwest": 1 if region == "northwest" else 0,
                "region_southeast": 1 if region == "southeast" else 0,
                "region_southwest": 1 if region == "southwest" else 0,
            }
        ]
    )


st.set_page_config(page_title="Healthcare Insurance Analysis App", layout="wide")
st.title("Healthcare Insurance Analysis App")
st.caption("Dataset explorer + Insurance cost predictor")

model = load_model()
df = load_data()

tab1, tab2 = st.tabs(["Explorer", "Predictor"])

with tab1:
    st.subheader("Dataset Explorer")
    if df is None:
        st.warning("Dataset file not found at data/insurance.csv")
    else:
        st.write("Quick snapshot of the dataset:")
        st.dataframe(df.head(10), use_container_width=True)

        c1, c2, c3 = st.columns(3)
        c1.metric("Total records", f"{len(df):,}")
        c2.metric("Average charges", f"${df['charges'].mean():,.2f}")
        c3.metric("Median charges", f"${df['charges'].median():,.2f}")

        st.markdown("### Average charges by smoker status")
        smoker_avg = df.groupby("smoker", as_index=False)["charges"].mean()
        st.bar_chart(smoker_avg.set_index("smoker"))

        st.markdown("### Average charges by region")
        region_avg = df.groupby("region", as_index=False)["charges"].mean()
        st.bar_chart(region_avg.set_index("region"))

with tab2:
    st.subheader("Insurance Cost Predictor")
    st.write("Enter person details and estimate medical insurance charges.")

    col1, col2 = st.columns(2)
    with col1:
        age = st.number_input("Age", min_value=18, max_value=100, value=30)
        bmi = st.number_input("BMI", min_value=10.0, max_value=60.0, value=25.0)
        children = st.number_input("Number of Children", min_value=0, max_value=10, value=0)

    with col2:
        sex = st.selectbox("Sex", ["male", "female"])
        smoker = st.selectbox("Smoker", ["yes", "no"])
        region = st.selectbox("Region", ["northeast", "northwest", "southeast", "southwest"])

    if st.button("Predict Insurance Cost"):
        # Raw input schema for pipeline-based model (Phase 6 retrained model).
        input_raw = pd.DataFrame(
            [
                {
                    "age": age,
                    "sex": sex,
                    "bmi": bmi,
                    "children": children,
                    "smoker": smoker,
                    "region": region,
                }
            ]
        )

        try:
            prediction = model.predict(input_raw)[0]
        except Exception:
            # Backward compatibility: older model expects manually encoded columns.
            input_legacy = build_input_for_legacy_model(age, sex, bmi, children, smoker, region)
            prediction = model.predict(input_legacy)[0]

        st.success(f"Estimated Insurance Cost: ${prediction:,.2f}")

        if smoker == "yes" and bmi >= 30:
            st.info("Risk note: smoker + high BMI usually belongs to a higher-cost segment.")
        elif smoker == "yes":
            st.info("Risk note: smoking is one of the strongest cost drivers in this dataset.")
        elif bmi >= 30:
            st.info("Risk note: higher BMI tends to increase insurance charges.")
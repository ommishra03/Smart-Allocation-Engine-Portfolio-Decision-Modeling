import streamlit as st
import pandas as pd
import plotly.express as px


# PAGE SETUP

st.set_page_config(layout="wide", page_title="Alpha Engine")


# LOAD DATA

@st.cache_data
def load_data():
    return pd.read_csv("../portfolio_output.csv")

df = load_data()

st.title("Smart Portfolio Allocation Engine")


# SIDEBAR FILTERS

st.sidebar.header("Global Filters")

min_conf = st.sidebar.slider(
    "Minimum Confidence",
    0.0, 1.0, 0.5
)


#  APPLY CONFIDENCE FILTER FIRST

filtered = df[df["Confidence"] >= min_conf].copy()


#DYNAMIC SIGNAL ENGINE (Single Version Only)

if not filtered.empty:

    weights = filtered["Allocation_Weight"]

    # Guard against unstable quantiles when few rows
    if len(weights) >= 5:
        q90 = weights.quantile(0.90)
        q60 = weights.quantile(0.60)
        q30 = weights.quantile(0.30)
    else:
        q90, q60, q30 = weights.max(), weights.mean(), weights.min()

    def classify_signal(x):
        if x == 0:
            return "SELL"
        elif x >= q90:
            return "STRONG BUY"
        elif x >= q60:
            return "BUY"
        elif x >= q30:
            return "HOLD"
        else:
            return "REDUCE"

    filtered["Signal"] = filtered["Allocation_Weight"].apply(classify_signal)

    # Sidebar signal selector
    signals = ["ALL"] + sorted(filtered["Signal"].unique())
    signal_option = st.sidebar.selectbox("Signal Type", signals)

    if signal_option != "ALL":
        filtered = filtered[filtered["Signal"] == signal_option]


#  PRIMARY TABLE

if filtered.empty:
    st.warning("No tickers match the current filter.")
    st.stop()

st.subheader("Top Allocation Signals")

top_picks = filtered.sort_values(
    "Allocation_Weight",
    ascending=False
).head(20)

st.dataframe(
    top_picks[["Ticker","Predicted_Growth","Confidence","Signal","Allocation_Weight"]]
    .style.format({
        "Predicted_Growth":"{:.2%}",
        "Confidence":"{:.2%}",
        "Allocation_Weight":"{:.4f}"
    }),
    use_container_width=True
)

st.divider()


# VISUAL ANALYTICS

col1, col2 = st.columns(2)

with col1:
    st.subheader("Allocation Weight by Ticker")

    fig_bar = px.bar(
        top_picks,
        x="Ticker",
        y="Allocation_Weight",
        color="Signal",
        color_discrete_map={
            "STRONG BUY":"#00CC96",
            "BUY":"#636EFA",
            "HOLD":"#FFA15A",
            "REDUCE":"#EF553B",
            "SELL":"#AB63FA"
        }
    )

    st.plotly_chart(fig_bar, use_container_width=True)

with col2:
    st.subheader("Alpha Map — Confidence vs Growth")

    fig_scatter = px.scatter(
        filtered,
        x="Predicted_Growth",
        y="Confidence",
        size="Allocation_Weight",
        hover_name="Ticker",
        color="Signal"
    )

    st.plotly_chart(fig_scatter, use_container_width=True)


# Growth Distribution

st.subheader("Growth Distribution")

fig_hist = px.histogram(
    filtered,
    x="Predicted_Growth",
    nbins=40
)

st.plotly_chart(fig_hist, use_container_width=True)

# CAPITAL ALLOCATION TREEMAP

st.subheader("Capital Allocation Treemap")

treemap_df = filtered[filtered["Allocation_Weight"] > 0]

if not treemap_df.empty:
    fig_tree = px.treemap(
        treemap_df,
        path=["Signal","Ticker"],
        values="Allocation_Weight",
        color="Signal",
        color_discrete_map={
            "STRONG BUY":"#00CC96",
            "BUY":"#636EFA",
            "HOLD":"#FFA15A",
            "REDUCE":"#EF553B",
            "SELL":"#AB63FA"
        }
    )

    st.plotly_chart(fig_tree, use_container_width=True)
else:
    st.info("No active allocations for this filter.")

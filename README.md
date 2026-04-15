# 📈 Smart Allocation Engine — Portfolio Decision Modeling

> **An Institutional-Grade Quant Framework for Risk-Aware Capital Distribution.**

[![Live App](https://img.shields.io/badge/Live_App-Streamlit-FF4B4B?style=for-the-badge&logo=streamlit&logoColor=white)](https://smart-allocation-engine-portfolio-decision-modeling.streamlit.app/)
[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![ML Stack](https://img.shields.io/badge/Stack-Ensemble_ML-00599C?style=for-the-badge)](https://github.com/ommishra03/Smart-Allocation-Engine-Portfolio-Decision-Modeling)
[![Status](https://img.shields.io/badge/Status-Actively_Evolving-brightgreen?style=for-the-badge)](https://github.com/ommishra03/Smart-Allocation-Engine-Portfolio-Decision-Modeling)

---

## 🚀 Executive Summary

The Smart Allocation Engine is a **quantitative research system** that models intelligent capital distribution across financial assets using a combination of SQL data engineering, analyst-validated financial signals, stacked ensemble machine learning, and LSTM-based momentum modeling.

The system is built around a single principle that separates serious portfolio systems from simple return-chasing tools: **preserve capital first, optimize returns second.**

It is fully deployed as a live Streamlit dashboard, producing actionable allocation signals — from `STRONG BUY` to `SELL` — backed by confidence-weighted growth predictions and explainable quantitative reasoning.

🔗 **Live App:** [smart-allocation-engine-portfolio-decision-modeling.streamlit.app](https://smart-allocation-engine-portfolio-decision-modeling.streamlit.app/)

---

## 🎯 Problem Statement

Portfolio managers and individual investors face a structurally difficult challenge: **most allocation systems optimize for past performance, not forward-looking risk-adjusted returns.**

The real-world problems this engine addresses:

| Problem | Consequence |
|---------|-------------|
| Overweight allocation to volatile assets | Outsized drawdowns during market stress |
| No forward earnings signal | Portfolios built on lagging indicators |
| Manual, gut-driven asset selection | Inconsistent decisions, no audit trail |
| Black-box optimization outputs | No explainability for risk committees |
| Static allocations | Inability to respond to changing financial health |

This system provides a **data-driven, transparent alternative** — one that mirrors how institutional quant research teams actually make allocation decisions.

---

## 💡 Solution Overview

The engine takes raw financial data and produces **ranked allocation weights** for each asset — not just a prediction, but a prioritized, confidence-scored decision.

The pipeline works in four sequential stages:

1. **SQL Data Layer** — cleans, normalizes, and aligns raw financial data into a canonical dataset
2. **Analyst Validation Layer (Excel)** — applies human-in-the-loop financial reasoning to flag anomalies and confirm signal integrity
3. **Python Quant Modeling Engine** — stacked ensemble ML + LSTM produces forward growth predictions and confidence scores
4. **Streamlit Decision Interface** — translates model outputs into visual allocation signals for real-time decision support

---

## 🏗️ System Architecture

```
Raw Financial Data (Multi-asset, Multi-period)
              │
              ▼
┌─────────────────────────────────┐
│     SQL: Data Engineering       │  ← Deduplication, normalization,
│                                 │    fiscal alignment, metric standardization
└─────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────┐
│  Excel: Analyst Validation      │  ← Earnings sanity checks,
│                                 │    profitability vs growth, stability review
└─────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────┐
│  Python: Quant Modeling Engine  │  ← Feature engineering, stacked ensemble,
│                                 │    LSTM momentum, allocation logic
└─────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────┐
│  Streamlit: Decision Dashboard  │  ← Alpha Map, Treemap, Signal Rankings,
│                                 │    Interactive filtering
└─────────────────────────────────┘
              │
              ▼
        Allocation Signals
  STRONG BUY → BUY → HOLD → REDUCE → SELL
```

---

## 🧩 Key Components

---

### 🔹 1. SQL — Canonical Data Layer

Before any modeling begins, the data must be trustworthy. SQL handles this systematically.

- **Deduplication** — removes duplicate entries across fiscal periods
- **Normalization** — standardizes financial metrics across companies and industries
- **Fiscal year alignment** — aligns multi-company datasets to a common reporting calendar
- **Metric standardization** — ensures revenue, earnings, and growth figures are on comparable scales
- **Feature preparation** — outputs a clean, model-ready table that feeds directly into Python

> The principle here: *garbage in, garbage out*. SQL is the filter that ensures downstream modeling starts from clean financial signals.

---

### 🔹 2. Excel — Analyst Intelligence Layer

Quantitative models benefit from human domain knowledge at the validation stage. Excel is used to mirror how real sell-side and buy-side analysts review model inputs:

- **Earnings sanity checks** — flag statistically unusual earnings figures before they contaminate predictions
- **Profitability vs Growth evaluation** — assess whether growth is accompanied by improving margins
- **Stability interpretation** — identify companies with erratic historical patterns that models may misread

This stage adds a layer of reasoning that pure automation cannot replicate — and documents it in a reviewable format.

---

### 🔹 3. Python — Quant Modeling Engine

The core of the system. Python converts validated financial data into predictive allocation intelligence.

**Feature Engineering**

| Feature Category | Description |
|-----------------|-------------|
| Temporal financial windows | Rolling metrics across 1Y, 3Y, 5Y horizons |
| Growth signal extraction | Forward-looking growth rate approximations |
| Stability scoring | Variance-adjusted consistency metrics |

**Machine Learning Stack**

| Model | Role |
|-------|------|
| Regression ensemble | Forward Net Income prediction |
| Classification ensemble | Growth direction confidence scoring |
| Stacked architecture | Meta-model combining regression + classification outputs |
| LSTM network | Captures temporal momentum patterns in financial time series |

**Allocation Logic**

```
Allocation Weight = f(Expected Growth × Confidence Score)
```

The product of expected growth and model confidence produces a single comparable signal per asset. These signals are then ranked and normalized into portfolio weights.

---

### 🔹 4. Streamlit — Live Decision Interface

The dashboard turns model outputs into a research-grade decision tool accessible to non-technical stakeholders:

| Visualization | Purpose |
|--------------|---------|
| **Alpha Map** | Growth vs Confidence scatter — identifies high-conviction opportunities |
| **Allocation Bar Chart** | Side-by-side weight comparison across assets |
| **Capital Flow Treemap** | Area-weighted view of portfolio concentration |
| **Growth Distribution** | Histogram of forward growth predictions across the universe |
| **Signal Rankings** | Sorted portfolio table with `BUY/HOLD/SELL` signals and weights |

---

## 📐 Financial & Mathematical Intuition

Understanding *why* the system is designed the way it is requires grounding in core portfolio theory.

### Risk vs. Return

Every investment decision involves a trade-off. Higher potential returns typically come with higher volatility (risk). A naive system maximizes return — but this ignores the possibility of severe losses. This engine explicitly models risk as a first-class input, not an afterthought.

### Portfolio Diversification

Combining assets that don't move in lockstep (low correlation) reduces portfolio volatility without proportionally reducing returns. The engine accounts for inter-asset relationships when distributing capital — concentrating in highly correlated assets defeats the purpose of having a portfolio.

### Sharpe Ratio — The Core Optimization Objective

```
Sharpe Ratio = (Portfolio Return − Risk-Free Rate) / Portfolio Volatility
```

A higher Sharpe Ratio means more return per unit of risk taken. The engine is oriented toward **maximizing risk-adjusted returns** — not raw returns — which is the standard objective in institutional portfolio management.

### Confidence-Weighted Allocation

Rather than allocating equally or by predicted return alone, the system weights allocations by **model confidence**. A high predicted return with low confidence gets less capital than a moderate return with high confidence. This mirrors how experienced portfolio managers think about position sizing.

---

## 📓 Notebooks Breakdown

| Notebook | Purpose |
|----------|---------|
| `01_eda.ipynb` | Exploratory Data Analysis — distributions, correlations, outlier profiling across financial metrics |
| `02_feature_engineering.ipynb` | Construction of temporal windows, growth signals, and stability scores from raw financials |
| `03_ml_modeling.ipynb` | Training regression and classification models; ensemble stacking; LSTM momentum embedding |
| `04_allocation_engine.ipynb` | Applying the `Growth × Confidence` allocation logic; weight normalization; signal generation |
| `05_dashboard_prep.ipynb` | Preparing final outputs for Streamlit: serializing model artifacts, formatting display data |

---

## 📂 Repository Structure

```
Smart-Allocation-Engine/
│
├── SQL/                        # Data engineering queries
│   ├── SQLQuery1.sql    # Deduplication, normalization
│   ├── SQLQuery2.sql    # Standardize reporting periods
│   └── SQLQuery3.sql        # Derived metrics for modeling
│
├── Excel/                      # Analyst validation workbooks
│   ├── smart_allocation_engine_raw_data.xlsx
│   └── smart_allocation_engine.xlsx
│
├── Python/                     # Core modeling pipeline 
│   ├── allocation_engine.py    # Weight generation logic
│   ├── lstm_momentum_embedding.h5
│   ├── lstm_sequence_scaler.pkl
│   └── app.py                  # Streamlit dashboard entry point
│
├── Power BI/                   # This part of the project is currently under development and will be updated soon.
│
├── app.py                      
├── requirements.txt            # Project dependencies
├── README.md                   # Project documentation
└── LICENSE                     # Usage & distribution terms
```

---

## 🛠️ Tech Stack

### Data Engineering
| Tool | Role |
|------|------|
| SQL (SQLite / PostgreSQL-compatible) | Canonical financial dataset construction |
| Excel | Analyst-layer validation and sanity checking |

### Modeling & Analytics
| Tool | Role |
|------|------|
| Python 3.9+ | Core language |
| Pandas, NumPy | Financial data manipulation, matrix operations |
| Scikit-learn | Regression, classification, ensemble stacking |
| XGBoost | High-performance gradient boosting for financial signals |
| TensorFlow / Keras | LSTM network for momentum sequence modeling |

### Visualization & Deployment
| Tool | Role |
|------|------|
| Plotly | Interactive charts (Alpha Map, Treemap, distributions) |
| Streamlit | Live research dashboard deployment |

---

## ✅ What Makes This Project Different

| Typical Portfolio Project | This System |
|--------------------------|-------------|
| ❌ Maximizes return only | ✅ Risk-first, confidence-weighted allocation |
| ❌ Static historical analysis | ✅ Forward earnings prediction with ML |
| ❌ Single model prediction | ✅ Stacked ensemble + LSTM temporal modeling |
| ❌ Notebook-only output | ✅ Fully deployed, interactive decision dashboard |
| ❌ No human validation layer | ✅ Analyst-layer Excel checks before modeling |
| ❌ Black-box signals | ✅ Explainable allocation logic with confidence scores |
| ❌ Simulated only | ✅ Live app accessible to real users today |

---

## 📈 Business Impact

This system has direct applications across financial services:

| Use Case | Description |
|----------|-------------|
| **Wealth Management** | Automated, explainable portfolio rebalancing for client accounts |
| **Quant Research** | Rapid-iteration platform for testing new allocation signals |
| **Fintech Products** | Core decision engine for robo-advisory applications |
| **Risk Committees** | Confidence scores and explainable outputs satisfy audit requirements |
| **Fund Management** | Pre-screening universe to identify high-conviction positions |

---

## 🔮 Future Enhancements

- [ ] **Market regime detection** — classify bull/bear/sideways environments and adjust allocation logic per regime
- [ ] **Stress-testing module** — simulate portfolio behavior under historical crash scenarios (2008, 2020, etc.)
- [ ] **Automated retraining pipeline** — periodic model refresh as new earnings data arrives
- [ ] **Advanced risk parity modeling** — allocate by contribution to portfolio volatility, not just signal strength
- [ ] **Real-time data integration** — connect to financial data APIs (Yahoo Finance, Alpha Vantage) for live signals
- [ ] **Multi-asset class extension** — expand beyond equities to fixed income and commodities
- [ ] **Factor exposure analysis** — decompose portfolio returns by value, momentum, quality factors

---

## 📄 Disclaimer

> This project is built for **educational and analytical exploration only**. It does not constitute financial or investment advice. All outputs are model-generated signals and should not be used as the sole basis for real investment decisions.

---

## 👨‍💻 Author

**Om Mishra**  
Reliance Foundation Scholar  
Data Analytics · Financial Modeling · Quant Research

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/om-mishra-a62991289)
[![GitHub](https://img.shields.io/badge/GitHub-ommishra03-black?style=for-the-badge&logo=github)](https://github.com/ommishra03)

---

*Built to demonstrate that serious portfolio systems require as much engineering discipline as financial intuition.*

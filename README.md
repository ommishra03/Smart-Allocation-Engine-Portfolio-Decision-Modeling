# Smart Allocation Engine – Portfolio Decision Modeling

A risk-aware portfolio analytics project focused on **capital preservation before return maximization**.  
The project evaluates how different asset allocations behave under varying market conditions, with emphasis on **downside risk, stability, and survivability**.

This repository is architected using an **industry-grade analytics pipeline** commonly followed by finance, risk, and data teams.

---

## 🎯 Core Philosophy

Most portfolio analyses focus on maximizing returns.

This project starts with a different question:

> **Which portfolios survive bad markets?**

The objective is to:
- Analyze asset allocations through a risk-first lens  
- Quantify volatility, drawdowns, and stability  
- Identify portfolios designed to protect capital  
- Build a scalable foundation for future allocation intelligence  

---

## 🏗️ Pipeline Architecture (Industry-Grade)

The project follows a deliberate, professional workflow:

```
SQL → Excel → Power BI → Python
```

---

### 🔹 STAGE 1 — SQL (Canonical Data Layer)

**Purpose:**  
Create a clean, auditable, and deterministic source of truth.

SQL is used as the **first logical step**, even when data originates from CSV or Excel files.

**Why SQL first?**
- Handles large datasets reliably  
- Ensures repeatable transformations  
- Prevents silent Excel formula errors  
- Acts as a single source of truth for all downstream tools  

**Key Responsibilities:**
- Remove duplicates  
- Standardize fiscal periods  
- Filter invalid or incomplete records  
- Normalize currencies and units  
- Recompute vendor-calculated fields  
- Create analysis-ready views  

👉 **Output:** Clean, trusted tables used everywhere else

---

### 🔹 STAGE 2 — Excel (Analyst Intelligence Layer)

**Purpose:**  
Introduce human judgement and financial reasoning.

Excel is **not** used for raw data processing.  
It consumes **SQL views**, not raw dumps.

**Excel is used for:**
- Financial sanity checks  
- Ratio logic and validation  
- Earnings quality flags  
- Edge-case investigation  
- Analyst intuition and judgement  

👉 This layer reflects how real analysts think, question, and validate numbers.

---

### 🔹 STAGE 3 — Power BI (Decision & Communication Layer)

**Purpose:**  
Translate analysis into decisions.

Power BI dashboards are designed for:
- Managers  
- Investors  
- Non-technical stakeholders  

**Dashboards answer questions like:**
- Which portfolios are stable?  
- Which are risky?  
- Where are drawdowns concentrated?  
- What are the early warning signals?  

👉 Power BI reads from **SQL or curated Excel models**, never unstructured CSVs.

---

### 🔹 STAGE 4 — Python (Modeling & Intelligence Layer)

**Purpose:**  
Extend analysis where spreadsheets stop.

Python is used for:
- Portfolio-level risk scoring  
- Volatility and drawdown modeling  
- Allocation logic and comparison  
- Scenario analysis and stress testing  
- Validation of Excel and BI outputs  

> Python **enhances and validates insights** — it does not replace SQL, Excel, or BI.

---

## 🛠️ Tools & Technologies

- **SQL** – Data cleaning, validation, and canonical views  
- **Excel** – Analyst reasoning and financial logic  
- **Power BI** – Interactive dashboards and storytelling  
- **Python** – Risk analysis and modeling  
  - pandas  
  - numpy  
  - matplotlib  

---

## 📌 Key Focus Areas

- Capital preservation over aggressive growth  
- Downside risk and volatility awareness  
- Asset allocation comparison  
- Analyst-style financial reasoning  
- Decision-oriented insights, not academic theory  

---

## 🚧 Project Status

🟡 **In Progress**

Current work includes:
- Dataset structuring and validation  
- Initial SQL cleaning logic  
- Excel-based financial checks  
- Power BI visualization framework  

Future updates will expand the project into a full allocation and decision engine.

---

## 🔮 Planned Enhancements

- Portfolio optimization techniques  
- Stress testing under adverse market conditions  
- Risk parity vs traditional allocation comparison  
- Market regime–based analysis  
- Automated reporting and insights generation  

---

## 📄 Disclaimer

This project is for **educational and analytical purposes only**.  
It does **not** constitute financial or investment advice.

---

## 👤 Author

**Om Mishra**  
Aspiring Data Analyst | Finance & Risk Analytics  

🔗 LinkedIn:  
https://www.linkedin.com/in/om-mishra-a62991289  

---

> *“In investing, the first rule isn’t maximizing returns — it’s surviving bad markets.”*

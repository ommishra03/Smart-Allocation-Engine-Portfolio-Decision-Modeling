# Excel — Analyst Intelligence Layer

This folder represents the **human reasoning layer** of the project.

Excel is intentionally **not** used for raw data processing.  
Instead, it consumes **clean SQL outputs** and applies analyst judgement, financial logic, and sanity checks.

---

## 🎯 Purpose of This Layer

- Introduce human intuition into the pipeline
- Validate financial logic and ratios
- Identify edge cases that automated systems may miss
- Perform reasonability checks before visualization or modeling

This reflects how Excel is used in **real finance and risk teams**.

---

## 🧠 Typical Use Cases

Excel is used for:

- Financial sanity checks  
- Ratio validation and inspection  
- Earnings quality flags  
- Portfolio composition review  
- Spotting anomalies and outliers  

---

## 🔁 Position in the Pipeline

> *SQL → Excel → Power BI → Python*


- Excel **never consumes raw data**
- Excel outputs are **curated and intentional**, not exploratory chaos

---

## 📌 Notes

- Excel files here should be interpretable by another analyst
- Complex logic should be documented or traceable to SQL
- This layer emphasizes **clarity and judgement**, not automation

---

> *Excel is where numbers are questioned before they are trusted.*


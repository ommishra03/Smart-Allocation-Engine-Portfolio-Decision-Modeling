# SQL — Canonical Data Layer

This folder represents the **foundational data layer** of the project.

SQL is used as the **single source of truth**, where raw financial data is transformed into **clean, auditable, and analysis-ready tables** before being consumed by Excel, Power BI, or Python.

---

## 🎯 Purpose of This Layer

- Handle data cleaning at scale
- Ensure deterministic and repeatable transformations
- Prevent downstream inconsistencies
- Act as the canonical reference for all analysis

This mirrors how **professional analytics and risk teams** structure their pipelines.

---

## 🧠 Responsibilities

Key operations performed in this layer include:

- Removing duplicate records  
- Filtering invalid or incomplete data  
- Standardizing fiscal periods and formats  
- Normalizing currencies and units  
- Recomputing vendor-calculated fields  
- Creating portfolio- and asset-level views  

---

## 📤 Outputs

The output of this layer is:
- Clean tables
- Analysis-ready views

These outputs are consumed by:
- **Excel** for analyst validation  
- **Power BI** for dashboards  
- **Python** for modeling and risk analysis  

---

## 📌 Notes

- Raw CSV/Excel files are treated as **inputs**, not final data sources
- Any downstream discrepancy should be traced back to this layer first
- SQL logic is designed to be **auditable and reproducible**

---

> *If Excel answers “does this make sense?”, SQL answers “is this correct?”.*

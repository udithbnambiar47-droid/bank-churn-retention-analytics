# bank-churn-retention-analytics
An end-to-end data analytics project using Excel, SQL, and Power BI to diagnose systemic customer attrition, isolate high-risk asset leaks ($32.5M+), and deliver interactive executive dashboards with strategic retention solutions.

# Capital Retention Insights: Bank Churn Analytics Dashboard 📊🏦

An end-to-end data analytics project engineered to diagnose, quantify, and solve systemic customer attrition for a retail bank with **10,000 customers**. This multi-tool framework traces a complete data lifecycle: from exploratory data analysis (EDA) in **Excel**, to targeted business logic validation in **SQL**, culminating in an advanced interactive dashboard deployed in **Power BI**.

---

## 🛠️ The Multi-Tool Analytics Pipeline

1. **Excel (Exploratory Data Analysis):** Generated Pivot Tables and matrix layouts to identify early signals. Discovered the "Cross-Sell Paradox" and built custom helper columns using logical formulas (`FLOOR`, `IF`) to circumvent web-interface grouping limitations.
2. **SQL (Structural Query Engine):** Imported raw data into an SQL server environment to solve 5 core business questions. Wrote advanced queries utilizing conditional aggregations (`CASE WHEN`), sorting limits, and multi-variable filtering to isolate high-value at-risk segments.
3. **Power BI (Data Modeling & UI/UX):** Architected a cohesive data model using **DAX**. Formatted relational KPIs, advanced measures, and custom calculated columns to drive high-impact visuals (Filled Maps, Area Curves, and Dynamic Matrix Hit-Lists).

---

## 📈 Key Performance Indicators (KPIs) Uncovered

*   **Total Customer Portfolio:** 10,000 processed accounts.
*   **Global Portfolio Churn Rate:** 20.37% (Baseline portfolio deficit).
*   **Lost Churned Balance:** \$32.5M+ in completely leaked customer capital.
*   **Loyal Capital Drag (Advanced DAX Metric):** \$18.9M+ sitting in highly at-risk, unengaged long-term accounts (Tenure >= 5 yrs, IsActiveMember = 0).

---

## 🔍 Core Business Problems & Strategic Solutions

### 🎯 Problem 1: The Product Cross-Sell Paradox
*   **The Dilemma:** Bank cross-selling strategies are counter-effective past a specific threshold. While 2-product holders are highly stable, customers with 3 or 4 products hit a **near-100% systemic attrition rate**, heavily compounding if the customer is inactive.
*   **Strategic Solution:** Implement CRM operational blocks to freeze automated marketing loops once a user reaches 2 products. Shift performance indicators from cross-sell *volume* to product *engagement*.

### 👻 Problem 2: The High-Net-Worth "Ghost" Account
*   **The Silent Deficit:** Isolated a critical segment of **2,037 affluent customers** holding balances exceeding \$100,000 who show zero behavioral interaction (`IsActiveMember = 0`), experiencing a 26.8% churn rate.
*   **Strategic Solution:** Deployed an automated **Smart List Matrix** inside the Power BI dashboard. This provides relationship managers with a real-time, high-priority list of wealthy, inactive accounts to proactively rescue using exclusive premium yield rewards (+0.5% APY tiers).

### 🌍 Problem 3: The Mid-Life Geographic Capital Flight
*   **The Attrition Axis:** Attrition peaks aggressively within the **40–59 middle-age cohort**. Geographically, the German market exhibits a devastating **32.4% localized churn rate**—nearly double France (16.2%) and Spain (16.7%).
*   **Strategic Solution:** Deploy localized wealth preservation teams in high-risk regional zones to intercept accounts approaching the 40-year milestone with long-term financial planning incentives.

---

## 💻 Tech Stack & Formulas Used

*   **SQL (Sample Query - Isolate High-Value Retention Targets):**
    ```sql
    SELECT TOP 10 CustomerId, Surname, Geography, Balance, EstimatedSalary
    FROM Bank_Churn
    WHERE Exited = 0 AND IsActiveMember = 1 AND Balance > 100000
    ORDER BY EstimatedSalary DESC;
    ```
*   **DAX (Advanced Metric - Capital Drag):**
    ```dax
    Loyal Capital Drag = 
    CALCULATE(
        SUM(Bank_Churn[Balance]), 
        Bank_Churn[Tenure] >= 5, 
        Bank_Churn[IsActiveMember] = 0, 
        Bank_Churn[Exited] = 0
    )
    ```

---

## 📁 Repository Structure
```text
├── Data/                 # Contains sample raw data / schema outlines
├── SQL_Queries/          # The 5 core business problem SQL scripts
├── Excel_Analysis/       # Pivot Table workbooks and helper columns
├── Power_BI_Dashboard/   # The compiled .pbix dashboard file
└── README.md             # Project landing page documentation
```

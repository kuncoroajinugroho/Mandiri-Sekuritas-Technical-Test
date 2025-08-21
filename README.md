
# User Behavior Analysis – Technical Test

## 📌 Objective
This project analyzes user behavior using three datasets: `users_data`, `cards_data`, and `transaction_data`. The goal is to build a unified fact table (`fct_user_transaction_behavior`) and visualize insights using Looker Studio.

---

## 🗂️ 1. Dataset Files

- `users_data.csv` – User demographic and financial information  
- `cards_data.csv` – Card-level details (type, brand, etc.)  
- `transaction_data.csv` – Transaction history  
- `mcc_list.csv` – (Optional) MCC codes and their descriptions

---

## ☁️ 2. Uploading CSVs to BigQuery

1. Go to [BigQuery Console](https://console.cloud.google.com/bigquery)
2. Select your project and dataset (e.g., `Technical_Test_1`)
3. Click `Create Table`
4. For each file:
   - Source: Upload `CSV` file
   - Destination table name: e.g., `users_data`, `cards_data`, `transaction_data`
   - File format: CSV
   - Schema: Auto-detect ✅ (or define manually for better precision)
   - Click **Create Table**

Repeat for all datasets.

---

## 🧠 3. Build the FCT Table

The query to generate the `fct_user_transaction_behavior` table is saved in a separate file:  
📄 [`fct_user_transaction_behavior.sql`](./fct_user_transaction_behavior.sql)

Use this SQL script in BigQuery to create your unified table.


---

## 📊 4. Visualization with Looker Studio

1. Open [Looker Studio](https://lookerstudio.google.com/)
2. Add **BigQuery** as a data source
3. Connect to the `fct_user_transaction_behavior` table
4. Create charts and filters using:
   - `card_type`, `generation_group`, `repeat_user_segment`, etc.

🔗 **Dashboard link**: [View Looker Studio Dashboard](https://lookerstudio.google.com/reporting/877c45c5-6023-42f2-bfee-e74b6dc111c2)

---

## 👤 Author

Kuncoro Aji Nugroho  
August 2025

import pandas as pd

# ==========================================
# 1. LOAD DATASET
# ==========================================

df = pd.read_csv("dataset/sales_data.csv")

print("=" * 50)
print("E-COMMERCE SALES & PROFIT ANALYTICS")
print("=" * 50)

# ==========================================
# 2. BASIC DATA INFORMATION
# ==========================================

print("\n--- FIRST 10 ROWS ---")
print(df.head(10))

print("\n--- DATASET SHAPE ---")
print(df.shape)

print("\n--- COLUMN NAMES ---")
print(df.columns.tolist())

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

# ==========================================
# 3. TOTAL SALES & PROFIT
# ==========================================

total_sales = df["Sales"].sum()
total_cost = df["Cost"].sum()
total_profit = df["Profit"].sum()
total_quantity = df["Quantity"].sum()
average_order_value = df["Sales"].mean()

print("\n--- OVERALL BUSINESS ANALYSIS ---")
print("Total Sales:", round(total_sales, 2))
print("Total Cost:", round(total_cost, 2))
print("Total Profit:", round(total_profit, 2))
print("Total Quantity Sold:", total_quantity)
print("Average Order Value:", round(average_order_value, 2))

# ==========================================
# 4. CATEGORY-WISE ANALYSIS
# ==========================================

category_analysis = (
    df.groupby("Category")[["Sales", "Cost", "Profit", "Quantity"]]
    .sum()
    .sort_values("Profit", ascending=False)
)

print("\n--- CATEGORY-WISE ANALYSIS ---")
print(category_analysis)

# ==========================================
# 5. TOP 10 PRODUCTS BY SALES
# ==========================================

top_products_sales = (
    df.groupby("Product")["Sales"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("\n--- TOP 10 PRODUCTS BY SALES ---")
print(top_products_sales)

# ==========================================
# 6. TOP 10 PRODUCTS BY PROFIT
# ==========================================

top_products_profit = (
    df.groupby("Product")["Profit"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("\n--- TOP 10 PRODUCTS BY PROFIT ---")
print(top_products_profit)

# ==========================================
# 7. CITY-WISE ANALYSIS
# ==========================================

city_analysis = (
    df.groupby("City")[["Sales", "Profit"]]
    .sum()
    .sort_values("Sales", ascending=False)
)

print("\n--- CITY-WISE ANALYSIS ---")
print(city_analysis)

# ==========================================
# 8. PAYMENT MODE ANALYSIS
# ==========================================

payment_analysis = (
    df.groupby("Payment_Mode")["Sales"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- PAYMENT MODE ANALYSIS ---")
print(payment_analysis)

# ==========================================
# 9. MONTHLY SALES ANALYSIS
# ==========================================

df["Order_Date"] = pd.to_datetime(df["Order_Date"])

df["Month"] = df["Order_Date"].dt.month_name()

monthly_sales = (
    df.groupby("Month")["Sales"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- MONTHLY SALES ---")
print(monthly_sales)

# ==========================================
# 10. PROFIT MARGIN
# ==========================================

profit_margin = (total_profit / total_sales) * 100

print("\n--- PROFIT MARGIN ---")
print("Profit Margin:", round(profit_margin, 2), "%")

print("\n" + "=" * 50)
print("ANALYSIS COMPLETED SUCCESSFULLY")
print("=" * 50)

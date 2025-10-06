# Mint-Classics-Inventory-Analysis
Warehouse inventory analysis for Mint Classics dataset. Includes SQL queries, sales vs. inventory evaluation, dead stock detection, and warehouse closure recommendations.

# Objective
Analyze inventory and sales data to identify opportunities for reducing stock levels and consolidating warehouse operations.

# Methods
- SQL queries in MySQL Workbench to explore products, inventory, and sales.
- Analysis of turnover ratios, sales contribution, and dead stock by warehouse.

# Results
- **East (b)** identified as the least efficient warehouse: largest inventory share (39.5%) but weaker proportional sales (33.7%) and only warehouse with dead stock (7,733 units worth $440K).
- **South (d)**, though smallest, shows strong efficiency with sales exceeding its inventory share.
- **North (a)** and **West (c)** are balanced and aligned with sales activity.

# Deliverables
- SQL analysis scripts
- Executive summary highlighting >$3M potential annual savings through closure of East and SKU rationalization

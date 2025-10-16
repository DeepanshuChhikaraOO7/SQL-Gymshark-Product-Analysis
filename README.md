# Gymshark Product Catalog Analysis

## Project Brief
[Gymshark_Product_dataset](https://www.kaggle.com/datasets/ahrnishpdahal/gymshark-products-dataset)

This project provides a deep-dive analysis into the Gymshark product catalog. The objective is to dissect the composition of the product offerings, understand the pricing strategies, evaluate vendor contributions, and extract key product features from unstructured tag data. The ultimate goal is to derive actionable insights that can inform inventory management, marketing efforts, and future product strategy.

This repository contains the full SQL-based analysis performed on the product dataset.

---

## 🎯 Business Objectives

The analysis was designed to answer the following key business questions:

#### 1️⃣ Catalog Composition & Diversity
- What is the total count of unique products, product types, and vendors?
- Which product categories dominate the catalog?
- Are there categories with limited size or color variants, suggesting incomplete listings?

#### 2️⃣ Pricing & Vendor Analysis
- What is the price distribution across different categories and vendors?
- How are products segmented into premium vs. budget lines?
- Is pricing consistent across different sizes and colors for the same product?
- Which vendors supply the most products and at what average price points?

#### 3️⃣ Product Feature Analysis
- What are the most common product features (e.g., "Seamless", "Oversized") as identified from product tags?
- Can tags be clustered into logical feature groups (e.g., Material, Fit, Technology)?

#### 4️⃣ Strategic Recommendations
- What is a viable new product category for Gymshark to target?
- What is the best practice for handling missing inventory data?
- What advanced data-driven models should be prioritized for the next phase of development?
- What additional datasets would enhance this analysis?

---

## ⚙️ Analytical Workflow

The analysis was conducted entirely in SQL. The process involved:
1.  **Data Exploration**: Initial queries to understand the scale and scope of the catalog, including unique counts of products, types, and vendors.
2.  **Data Aggregation**: Grouping data by dimensions like `product_type` and `vendor` to calculate key metrics such as average price and product counts.
3.  **Feature Extraction**: Parsing the unstructured `tags` column to identify and quantify the frequency of key product attributes.
4.  **Strategic Segmentation**: Classifying products into 'premium' and 'budget' categories based on their price relative to the overall average.

---

## 📊 Key Findings & Analysis

#### 1. Catalog Overview
The dataset contains a diverse catalog comprising **7,244 unique product titles**, categorized into **92 distinct product types** and supplied by **4 unique vendors**. The **Accessories** category dominates the catalog with **798 unique products**, followed closely by **Men's T-Shirts** with **613 unique products**.

#### 2. Vendor Dominance and Pricing Structure
The vendor **"Gymshark | Be a visionary."** is the primary supplier, accounting for **99.8%** of all product listings (**44,778 products**). This vendor maintains an average price point of **$27.77**. The other vendors have a negligible presence in the catalog. The analysis confirmed that product categories like bags, bottles, and headwear often list a single size variant, which is common and expected for such items.

#### 3. Budget-Friendly Product Strategy
The product catalog is skewed towards affordability. Based on the average price of all items, **55%** of the products are classified as **'budget'** offerings. This indicates a strategic focus on accessible price points, making the brand appealing to a wide customer base.

#### 4. Consistent Pricing Across Variants
A key finding is that **pricing remains consistent across different sizes** for the same product variant. There are no price fluctuations based on size (e.g., Small vs. Extra Large), which simplifies the pricing structure and enhances transparency for the customer.

#### 5. Most Common Product Features
Analysis of the unstructured `tags` column reveals a clear focus on specific product features. The most prevalent tags are related to **T-Shirts (19.6k mentions)**, **Tops (18.3k)**, and performance-oriented materials like **'sweat-wicking' fabric (11.8k)**. This suggests a product strategy centered on foundational athletic apparel with an emphasis on performance and comfort. However, clustering tags into structured groups (Material, Fit, etc.) is not feasible with the current messy data and would require a cleaner, standardized dataset.

---

## 💡 Strategic Recommendations

#### 1. Target "Pants" as the Next Product Category for Expansion
Given Gymshark's strong brand identity centered on fitness, launching an unrelated product category could dilute the brand. A more strategic approach is to identify and fill gaps within the existing apparel domain. The **Pants** category, with only **14 products**, presents a clear and logical opportunity for expansion.

#### 2. Handle Missing Inventory Data by Ignoring (Not Replacing)
For handling missing `inventory_quantity` data, **ignoring the missing values** during aggregations is the most prudent initial approach. Dropping the column would result in a loss of valuable product information, while imputation (estimating values) could introduce significant inaccuracies without additional sales data to support the estimates.

#### 3. Prioritize a Product Recommendation Engine for the Next Phase
For the next phase, building a **Product Recommendation Engine** is the most valuable step. While a Dynamic Pricing Model could be considered, it should be implemented cautiously to avoid perceived unfairness (e.g., pricing based on a user's device). A better approach would be to focus on increasing average order value through **add-on suggestions and product bundling**, which a recommendation engine can facilitate effectively.

#### 4. Focus on Data Cleansing Before Incorporating New Datasets
The immediate priority should be to improve the quality of the existing dataset, particularly the unstructured `tags` column which was difficult to parse accurately. Before incorporating new datasets, **data cleansing and standardization are essential**. Once the data is clean, the analysis could be significantly enriched with **sales transaction data, customer reviews, and web traffic metrics** to provide a complete picture of product performance and customer behavior.

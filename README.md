# UniversityProjects
Welcome to my GitHub repository dedicated to showcasing and managing all the projects I am currently collaborating on with the university. Here, you'll find a collection of my ongoing work, spanning various disciplines and subjects. Feel free to explore the diverse range of projects, each representing a unique facet of my academic journey. Your feedback and contributions are always appreciated as we collectively strive for excellence in our academic pursuits.

In this activity, I perform a bivariate descriptive analysis of the "House Prices" dataset.
This dataset contains a series of variables related to house characteristics, along with their sale prices. This dataset contains a total of 80 variables (you can find more information in the previous link), but the variables of interest for this practice are:

SalePrice: sale price of the property (in dollars).
GarageCars: size of the garage in terms of car capacity.
LotArea: size of the lot (in square feet).
LotConfig: type of lot configuration (qualitative variable).
LotShape: shape of the lot (qualitative variable). 


Let's extract these variables and perform some initial descriptive analysis.

Analysis Steps:
Summary Statistics: Calculate basic descriptive statistics for SalePrice, GarageCars, and LotArea.
Frequency Tables: Create frequency tables for LotConfig and LotShape.
Bivariate Analysis: Examine relationships between SalePrice and other variables:
Scatter plots for SalePrice vs GarageCars and SalePrice vs LotArea.
Box plots for SalePrice by LotConfig and LotShape.
Confidence Intervals: Calculate confidence intervals for the mean SalePrice.
Let's start with the summary statistics and frequency tables. ​​

Summary Statistics
SalePrice:

Mean: $180,921.20
Standard Deviation: $79,442.50
Minimum: $34,900
25th Percentile: $129,975
Median (50th Percentile): $163,000
75th Percentile: $214,000
Maximum: $755,000
GarageCars:

Mean: 1.77 cars
Standard Deviation: 0.75 cars
Minimum: 0 cars
25th Percentile: 1 car
Median (50th Percentile): 2 cars
75th Percentile: 2 cars
Maximum: 4 cars
LotArea:

Mean: 10,516.83 sq ft
Standard Deviation: 9,981.26 sq ft
Minimum: 1,300 sq ft
25th Percentile: 7,553.5 sq ft
Median (50th Percentile): 9,478.5 sq ft
75th Percentile: 11,601.5 sq ft
Maximum: 215,245 sq ft
Frequency Tables
LotConfig:

Inside: 1,052
Corner: 263
CulDSac: 94
FR2: 47
FR3: 4
LotShape:

Reg: 925
IR1: 484
IR2: 41
IR3: 10
Next, let's proceed with the bivariate analysis by creating scatter plots and box plots to examine the relationships between SalePrice and the other variables. ​​

SalePrice Vs GarageCars



SalePrice Vs LotArea



SalePrice By LotConfig
¡Ahora es interactivo! (Beta)

SalePrice By LotShape
¡Ahora es interactivo! (Beta)

Bivariate Analysis Results:
Scatter Plot of SalePrice vs GarageCars:

There is a positive relationship between the number of garage cars and the sale price, indicating that houses with larger garages tend to have higher prices.
Scatter Plot of SalePrice vs LotArea:

There is a positive trend showing that larger lot areas generally correspond to higher sale prices, though the data shows significant variability.
Box Plot of SalePrice by LotConfig:

The median sale price varies across different lot configurations. Houses in cul-de-sac lots (CulDSac) tend to have higher median prices compared to other lot configurations.
Box Plot of SalePrice by LotShape:

The median sale price is highest for regular-shaped lots (Reg), followed by irregular shapes (IR1, IR2, IR3).
Confidence Intervals for SalePrice
To calculate the confidence interval for the mean sale price, we will use a 95% confidence level. ​​

Confidence Interval for SalePrice
The mean sale price of the houses is $180,921.20. With a 95% confidence level, the confidence interval for the mean sale price ranges from $176,846.22 to $184,996.17.

This interval indicates that we can be 95% confident that the true mean sale price of the houses falls within this range.

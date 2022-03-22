### Reponse: Py4DS Review Round #1

Commit reviewed: 

Really good first attempt! Critiques are relatively minor, please address them as fully as possible and submit line-by-line response in a separate markdown document. 

Critiques:
1. (a) You should include more detailed descriptions in the markdown blocks within the notebook. For example, why did you apply Pearson correlation in question 4? Were the asummptions of Pearson met? I think including more markdown (and code) to back up your statistical reasoning is important in places like this. 

    - Instead of Pearson's correlation coefficient, Kendall's tau correlation is used to measure the strength of the associaton between log CO2 and log GDP. This is there is an outlier in log GDP, so the assumptions for Pearson's correlation were violated.  The assumptions for Kendall's tau correlation are stated in the updated Jupyter notebook. 

1. (b) Another example is your use of a linear regression in "More Questions: Question 2" -- why linear regression instead of a difference of means test such as t-test or anova? Moreover, you did not provide your answer to the question after running the regression. 

    - The explanation for using a linear regression model instead of t-test was added to the answer to question 3. 
    

2. The answer to "More Questions: Question 3" is correct in the plot, but incorrect in the markdown above it. 

    - Correction has been made. (Answer is Macao instead of Hong Kong). 
    

3. The answer to "More Questions: Question 4" is incorrect -- check your code for bugs and consider the assumptions made by your code about the data. I would be willing to accept a convincing argument that the wording of the question was vague enough to allow your answer, but you would need to include that argument in the markdown. 

Alternative answers have been added below the question. 

The answer depends on whether the question is about:
- what country (or countries) has shown the greatest increase in 'Life expectancy at birth, total (years)' since 1962 **across all times** in the period of 1962-2002?
 

- what country (or countries) has shown the greatest increase in 'Life expectancy at birth, total (years)' since 1962 **on average** in the period of 1962-2002?


4. Each plot should have a title. Also consider whether your X and Y axes are appropriately scaled for your first two plots -- I would consider using a log scale here. Also make sure your axis labels are reader-friendly. For example the label on the second plot says "gdpPercap" -- I would change this to something like "GDP per capita (in dollars)" or something like that.


- An explanation for log transforming the data was added. An initial visualization of the untransformed raw data for GDP vs. CO2 emissions was also added. 
- A title was added to all plots. 
- Plot axes were also relabelled to be more reader-friendly. 
1. Logical/Programming:

    1. **Question 4**: Your answer is wrong in the description, the table shows that for the year `2002` the `r` was `0.78` with a significant `p-value`                                - The mistake has been corrected. The results are now sorted by `r` in the dataframe. 
    2. **Question 5**: Increase the size of the scatter plot bubbles. They are difficult to see without zooming in.                                                                     - The size of the scatterplot bubbles were increased `fig.update_traces()`.
    3. **More Questions: Question 2:** Your logic for using linear regression seems fine. There is a typo "(p>0.5)" in your description. Please review other questions also for any missed typo.                                                                                                                                                                       - Typos have been checked and removed. 
    4. **More Questions: Question 3:** Your answer seems to be partially wrong. This is because the question asks for "highest average ranking in this category across each time point in the dataset", meaning you have to get the ranking of `'Population density (people per sq. km of land area)'` for each year and then get the average of this ranking.                                                                                                                                                                             - A graph of the top 5 countries for each year was plotted.  Subsequently, the averaged ranking across the years were calculated.  

    - I have used `groupby()` to select the years 2007 and 1962 to find the difference between the life expectancy and sorted the countries based on the difference. A new graph 'Countries with greatest increase in life expectancy, 1992-2007' has been plotted. 
    
2. Coding Style: Your coding style is inconsistent and does not follow PEP-8 or other widely used coding styles.
    The most common of these mistakes include:
    1. The whitespaces and indentations are used inconsistently across the code.
    2. The lines are more than 80 characters in many places.

    Please fix them using a coding style guide like [PEP-8](https://peps.python.org/pep-0008/).
- coding style was checked and fixed based on `pycodestyle_magic`

1. Logical/Programming:

    1. **Question 4**: Your answer is wrong in the description, the table shows that for the year `2002` the `r` was `0.78` with a significant `p-value`                      -  The mistake has been corrected. The results are now sorted by `r` in the dataframe. 
    2. **Question 5**: Increase the size of the scatter plot bubbles. They are difficult to see without zooming in.                                                                 -  The size of the scatterplot bubbles were increased `fig.update_traces()`.
    3. **More Questions: Question 2:** Your logic for using linear regression seems fine. There is a typo "(p>0.5)" in your description. Please review other questions also for any missed typo.                                                                                                                                                                    -  Typos have been checked and removed. 
    4. **More Questions: Question 3:** Your answer seems to be partially wrong. This is because the question asks for "highest average ranking in this category across each time point in the dataset", meaning you have to get the ranking of `'Population density (people per sq. km of land area)'` for each year and then get the average of this ranking.                                                                                                                                                                        - A graph of the top 5 countries for each year was plotted.  Subsequently, the averaged ranking across the years were calculated.  
    5. **More Questions: Question 4:** Your logic is correct about the absolute difference, i.e. value of "Life expectancy at birth, total (years)" in `2007 - 1962`. The error in your results seems to be because of using the `np.ptp`, which calculates the difference between minimum to maximum values. As Cambodia suffered a [genocide](https://en.wikipedia.org/wiki/Cambodian_genocide) in 1977 because of which the life expectancy [dropped](https://ibb.co/wds7mDq) and that drop affected the calculations here.   I think you can make appropriate changes to prevent that.
    6. Graphs:
        1. It is a general rule to have the title as Y-axis vs X-axis.
        2. The graph of **Question 1** lacks title and labels.
- I have used `groupby()` to select the years 2007 and 1962 to find the difference between the life expectancy and sorted the countries based on the difference. A new graph 'Countries with greatest increase in life expectancy, 1992-2007' has been plotted.  
2. Coding Style: Your coding style is inconsistent and does not follow PEP-8 or other widely used coding styles.
    The most common of these mistakes include:
    1. The whitespaces and indentations are used inconsistently across the code.
    2. The lines are more than 80 characters in many places.

    Please fix them using a coding style guide like [PEP-8](https://peps.python.org/pep-0008/).
- coding style was checked and fixed based on `pycodestyle_magic`

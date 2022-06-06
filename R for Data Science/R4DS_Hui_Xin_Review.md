# Review of R for Data Science

**Commit reviewed**: [6c33a16](https://github.com/nghuixin/brn-training/tree/6c33a1605870388a05e9a13cd2a76ea31eca0b61)

## General comments
Overall, this submission provides excellent statistical reasoning, good visualizations, and good tidyverse coding patterns. In addition, all the answers are correct. The primary issues relate to stylistic problems and missing statistical reasoning for some questions.

## HTML

Generally, the HTML is poorly styled. However, with some minor modifications, this is easily addressed.

Here are the issues with the HTML output:  
1. Code should not be visible to the reader by default. Consider using [code folding](https://bookdown.org/yihui/rmarkdown/html-document.html#code-folding).
*  Code-folding added. 

2. No theme is applied. While not required, doing so would likely improve the appearance (**optional**). Here is the documentation on themes: [link](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style).
*  Cosmo theme added. 

3. No table of contents is provided, thus navigation is a little challenging. Consider using a [table of contents](https://bookdown.org/yihui/rmarkdown/html-document.html#table-of-contents).
*  Table of contents added. 

4. Besides headers, markdown is completely unformatted and thus it is more difficult to read. Consider using appropriate [markdown formatting](https://www.markdownguide.org/basic-syntax/).
*  Text are now formatted using the paragraph tags. 

5. Equations are not formatted. Consider using [formatted equations](https://bookdown.org/yihui/rmarkdown/markdown-syntax.html#math-expressions) -- [more info](https://rpruim.github.io/s341/S19/from-class/MathinRmd.html) -- [even more info](https://rmd4sci.njtierney.com/math) 
*  Equations are formatted with latex

6. All text outputs from code blocks are unformatted. Consider using [kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html) or [DT](https://rstudio.github.io/DT/) for tables. For `summary()` calls, consider converting to tidy format and displaying the results using {{broom}}.
* Outputs are not formatted as tibbles using tidy() from broom. 

Addition issues in the text of the HTML:

1. No statistical reasoning was provided for use of Kendall's Tau in Question 4. 
*  Explanation for using Kendall's Tau instead of other correlation methods is added.  

2. Title of question 5 plot displays the wrong year.
* Year has been corrected to reflect the answer to the prior question. Text also has been added to describe the visualization.  

3. Generally, no description of the results is provided for several questions. For example, on "More Questions - Question 1", the reasoning for use of Kruskall-Wallis was provided, but no results were provided or discussed in the text. Therefore, it was not clear whether the trainee had arrived at an answer to the question or not. Every question should contain a statement in the text with the answer.
* Questions with missing descriptions/answers have been corrected.  

## Code

The code was generally acceptable and followed many tidyverse conventions. However, there is room for improvement, particularly in code style and in analysis self-reporting. 

Here are the specific issues which should be addressed:

1. [line 4](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L4) - Date should be automatically generated upon render. See info on automating the date [here](https://bookdown.org/yihui/rmarkdown-cookbook/update-date.html).
* Data is automatically updated and formatted. 
 

2. [line 14](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L14) - `setwd()` is almost always a bad idea because it often makes the code irreproducible on another person's computer. RStudio provides `.Rproj` files for managing the working directory. RMarkdown also includes a default working directory (the location of the `.Rmd` file). Learn more [here](https://bookdown.org/yihui/rmarkdown-cookbook/working-directory.html).
* setwd() has been removed. 

3. [line 23-26](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L23-L26) - Repetitive pattern. Trainee should consider using `dplyr::rename()` instead.
* The rename function from dplyr is used instead to rename the columns. 
 

4. General - Lines are too long, issues with whitespace, etc. Consider running the `styler::style_file()` command on your RMarkdown script to address these problems.
* style_file() has been added at the begining of the markdown file. 

5. [line 42](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L42) - data transformations for data visualization purposes should only occur in the `ggplot` call by using `scale_x_log10()` or `scale_y_log10()` functions. `scale_...` functions will not alter the underlying data, so statistical methods in the plot context (e.g., running the `stat_smooth` or `stat_compare_means`) will still work as expected.
* Added data transformation functions in ggplot. 


6. [line 47 (and many other places)](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L47) -- hardcoded results. Results should be self-reporting whenever possible. This requires inline code blocks: [info](https://bookdown.org/yihui/rmarkdown/r-code.html#r-code). Please identify and address this issue in all places where it arises.
* Responses in text are reported as inline code blocks instead.  


7. [line 52](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L52) - nonstandard column access via `[[]]`. Consider using `$` to access columns as vectors.
* The columns are now accessed using '$' instead. 

8. [line 60](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L60) - use of `do` is superseded. Consider using a more modern pattern like `summarise()`:

```R
library(tidymodels)
mtcars %>% 
  group_by(gear) %>% 
  summarise(
    tidy(
      cor.test(x = wt, y = mpg)
    )
  )
```
* `summarize()` was used to replace the existing code.  

9. [line 61](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L61) - consider using the `dplyr::slice_max()` function here.
* Existing code was replaced with the suggestion above. 


10. [line 70](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L70) - year should not be hardcoded as it derives from the results in the previous block.
* The results from the previous block is saved as `res`. The Year is now accessed via `res$Year`.
 

11. [line 88](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L88) - It appears these animations are not functioning properly. I would consider removing this or simply explain in your response whether this is behaving as intended. 
* Code chunk was removed. 

12. [line 125](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L125) - Consider using the {{broom}} `tidy` here.
* tidy() is for every result print out. 

13. [lines 137-141](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L137-L141) and [lines 149-152](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L149-L152) and [lines 173-174](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L173-L174) - the wrangling here is a bit messy. Consider a simpler approach for taking the top 3 observations by some column within groups defined by another column (using `mtcars` for an example): 

```R
mtcars %>% 
  group_by(gear) %>% 
  slice_max(order_by = wt, n = 3)
```
* Existing code was replaced with the suggestion above. 

14. [line 153](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L153) - Consider using built-in `dplyr` ranking methods - [info](https://dplyr.tidyverse.org/reference/ranking.html). These are a bit confusing in my opinion, but they are powerful once you understand how they work. For example, to get the ranking within a `gear` group on the `qsec` column of `mtcars` in descending order (i.e. rank #1 is the highest `qsec` value), you can do this:

```R
mtcars %>% 
  group_by(gear) %>% 
  mutate(
    rnk = row_number(desc(qsec))
  )
```
* Existing code was replaced with the suggestion above. 



15. [lines 171-172](https://github.com/nghuixin/brn-training/blob/master/R%20for%20Data%20Science/R%20for%20DS.Rmd#L171-L172) (**optional**) - based on my reading of this code, it seems like your intention here is to perform a pivot and then calculate the difference within country. This can be easily achieved using `tidyr::pivot_wider()` which will keep you within the tidyverse, unlike `dcast`. However, you can also use a (in my opinion) simpler solution with the `group_by()...summarise()` pattern that will achieve this same outcome without the need for a pivot. In this example, I use the builtin `airquality` dataset and show how we can find the difference in the `Wind` column between `Day` 10 and 1 within each `Month`.
This section of the code has been 
```R
airquality %>% 
  group_by(Month) %>% 
  summarise(
    diff = Wind[Day == 10] - Wind[Day == 1]
  )
```
* Existing code was replaced with the suggestion above. 


# R Programming review: <https://github.com/nghuixin/brn-training/blob/master/R%20Programming/ttt.R>

Commit Reviewed: <https://github.com/nghuixin/brn-training/commit/00c9d00a706c3492ab75d151e6b36d4713691304>

1. Functioning: The game didn't work as the `play()` function was not called. I called the `play()` function to test it.
    - You have not asked the input properly so that it skips directly to the infinite while loop. Infinite loops should be avoided, the input method should be improved. <https://ibb.co/5LD7H8J> <https://github.com/nghuixin/brn-training/blame/00c9d00a706c3492ab75d151e6b36d4713691304/R%20Programming/ttt.R#L67-L72>

    ```{r}
    if (interactive()) {  # use this for proper input. It is mentioned in README.md of the skill assessment.
    con <- stdin()
    } else {
    con <- "stdin"
    }
    cat("X or O? ") # example input
    symbol <- readLines(con = con, n = 1)
    ```

    - You aren't asked to make the game PvP, it is good that you added an extra feature but it isn't required. <https://github.com/nghuixin/brn-training/blame/00c9d00a706c3492ab75d151e6b36d4713691304/R%20Programming/ttt.R#L110-L159>
    Right now the game doesn't work properly.
    - I have kept the PvP mode and have made the necessary modifications. 

2. Formatting/Style: There are multiple formatting errors.
    - The white spaces are not formatted properly.
    - The lines should not be more than 80 char. Example: Line 94-95, 143-145, etc.
    - You can improve your comments use.
    You can use the resources mentioned below to improve the same:
    - <https://rstudio-pubs-static.s3.amazonaws.com/390511_286f47c578694d3dbd35b6a71f3af4d6.html>
    - <https://style.tidyverse.org/> The `styler` and `lintr` packages can be used to help with code formatting.
    - <https://stackoverflow.blog/2021/12/23/best-practices-for-writing-code-comments/>
    - `styler` has been applied. 

3. Coding Practices:
    - You don't have to check against True or False in the `if..else` statements. Example: <https://github.com/nghuixin/brn-training/blame/00c9d00a706c3492ab75d151e6b36d4713691304/R%20Programming/ttt.R#L82>
        Simply using something like the below would do the same.

        ```{r}
            if (checkIfWinnerExist(board)){ # to check for TRUE
                ...
            } 
            
            if(sum(board == "x") + sum(board == "o") == 9 && !checkIfWinnerExist(board)){ # to check for FALSE
                ...
            } 
        ```

    - You can simply return `T` or `F` in the if..else statements, you don't have to assign value to `win <- F` and return `win`. <https://github.com/nghuixin/brn-training/blame/00c9d00a706c3492ab75d151e6b36d4713691304/R%20Programming/ttt.R#L28-L40>

    - I've tried your suggestion but it does not appear to work. Here is my explanation: In the `checkIfWinnerFunction()`we loop through each combo in  `winningCombo` in order to check if there is a winning combination in the board. If there is, then the variable `win` is saved to TRUE. If we just return TRUE or FALSE within the for loop, when a winning combo is detected it still returns only FALSE and the while loop inside the `play()` function cannot be broken. 

    - Also, you can use Logical OR i.e. `||` in if..else statements. Don't repeat similar code.
To shorten the code I have used the logical `||` wherever appropriate. For instance, at line 86 where the message displayed is the same for the conditions met whenever there is an invalid input. 
    ```{r}
     if(condition1 || condition2){
            #code
        }
    ```
- The nested while loops inside multiple if..else statements can be problematic if not done right.It is not considered a good practice. If you can find an alternative it would be great.

- I have removed the nested while loops from the function `play()` by moving chunks of code into separate functions `checkValidInput()` and `checkPlayerMode()`.
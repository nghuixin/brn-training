# R Programming review: <https://github.com/nghuixin/brn-training/blob/master/R%20Programming/ttt.R>
​
Commit Reviewed: <https://github.com/nghuixin/brn-training/commit/5417f295f44d4ffd589071e8f5963a2c0c3b06fa>
​
The game has improved a lot since the last review.
​
1. Functioning:
    - You should allow users to choose if they want X or O.
    - _I've modified the function to enable users to make that choice, by adding the `chooseSymbol` function._
    - After the input from the user to place their move as "o" vs computer, it takes too long to place the mark. You can use the `profvis` library to profile why it is taking so much time. Hint: sleep
    - _I've modified the sleep duration to 0.5 instead of 2._ 
    - Aesthetics: The game can be better aesthetically by placing `/n` in the outputs like error messages.
    - _Each individual sentence now is presented as a newline._
    - The while loop in Line 99-108 goes into an infinite loop when I enter anything besides Y/y or N/n, `while(TRUE)` is dangerous.
    - _I have decided to remove the two-player option since the chooseSymbol function is added, to preserve brevity._
    - Make sure that the strings entered as names are valid, I got no error on entering empty strings as names. There should be.
    - _This is removed as a result of removing the two-player game._ 
​
2. Formatting/Style:
    - Apart from some places which extend a little out of the 80+ character range per line, which is acceptable.
    - _I've set a margin line in my Rstudio display to check for any lines that are out of range and corrected them._ 
​
3. Coding Practices:
    - As mentioned in functioning, you have misused the while loop and created an infinite loop.

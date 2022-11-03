# R Programming review: <https://github.com/nghuixin/brn-training/blob/master/R%20Programming/ttt.R>

Commit Reviewed: <https://github.com/nghuixin/brn-training/commit/fb9343d48fccde3cef7701652ab6f0ba065c0ff2>

1. Functioning:
    - You have forgotten to provide a reference board while asking for input in the first move as "X".

2. Formatting/Style:
    - The `next` and `break` doesn't require `()` you have mentioned them somewhere as `next()...break()` and somewhere as `next...break`. Else, the formatting looks good.

3. Coding Practices:
    - Line 96 and 113: You don't need to pass the symbol as a parameter as you are not providing any arguments to `chooseSymbol()`.
    - Line 106: You don't need to provide a break after `return()` statement, the function exits after `return()`.
    - There are repetitive code snippets, which can be defined as a function and called when required like the codes are the same in lines 140-148 and 156-164. Try to avoid and convert them to functions instead. There might be cases where you can't avoid repetition, but it doesn't seem so here.
    - I mentioned earlier not to check values against boolean if your function returns a value as boolean. You mentioned that it was giving errors/won't work, so I checked myself, and it was working fine. Please cross-check places where it works fine. Example: Line 161, line 167-168,etc.

```{r}
# use
    if(function()) {
        ...
    }
# instead of 
    if(function() == T) {
        ...
    }
```

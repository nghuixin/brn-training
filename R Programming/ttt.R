defaultW <- getOption("warn") # suppress warning msgs on UI
options(warn = -1)


if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}

# create board as a list of characters
board <- as.character(matrix(
  data = 1:9, nrow = 3, ncol = 3, byrow = FALSE,
  dimnames = NULL
))

# 8 winning combos
winningCombo <- list(
  c(1, 2, 3), c(4, 5, 6),
  c(7, 8, 9), c(1, 4, 7),
  c(2, 5, 8), c(3, 6, 9),
  c(1, 5, 9), c(3, 5, 7)
)

winningCombo <- lapply(winningCombo, as.character)

# shows the board to the player(s)
# @param board object for displaying grids 1-9
showBoard <- function(board) {
  cat(
    "\n",
    board[1], " |", board[2], "|", board[3], "\n",
    "---+---+---", "\n",
    board[4], " |", board[5], "|", board[6], "\n",
    "---+---+---", "\n",
    board[7], " |", board[8], "|", board[9], "\n\n"
  )
}

# checks if there are winning combos in the board
checkIfWinnerExist <- function(board) {
  win <- F # no winners by default
  nWinningCombo <- length(winningCombo) # 8 combos
  for (n in 1:nWinningCombo) { # for each winning combo, e
    
    if (all((board[as.numeric(winningCombo[[n]])]) == "x") == T) {
      win <- T
    } else if (all((board[as.numeric(winningCombo[[n]])]) == "o") == T) {
      win <- T
    }
  }
  return(win) # win is returned outside of for loop to ensure
}

# updates the board based on the player's moves
# @param board
# @param pos - input by human player
# @mark - 'O' or 'X
playerMove <- function(board, mark, pos) {
  board[pos] <- mark
  cat("You placed ", mark, "at position", pos, "\n")
  return(board)
}

# updates the board based on the computer's moves
# @param board
# @param pos - input by computer player
# @mark - always 'X' because comp always goes first
computerMove <- function(board, mark) {
  notFilled <- board[!board %in% c("x", "o")] # which pos is not marked by X?
  pos <- as.numeric(sample(notFilled, 1)) #sample an unmarked position  
  board[pos] <- mark
  cat("Computer placed ", mark, " at position ", pos, "\n")
  return(board)
}

# checks if the user input is within 1-9
# @param mark - 'x' or 'o' for displaying prompt to user
# returns the numeric input
checkValidInput <- function(board, mark) {
  while (TRUE) {
    cat("Where would you like to place ", mark, "? (1-9) ")
    pos <- as.numeric(readLines(con = con, n = 1))
    if (!pos %in% seq(1:9) || board[pos] == "o" || board[pos] == "x") {
      cat("This position is already marked or is an invalid value.\n
          Please enter another number:")
      next()
    } else {
      break()
    }
  }
  return(pos)
}


chooseSymbol <- function(symbol) {
  while (TRUE) {
    cat("Please choose a symbol to start the game.\n X or O? ")
    symbol <- readLines(con = con, n = 1)
    capSymbol <- toupper(symbol)
    if (capSymbol != "O" & capSymbol != "X") {
      cat("Invalid character. Please pick from X or O.", "\n")
      next()
    } else {
      return(capSymbol)
      break
    }
  } 
}


# Intialize game
play <- function() {
  chosenSymbol <- chooseSymbol()
  if (chosenSymbol == "O") {
    cat("You've chosen to go second.\n")
    while (checkIfWinnerExist(board) == F) {
      
      # the computer make a move first and the board is shown afterwards
      comp <- "x"
      board <- computerMove(board, comp)
      Sys.sleep(0.5)
      showBoard(board)
      
      
      if (checkIfWinnerExist(board) == T) { # Checks if there is a winner
        cat("The computer has won.")
        break
      }
      
      # if all spaces in board are occupied and there are no winners,
      # break loop and display msg
      if (sum(board == "x") + sum(board == "o") == 9 &&
          checkIfWinnerExist(board) == F) {
        cat("It is a tie!.")
        break
      }
      # the human player's move is recorded and the board is shown afterwards
      human <- "o"
      humanPos <- checkValidInput(board, human)
      board <- playerMove(board, human, humanPos)
      Sys.sleep(0.5)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) {
        cat("You won.")
        break
      }
    }
  } else if (chosenSymbol == "X") {
    cat("You've chosen to go first.\n")
    while (checkIfWinnerExist(board) == F) {
      
      # the human player's move is recorded and the board is shown afterwards
      human <- "x"
      humanPos <- checkValidInput(board, human)
      board <- playerMove(board, human, humanPos)
      Sys.sleep(0.5)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) {
        cat("You won.")
        break
      }
      # if all spaces in board are occupied and there are no winners,
      # break loop and display msg
      if (sum(board == "x") + sum(board == "o") == 9 &&
          checkIfWinnerExist(board) == F) {
        cat("It is a tie!.")
        break
      }
      # the computer make a move first and the board is shown afterwards
      comp <- "o"
      board <- computerMove(board, comp)
      Sys.sleep(0.5)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) { # Checks if there is a winner
        cat("The computer has won.")
        break
      }
    } # close while loop for playing with comp mode
  }
  
  options(warn = defaultW) # suppress warning
}

play()

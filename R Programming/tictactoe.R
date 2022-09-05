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
  notFilled <- board[!board %in% c("x", "o")] # check which pos is not marked by X
  pos <- as.numeric(sample(notFilled, 1)) # randomly sample a position that is not marked
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
    if (!pos %in% seq(1:9)|| board[pos] == "o" || board[pos] == "x") {
      cat("This position is already marked or is an invalid value. Please enter another number:")
      next()
      
    } else {
      break()
    }
  }
  return(pos)
}

# checks if user wants to play with the computer or another user
# @param mode - 'Y(y)' or 'N(n)'
# returns
checkPlayerMode <- function(mode){
  while (TRUE) {

    #capsMode <- toupper(mode)
    if (!mode %in% c("Y", "N", "y", "n")){ # check if the input is valid
      cat("Please enter 'Y'or 'N' only,\n ")
      next()
    } else {
      break()
    }
  }
  return((mode)) 
}





# Intialize game
play <- function() {
  cat("Enter 'Y' to play with computer or 'N' for the two-player mode. ")
  mode <- readLines(con = con, n = 1)
  if (checkPlayerMode(mode) %in% c("Y","y")) { # If playing with computer
    
    
    while (checkIfWinnerExist(board) == F) {
      
      # the computer make a move first and the board is shown afterwards
      comp <- "x"
      board <- computerMove(board, comp)
      Sys.sleep(2)
      showBoard(board)
      
      
      if (checkIfWinnerExist(board) == T) { # Checks if there is a winner
        cat("The computer has won.")
        break
      }
      
      # if all spaces in board are occupied and there are no winners, break loop and display msg
      if (sum(board == "x") + sum(board == "o") == 9 && checkIfWinnerExist(board) == F) {
        cat("It is a tie!.")
        break
      }
      
      # the human player's move is recorded and the board is shown afterwards
      human <- "o"
      humanPos <- checkValidInput(board, human)
      board <- playerMove(board, human, humanPos)
      Sys.sleep(2)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) {
        cat("Player o has won.")
        break
      }
    } # close while loop for playing with comp mode
  
  }  else if (checkPlayerMode(mode) %in% c("N","n")) { # If not playing with computer
    
    # Assign the first player as X
    cat("What is Player 1's name? ")
    player1 <- readLines(con = con, n = 1)  
    cat(player1, "will play as Player X. ")
    
    # Assign the second player as O
    cat("What is Player 2's name? ")
    player2 <- readLines(con = con, n = 1)  
    cat(player2, "will play as Player O. ")
    
    
    showBoard(board)
    # While winner does not exist
    while (checkIfWinnerExist(board) == F) {
      # record input from player 1 and show on board 
      p1 <- "x"
      p1Pos <- checkValidInput(board, p1)
      board <- playerMove(board, p1, p1Pos)
      checkIfWinnerExist(board)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) { # if winner exists, end game
        cat(player1, "has won.")
        break
      }
      
      # if there is a tie, end the game
      if (sum(board == "x") + sum(board == "o") == 9 && checkIfWinnerExist(board) == F) {
        cat("It is a tie!.")
        break
      }
      
      # record input from second player and show board
      p2 <- "o"
      p2Pos <- checkValidInput(board, p2)
      board <- playerMove(board, p2, p2Pos)
      showBoard(board)
      
      if (checkIfWinnerExist(board) == T) {
        cat(player2, "has won.")
        break
      }
    }
  }
  options(warn = defaultW) # suppress warning
}

play()

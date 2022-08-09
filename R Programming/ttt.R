defaultW <- getOption("warn") 
options(warn = -1) 

# create board as a list of characters
board <- as.character(matrix(data = 1:9, nrow = 3, ncol = 3, byrow = FALSE,
                             dimnames = NULL)) 
# 8 winning combos
winningCombo <- list(
  c(1,2,3), c(4,5,6), 
  c(7,8,9), c(1,4,7), 
  c(2,5,8), c(3,6,9),
  c(1,5,9), c(3,5,7)
)
winningCombo <-lapply(winningCombo, as.character)

# shows the board to the player(s)
# @param board object for displaying grids 1-9
showBoard <- function(board){
  cat("\n", 
      board[1], " |", board[2], "|", board[3], "\n",
      "---+---+---", "\n",
      board[4], " |", board[5], "|", board[6], "\n",
      "---+---+---", "\n",
      board[7], " |", board[8], "|", board[9],"\n\n")
}

# checks if there are winning combos in the board
checkIfWinnerExist <- function(board) {
  win <- F # no winners by default
  nWinningCombo <- length(winningCombo) #8 combos
  for (n in 1:nWinningCombo) { # for each winning combo, e
    
    if (all((board[as.numeric(winningCombo[[n]])]) == 'x' )== T) {
      win = T
    }else if (all((board[as.numeric(winningCombo[[n]])]) == 'o') == T) {
      win = T
    }   
  }
  return(win)
} 

# updates the board based on the player's moves
# @param board
# @param pos - input by human player
# @mark - 'O'
playerMove <- function(board, pos, mark) {
  board[pos] <- mark
  cat("You placed ", mark, "at position", pos, "\n")
  return(board)
}

# updates the board based on the computer's moves
# @param board
# @param pos - input by computer player
# @mark - 'X'
computerMove <- function(board, mark){
  
  notFilled <- board[!board %in% c("x", "o") ]   # check which pos is not marked by X
  pos <- as.numeric(sample(notFilled, 1)) # randomly sample a position that is not marked
  board[pos] <- mark
  cat("Computer placed ", mark, " at position ", pos, "\n")
  return (board)
}

# Intialize game
play <- function() {
  playerMode <- readline(prompt = "Enter 'Y' to play with computer or 'N' if you have another human player.  ")
  
  while (!toupper(playerMode) %in% c("Y", "N")) {
    playerMode <- (readline(prompt = "Please enter 'Y'or 'N' only: "))
  }
  
  
  if (toupper(playerMode) == 'Y') {
    while (checkIfWinnerExist(board)==F) { 
      
      comp <-  'x'
      board <-  computerMove(board, comp)
      showBoard(board)
      
      
      if (checkIfWinnerExist(board) == T) { # If playing with computer
        cat("The computer has won.") 
        break;  
      }
      
      # if all spaces in board are occupied and there are no winners, break loop and display msg
      if(sum(board == "x") + sum(board == "o") == 9 && checkIfWinnerExist(board) == F){
        cat("It is a tie!.")  
        break
      }  
      
      humanPos <- as.numeric(readline("Where would you like to place o? "))
      while (board[humanPos] == "x" || !humanPos %in% c(1:9) || board[humanPos] == "o"){
        humanPos <- as.numeric(readline(prompt = "This position is already marked or is an invalid value. Please enter another number: "))
        
      } 
      
      human <- "o"
      board <- playerMove(board, humanPos, human)
      showBoard(board)
      
      if(checkIfWinnerExist(board) == T){
        cat("Player o has won.")
        break
      } 
      
    }  
    
  } else if (toupper(playerMode) == 'N') { # If not playing with computer
    
    player1 <- (readline(prompt = "What is Player 1's name? "))
    cat(player1, "will play as Player X. ")
    
    player2 <- (readline(prompt = "What is Player 2's name? "))
    cat(player2, "will play as Player O. ")
    
    showBoard(board)
    while (checkIfWinnerExist(board)==F) { 
      p1Pos <- as.numeric(readline(cat("It is",  player1  ,"\'s turn. Where would you like to place x? ")))
      
      
      while (board[p1Pos] == "x" || !p1Pos %in% c(1:9) || board[p1Pos] == "o"){
        p1Pos <- as.numeric(readline(prompt = "This position is already marked or is an invalid value. Please enter another number: "))
        
      } 
      
      p1 <- "x"
      board <- playerMove(board, p1Pos, p1)
      checkIfWinnerExist(board)
      showBoard(board)
      
      
      if (checkIfWinnerExist(board) == T) {
        cat(player1, "has won.") 
        break;  
      }
      if(sum(board == "x") + sum(board == "o") == 9 && checkIfWinnerExist(board) == F){
        cat("It is a tie!.")  
        break
      } 
      
      p2Pos <- as.numeric(readline(cat("It is",  player2  ,"\'s turn. Where would you like to place o? ")))
      while (board[p2Pos] == "x" || !p2Pos %in% c(1:9) || board[p2Pos] == "o"){
        p2Pos <- as.numeric(readline(prompt = "This position is already marked or is an invalid value. Please enter another number: "))
        
      } 
      
      p2 <- "o"
      board <- playerMove(board, p2Pos, p2)
      showBoard(board)
      
      if(checkIfWinnerExist(board) == T){
        cat(player2, "has won.")
        break
      } 
      
      
    }
     
    
  } 
  options(warn = defaultW)
}

#options(warn = defaultW)
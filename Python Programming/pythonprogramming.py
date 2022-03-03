grids = [str(i) for i in range(1,10)]
import random
def main():
    count = 0
    print("\nINSTRUCTIONS: \nPlayer 1 goes first and uses the 'X' mark.\nYou have the option of playing against the computer or another human player. "
        "\nSee numbers next to board for reference on where to place X or O.\n ")
    newBoard = Board()
    print("Player 1 is X")
    print('Enter player 1\'s name: \n')
    user1= input("Enter name : ")

    while True: 
        r = input("\nEnter Y if your second player is a computer. N if you have a second player. ")
        if r == 'Y':
            print("Computer Player is O")
            user2 = 'Computer'
            break
        elif r=='N':
            user2 = input("Enter name : ")
            break
        else: 
            continue
    currUser, nextUser = user1, user2
    X, O = 'X','O'
    while True:
        count += 1 # increment the count to keep count of the rounds
        print(newBoard.getBoard())  # Display board
        pos = None #position is empty at the beginning
        while not newBoard.isValidInput(pos): #if user input is not valid or if _grids['1'] is not empty,
            if currUser == 'Computer':
                pos = newBoard.getComputerInput()
                print(f'{currUser} has placed {X} at the grid {pos}')
            else: 
                print(f'Where would {currUser} like to place {X}? (1-9)') #keep showing this prompt 
                pos = input() #get user input for board position
        newBoard.updateBoard(pos, X, count) #update board with position and the mark 'X' or 'O'
        # The game is over if there is a winner, or the board is full and it is a tie
        if newBoard.checkWinning(X): #use this method to check for a winner
            print(newBoard.getBoard()) #show board
            print(currUser + ' has won!')
            break #break both loops when there is a winner
        elif newBoard.checkBoardFull(): #check if the board is full
            print(newBoard.getBoard()) #show board
            print('The game is a tie!')
            break #break both loops when there is a tie
        X, O = O, X # switch turns while loop is unbroken
        currUser, nextUser = nextUser, currUser  # switch turns while loop is unbrokesn
    print('Game over! Thank you for playing. ')
    
class Board:
    def __init__(self): 
        self._grids = {} # private attr, dictionary
        self._grids = dict.fromkeys(grids, ' ')
       # for g in grids: # for 1-9 in the list 'grids', create a dictionary where _grids['3'] = ' ' is empty
        
    def getBoard(self):
    # enclose variable within the {} to display, at beginning they are all empty
        return f'''
      \t{self._grids['1']}|{self._grids['2']}|{self._grids['3']}  1 2 3
      ---------
      \t{self._grids['4']}|{self._grids['5']}|{self._grids['6']}  4 5 6
      ---------
      \t{self._grids['7']}|{self._grids['8']}|{self._grids['9']}  7 8 9\n\n\n'''

    def isValidInput(self, g):
        return g in grids and self._grids[g] == ' ' #returns false
        #check if user's input is a valid number from 1-9 and if the grid of that num is empty

    def isValidUser(self, g):
        return g in grids and self._grids[g] == ' ' #returns false
        #check if user's input is a valid number from 1-9 and if the grid of that num is empty

    def getComputerInput(self): 
        emptyGrids = [k for k,v in self._grids.items() if v == ' ']
        return random.sample(emptyGrids, 1)[0] #randomly sample a key//pos where the grid is empty

    def checkWinning(self, user):
        g = self._grids #get the dict containing all key-value pairs
        u = user #get the current user
        # e.g., check if g['2'] == 'X'
        return ((g['1'] == g['2'] == g['3'] == u) or # Across the top
                (g['4'] == g['5'] == g['6'] == u) or # Across the middle
                (g['7'] == g['8'] == g['9'] == u) or # Across the bottom
                (g['1'] == g['4'] == g['7'] == u) or # Down the left
                (g['2'] == g['5'] == g['8'] == u) or # Down the middle
                (g['3'] == g['6'] == g['9'] == u) or # Down the right
                (g['3'] == g['5'] == g['7'] == u) or # Diagonal
                (g['1'] == g['5'] == g['9'] == u))   # Diagonal

    def checkBoardFull(self):
        for g in grids: 
            if self._grids[g] == ' ':
                return False 
        return True #if all keys have a value, return true

    def updateBoard(self, g, user, c):
        """Sets the space on the board to player."""
        self._grids[g] = user #set the value e.g., 'X' to a specific key '1'
        print("--------------------------")
        print(f'\tRound {c}')
        print("--------------------------")

if __name__ == "__main__":
    main() # Call main() if this module is run, but not when imported.
     
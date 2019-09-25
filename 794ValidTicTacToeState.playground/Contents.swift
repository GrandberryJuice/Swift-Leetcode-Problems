import UIKit

/*
 A Tic-Tac-Toe board is given as a string array board. Return True if and only if it is possible to reach this board position during the course of a valid tic-tac-toe game.

 The board is a 3 x 3 array, and consists of characters " ", "X", and "O".  The " " character represents an empty square.

 Here are the rules of Tic-Tac-Toe:

 Players take turns placing characters into empty squares (" ").
 The first player always places "X" characters, while the second player always places "O" characters.
 "X" and "O" characters are always placed into empty squares, never filled ones.
 The game ends when there are 3 of the same (non-empty) character filling any row, column, or diagonal.
 The game also ends if all squares are non-empty.
 No more moves can be played if the game is over.

 Examples:

 Example 1:
 Input: board = ["O  ", "   ", "   "]
 Output: false
 Explanation: The first player always plays "X".

 Example 2:
 Input: board = ["XOX", " X ", "   "]
 Output: false
 Explanation: Players take turns making moves.

 Example 3:
 Input: board = ["XXX", "   ", "OOO"]
 Output: false

 Example 4:
 Input: board = ["XOX", "O O", "XOX"]
 Output: true

**/


func validBoard(_ board: [String]) -> Bool {
    var xCounter = 0
    var oCounter = 0

    for row in board {
        for col in row {
            if col == Character("X") {
                xCounter += 1
            } else if col == Character("O") {
                oCounter += 1
            }
        }
    }

    if (xCounter < oCounter || xCounter - oCounter > 1) {
        return false
    }

    let convertedBoard = convertToTwoDimensionalMatrix(board: board)
    let xWon = countWon(board: convertedBoard, char: "X")
    let oWon = countWon(board: convertedBoard, char: "O")

    if xWon > 2 || oWon > 2 { return false }

    if xWon == 1 {
        return oWon == 0 && xCounter > oCounter
    }

    if oWon == 1 {
        return xWon == 0 && xCounter == oCounter
    }

    return true
}


func convertToTwoDimensionalMatrix(board: [String]) -> [[String]] {
    var convertedBoard: [[String]] = [[]]

    for row in 0...2 {
        convertedBoard.append([])
        for column in board[row] {
            convertedBoard[row].append(String(describing: column))
        }
    }

    convertedBoard.removeLast()
    return convertedBoard
}

func countWon(board: [[String]], char: String) -> Int {
    var count = 0

    for i in 0...2 {
        // check each row accross
        if board[i][0] == char && board[i][1] == char && board[i][2] == char {
            count += 1
        }

        // check each row going down
        if board[0][i] == char && board[1][i] == char && board[2][i] == char {
            count += 1
        }
    }

    // check diagonal
    if board[1][1] == char { // middle of board
        if board[0][0] == char && board[2][2] == char { count += 1 }
        if board[0][2] == char && board[2][0] == char { count += 1 }
    }

    return count
}


let testArr = ["XXX","   ","OOO"]
let testArr2 = ["XXX","OOX","OOX"]
let testArr3 = ["XOX","OXO","XOX"]

validBoard(testArr3)


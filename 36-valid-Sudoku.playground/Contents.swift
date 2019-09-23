import UIKit

// 36. Valid Sudoku

/**
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 **/


class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let length = 9
        guard board.count == length, board[0].count == length else { return false }

        // Validate rows
        for row in 0..<length {
            var counts = [Character: Int]()
            for column in 0..<length {
                counts[board[row][column], default: 0] += 1
            }
            guard isSudokuCountsValid(counts: counts) else { return false }
        }

        // Validate columns
        for column in 0..<length {
            var counts = [Character: Int]()
            for row in 0..<length {
                counts[board[row][column], default: 0] += 1
            }
            guard isSudokuCountsValid(counts: counts) else { return false }
        }

        guard isSudokuSectionValid(board: board, rows: 0...2, columns: 0...2) else { return false }
        guard isSudokuSectionValid(board: board, rows: 0...2, columns: 3...5) else { return false }
        guard isSudokuSectionValid(board: board, rows: 0...2, columns: 6...8) else { return false }

        guard isSudokuSectionValid(board: board, rows: 3...5, columns: 0...2) else { return false }
        guard isSudokuSectionValid(board: board, rows: 3...5, columns: 3...5) else { return false }
        guard isSudokuSectionValid(board: board, rows: 3...5, columns: 6...8) else { return false }

        guard isSudokuSectionValid(board: board, rows: 6...8, columns: 0...2) else { return false }
        guard isSudokuSectionValid(board: board, rows: 6...8, columns: 3...5) else { return false }
        guard isSudokuSectionValid(board: board, rows: 6...8, columns: 6...8) else { return false }

        return true
    }

    private func isSudokuSectionValid(board: [[Character]], rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Bool {
        var counts = [Character: Int]()
        for row in rows {
            for column in columns {
                counts[board[row][column], default: 0] += 1
            }
        }
        return isSudokuCountsValid(counts: counts)
    }

    private func isSudokuCountsValid(counts: [Character: Int]) -> Bool {
        for (value, count) in counts {
            guard value != "." else { continue }
            guard count == 1 else { return false }
        }
        return true
    }
}

var board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]

//print(board.count)
let solution = Solution()
solution.isValidSudoku(board)

extension Int {
    static func + (left: inout Int, right: Int) -> Int {
        return left + right
    }
}

var one = 1

func isValidSudokuBoard(_ row: inout Int, column: inout Int, board: inout [[Character]]) -> Bool {
    var columnState = 0

    if column == 8 {
        // reset row and  increase column
        row += 1
        column = 0

        // exit method
        if row == board.count {
            return true
        }
    }


    if board[row][column] == "." {
        for value in 1...9 {
            let charToPlace: Character = Character("\(value)")

            if(checkSudokuBoard(row: &row, col: &column, board: &board, charToPlace: charToPlace)) {
                //set placment and return true
                board[row][column] = charToPlace
                columnState = column + 1

                if (isValidSudokuBoard(&row, column: &columnState, board: &board)) {
                    return true
                }
            }
        }
        // nothing would work out so we leave the method
        return false
    } else {
        columnState = column + 1
        isValidSudokuBoard(&row, column: &columnState, board: &board)
    }

    board[row][column] = "."
    return false
}


func checkSudokuBoard(row: inout Int, col: inout Int, board: inout [[Character]], charToPlace: Character) -> Bool {
    // check the row -> moving right
    for boardRow in 0...8 {
        if charToPlace == board[boardRow][col] {
            return false
        }
    }

    // checking column -> moving down
    for boardColumn in 0...8 {
        if charToPlace == board[row][boardColumn] {
            return false
        }
    }

    // check 3 x 3 board
    let I = row / 3
    let J = col / 3

    let topLeftOfSubBoxRow = 3 * I; // the row of the top left of the block
    let topLeftOfSubBoxCol = 3 * J;

    for i in 0...2 {
        for j in 0...2 {
            if (charToPlace == board[topLeftOfSubBoxRow + i][topLeftOfSubBoxCol + j]) {
                return false;
            }
        }
    }

    return true
}

var newRow = 0
var newCol = 0

//isValidSudokuBoard(&newRow, column: &newCol, board: &board)




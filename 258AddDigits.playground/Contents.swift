import UIKit

//// count how many 'abc' and 'aba' in a string recursivly

func addDigits(_ num: Int) -> Int {
    guard num / 10 != 0 else {
        return num
    }

    let firstNumber = num / 10
    let secondNumber = num % 10

    let total = firstNumber + secondNumber
    return addDigits(total)
}

let value = addDigits(38)


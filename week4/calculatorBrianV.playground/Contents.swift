import Foundation
// basic calculator
// brian veitch


// variables for input --------------------------------------
let firstNumber = 17
let secondNumber = 41
let thirdNumber = 0.15

// variables for results
var addition: Int
var subtraction: Int
var multiplication: Int
var division: Double
var percent: Double
var percentOf: Double


// operations ---------------------------------------
addition = firstNumber + secondNumber
subtraction = firstNumber - secondNumber
multiplication = firstNumber * secondNumber

// NOTE: division, percent, percentOf should be double because the value will likely have decimals
division = Double(firstNumber) / Double(secondNumber)

// calculates what percentage the first number is of the second number
percent =  abs(100 * Double(firstNumber) / Double(secondNumber))

// given the percentage, this finds the percentage of the first number
percentOf = thirdNumber * Double(firstNumber)


// print operations ---------------------------------
print("Addition: \(firstNumber) + \(secondNumber) = \(addition)")
print("Subtraction: \(firstNumber) - \(secondNumber) = \(subtraction)")
print("Multiplication: \(firstNumber) * \(secondNumber) = \(multiplication)")
print("Division: \(firstNumber) / \(secondNumber) = \(division)")

print("Percent: \(firstNumber) is \(percent)% of \(secondNumber)")
print("Percent: \(thirdNumber*100)% of \(firstNumber) is \(percentOf)")




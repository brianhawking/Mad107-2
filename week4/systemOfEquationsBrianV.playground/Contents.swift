import Foundation
/*
 Solve a system of equations. To make it easy it will have
 only two equations and two variables. The coefficients
 will be non-zero to avoid any special cases in the
 algorithm.
 I'll have the program print out the steps as they're performed.
 
 - Brian Veitch
 */

/* Example to follow
 3x + 5y = 9
 2x + 3y = 5
*/
 
// variables
let coefficient1X = 3
let coefficient1Y = 5
let constant1 = 9

let coefficient2X = 2
let coefficient2Y = 3
let constant2 = 5

var solutionForX: Double
var solutionForY: Double

// variables to store values after operations
var equationOne = [coefficient1X, coefficient1Y, constant1]
var equationTwo = [coefficient2X, coefficient2Y, constant2]



// operations
/* NOTE: This is not an efficient way! But it avoids any complicated functions like findind the GCD and LCM and using any loops

Step 1. Multiply Equation 1 by Coefficient2X
Step 2. Multiply Equation 2 by Coefficient1X
Step 3: Add equations (the Xs will cancel)
Step 4: You're left with cY = B. Solve for Y
Step 5: Use Equation 1 to find value of X
 */

print("Solve \(coefficient1X)x + \(coefficient1Y)y = \(constant1) and \(coefficient2X)x + \(coefficient2Y)y = \(constant2)")

print("Multiply equations 1 by a constant and equation 2 by a constant so they have the same but opposite coefficients.")

// Step 1 - Multiply Equation 1 by Coefficient2X
equationOne[0] *= coefficient2X
equationOne[1] *= coefficient2X
equationOne[2] *= coefficient2X
print("Multiply Equation 1 by \(coefficient2X) to get \(equationOne[0])x + \(equationOne[1])y = \(equationOne[2])")

// Step 2 - Multiply Equation 2 by Coefficient1X
//        - check if coefficients for X are same sign.
if coefficient1X * coefficient2X > 0 {
    equationTwo[0] *= -1*coefficient1X
    equationTwo[1] *= -1*coefficient1X
    equationTwo[2] *= -1*coefficient1X
    print("Multiply Equation 2 by \(-1*coefficient1X) to get \(equationTwo[0])x + \(equationTwo[1])y = \(equationTwo[2])")
}
else {
    equationTwo[0] *= coefficient1X
    equationTwo[1] *= coefficient1X
    equationTwo[2] *= coefficient1X
    print("Multiply Equation 2 by \(coefficient1X) to get \(equationTwo[0])x + \(equationTwo[1])y = \(equationTwo[2])")
}

// Step 3 - add equations (the Xs will cancel)
equationTwo[0] += equationOne[0]
equationTwo[1] += equationOne[1]
equationTwo[2] += equationOne[2]
print("Add the equations together to get \(equationTwo[1])y = \(equationTwo[2])")

// Step 4 - Solve for Y
solutionForY = Double(equationTwo[2]) / Double(equationTwo[1])
print("Solve for y to get y = \(solutionForY)")

// Step 5 - Solve for X
solutionForX = (Double(constant1) - Double(coefficient1Y) * solutionForY) / Double(coefficient1X)

print("Plug in \(solutionForY) into equation 1's y value to get \(coefficient1X)x + \(coefficient1Y)*\(solutionForY) = \(constant1)")
print("Solve for x to get x = \(solutionForX)\n")
print("Final answer: x = \(solutionForX), y = \(solutionForY)")






print("Final answer: x = \(fractionOf(decimal: solutionForX)), y = \(fractionOf(decimal: solutionForY))")



// convert to fractions
func fractionOf(decimal: Double) -> String {
    
    if (decimal == floor(decimal)) {
        return String(Int(decimal))
    }
    
    let eps: Double = 1.0E-6
    var x = decimal
    var a = floor(x)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)

    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = floor(x)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return "\(h)/\(k)"
}










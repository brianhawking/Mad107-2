import UIKit

// 2x + 3y = 5
// -1x -3y = 3

// equation coefficients
var eqn1X = 2
var eqn1Y = 3
var eqn1Constant = 5

var eqn2X = -1
var eqn2Y = -3
var eqn2Constant = 3

// find gcd of X coefficients
func gcd(_ x: Int, _ y: Int) -> Int {
    var a = 0
    var b = max(abs(x), abs(y))
    var r = min(abs(x), abs(y))
    
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

// find lcm
var lcmX = abs(eqn1X * eqn2X / gcd(eqn1X, eqn2X))


print("Multiply the first equation by \(lcmX / eqn1X) to get \(lcmX)x + \(lcmX/eqn1X * eqn1Y)y = \(lcmX/eqn1X * eqn1Constant)")
print("Multiply the secodn ewquation by \(-1*lcmX / eqn2X) to get \(-1*lcmX)x + \(-1*lcmX/eqn2X * eqn2Y)y = \(-1*lcmX/eqn2X * eqn2Constant)")

print("Add the equations together. Note that the Xs should cancel")

print(





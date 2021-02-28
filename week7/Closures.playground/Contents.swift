
import UIKit

//Closures are self-contained blocks of functionality that can be passed around and used in your code.

//Closures take one of three forms:
//
//Global functions are closures that have a name and do not capture any values.
//
//Nested functions are closures that have a name and can capture values from their enclosing function.
//
//Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.


// Some data
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// One way to provide the sorting closure is to write a normal function of the correct type, and to pass it in as an argument to the sorted(by:) method:

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// The example below shows a closure expression version of the backward(_:_:) function from above:

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})




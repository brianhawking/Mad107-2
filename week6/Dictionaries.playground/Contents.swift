// Playground - noun: a place where people can play

import UIKit


// Dictionary of strings

var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]

// find number of items

print("The dictionary of airports contains \(airports.count) items")
// prints "The dictionary of airports contains 2 items."

// add an item

airports["LHR"] = "London"
// the airports dictionary now contains 3 items
print(airports.count)


// change an item

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"

// change using updateValue

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// prints "The old value for DUB was Dublin."



// Use subscript syntax to retrieve a value from the dictionary for a particular key

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// prints "The name of the airport is Dublin International."


//Use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

// This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International."

// Iterating thru a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow


// retrive things

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: TYO
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Tokyo
// Airport name: London Heathrow


// Create an empty Dictionary

var namesOfIntegers = Dictionary<Int, String>()
// namesOfIntegers is an empty Dictionary<Int, String>

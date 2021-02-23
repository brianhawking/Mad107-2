// Playground - noun: a place where people can play

import UIKit

var str = "Welcome to the Array playground"

// Array Literals

var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items

// Accessing and Moditying Arrays

print("The shopping list contains \(shoppingList.count) items.")
// prints "The shopping list contains 2 items."

// Empty?

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// prints "The shopping list is not empty."

// Append Item - using methood

shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes
print(shoppingList.count)

// using assignment operator

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
print(shoppingList.count)

// append an array of compatible items

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
print(shoppingList.count)

// retrieve items in an array

var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

// change an existing value

shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"

// change a bunch of values

shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items
print(shoppingList.count)

// put something in a specific spot

shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
print(shoppingList[0])

// remove something

let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
print(shoppingList.count)

// remove the last item

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no cheese
// the apples constant is now equal to the removed "Apples" string
print(shoppingList.count)

// Iterating thru an array

for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

// Creating and Initializing arrays

// Empty

var someInts = [Int]()
print("someInts is of type Int[] with \(someInts.count) items.")
// prints "someInts is of type Int[] with 0 items."


// Size & Type

var threeDoubles = [Double](repeating: 0.0, count: 3)
// threeDoubles is of type Double[], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is inferred as Double[], and equals [2.5, 2.5, 2.5]

// Adding Arrays

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as Double[], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

/*:
 ## Exercise: Making a Shopping List

 The constants below represent some of the things you might want to add to a shopping list:
*/
let eggs = "Eggs"
let milk = "Milk"
let cheese = "Cheese"
let bread = "Bread"
let rice = "Rice"
let newLine = "\n"
//: - callout(Exercise): Create a string variable with an initial value of `""`. Add each constant item above to the list, one at a time. Add a `newLine` in between each item. Remember you can join two strings using the `+` operator.
var shoppingList = ""

// add items to shopping list
// I'll do it directly and with the compound assignment operators

shoppingList += eggs
shoppingList += newLine

shoppingList = shoppingList + milk + newLine
shoppingList = shoppingList + cheese + newLine

shoppingList += bread
shoppingList += newLine

shoppingList += rice
shoppingList += newLine

print(shoppingList)







//: [Previous](@previous)  |  page 12 of 13  |  [Next: Exercise: 501](@next)

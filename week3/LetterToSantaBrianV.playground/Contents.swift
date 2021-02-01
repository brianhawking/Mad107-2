// Letter To Santa
// Uses data (name, age, bahavior, toys) to customize a letter to Santa

import UIKit

// -------- INFO NEEDED FOR LETTER ------------------------------

let name = "Brian"
let age = 4
let behavior = "bad"
let gender = "boy"
let toys = ["Trucks, ", "Dinosaurs, ", "Llama Llama Book."]

// ----------------------------------------------------------------

var letterToSanta = ""
var letterFromSanta = ""


// generate letter to Santa
letterToSanta += "Dear Santa,\n"
letterToSanta += "My name is \(name) and I am \(age) years old.  I have been a \(behavior) \(gender) this year.\n"
letterToSanta += "For Christmas I want "
for toy in toys {
    letterToSanta += toy
}
letterToSanta += ".\nI will leave out cookies and milk Chirstmas Eve.  Merry Christmas.\n"
letterToSanta += "Love, \(name)"
print(letterToSanta)


// generate letter from Santa
letterFromSanta += "Dear \(name),\n"
letterFromSanta += "Ho, Ho, Ho! I checked my naughty or nice book and I see you have been a \(behavior) \(gender).\n"

if (behavior == "good"){
    letterFromSanta += "I will be happy to put the following toys on my official list: "
    for toy in toys {
        letterFromSanta += toy
    }
}
else {
    letterFromSanta += "I know you want "
    for toy in toys {
        letterFromSanta += toy
    }
    letterFromSanta += "\nOnce you're on the nice list again I'll be happy to bring you those toys."
}

letterFromSanta += "\nMerry Christmas, Santa"
print("\n")
print(letterFromSanta)

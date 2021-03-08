import Cocoa

public struct Customer {
    var total: Double = 0
    var items: [Burger]?
    
    mutating func addItem(burger: Burger) {
        if items == nil {
            items = [burger]
        }
        else {
            items!.append(burger)
        }
        
        print("\n")
        print("Would you like to create another burger?")
    }
    
    mutating func checkout() {
        total = 0
        if items != nil {
            // have items
            for item in items! {
                total += 10.50
               
                if let meats = item.meats {
                    total += 2.5*Double((meats.count-1))
                }
            }
        }
        
        print("Your total cost is $\(total)")
    }
}

var customer = Customer()

// start interaction
print("Welcome to Bill's Burgers.  How can I help you?")

// select items
var burger = Burger()

// add bun
burger.addBun(item: "wheat")


// add meats
burger.addMeats(arrayOfMeats: ["Beef", "eggsalad"])

// select cheese
burger.addCheese(item: "")

// select condiments
burger.addCondiments(items: ["Ketchup", "Mustard", "Lettuce", "Pickles"])

// add to cusomters cart
customer.addItem(burger: burger)

//customer.checkout()

// add another burger
var burger2 = Burger()

// add bun
burger2.addBun(item: "Wheat")

// add meats
burger2.addMeats(arrayOfMeats: ["Beef", "Turkey"])

// select cheese
burger2.addCheese(item: "")

// select condiments
burger2.addCondiments(items: ["fried_egg", "tomatoes", "bbq_sauce"])

// add to customer cart
customer.addItem(burger: burger2)

customer.checkout()









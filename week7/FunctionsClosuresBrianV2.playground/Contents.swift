import Foundation

// create grocery list
// restock


// list of neccessary items, their location, and required number
let Household: [String: Int] = [
    "Milk": 2,
    "Cereal": 3,
    "Eggs": 1,
    "Apples": 6,
    "Bananas": 6,
    "Potato Chips": 2,
    "Peanut Butter": 2,
    "Bread": 2,
    "Jelly": 1,
    "Frozen Peas": 3
]

var currentItems: [String: Int] = [:]
var groceryItems: [String: Int] = [:]

for (key, _) in Household {
    currentItems[key] = 0
}


func displayItems(list: [String: Int]) {
    print("==================================")
    if list.count != 0 {
        for (key, value) in list {
            print(key, value)
        }
    }
    print("===================================")
    
}

//displayItems(list: Household)
//displayItems(list: currentItems)

func createGroceryList(list: [String: Int]) -> [String: Int] {
    
    var addToList: [String: Int] = [:]

    
    for requiredItem in Household {
        if let item = list[requiredItem.key] {
            // found item
            if requiredItem.value - item == 0 {
                addToList[requiredItem.key] = nil
            }
            else {
                // number of of those items I need to get
                addToList[requiredItem.key] = requiredItem.value - item
            }
            
        }
        else {
            // need the item
            addToList[requiredItem.key] = requiredItem.value
            
        }
        
    }
    if addToList.count == 0 {
        print("You don't need any groceries.")
    }
    return addToList
}

//groceryItems = createGroceryList(list: currentItems)
//displayItems(list: groceryItems)

func restockItems(currentList: [String: Int], groceryList: [String: Int]) -> [String: Int] {
    
    var newList = currentList
    
    for item in groceryList {
        if let num = currentList[item.key] {
            newList.updateValue(num+item.value, forKey: item.key)
        }
        else {
            newList[item.key] = item.value
        }
        
    }
    return newList
}


//groceryItems = createGroceryList(list: currentItems)
//displayItems(list: groceryItems)


//currentItems = restockItems(currentList: currentItems, groceryList: groceryItems)
//displayItems(list: currentItems)
//
//groceryItems = createGroceryList(list: currentItems)
//displayItems(list: groceryItems)

//displayItems(list: currentItems)
currentItems = restockItems(currentList: currentItems, groceryList: [
    "Milk": 1,
    "Eggs": 1,
    "Apples": 3
])
//displayItems(list: currentItems)

//groceryItems = createGroceryList(list: currentItems)
//displayItems(list: groceryItems)


// closures
let useItem:(String) -> () = { item in
    // get current number of items
    if let numItems = currentItems[item] {
        currentItems.updateValue(numItems-1, forKey: item)
    }
}

displayItems(list: currentItems)
useItem("Milk")
displayItems(list: currentItems)

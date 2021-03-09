import Foundation

public struct Burger {
    public var bun: String?
    public var meats: [String]?
    public var cheese: String?
    public var condiments: [String]?
    
    public init() {
        print("Let's build this burger!")
        displayText(text: "Select your bun")
        listBuns()
    }
    
    public enum listOfBuns: String, CaseIterable {
        case white, wheat, brioche, pretzel
    }
    
    public enum listOfCondiments: String, CaseIterable {
        case ketchup, mustard, lettuce, tomatoes, onions, carmelized_onions, pickles, fried_egg, bbq_sauce
    }
    
    public enum listOfCheeses: String, CaseIterable {
        case american, pepperjack, cheddar, provalon, swiss
    }
    
    public enum listOfMeats: String, CaseIterable {
        case beef, turkey, ham, bacon
    }
    
    public func listMeats() {
        print("You may choose any of the following meats.")
        for item in listOfMeats.allCases {
            print(item.rawValue.capitalized)
        }
    }
   
    public func listBuns() {
        print("You may choose one of the following buns.")
        for item in listOfBuns.allCases {
            print(item.rawValue.capitalized)
        }
    }
    
    public func listCheeses() {
        print("You may choose one of the following cheeses.")
        for item in listOfCheeses.allCases {
            print(item.rawValue.capitalized)
        }
    }
    
    public func listCondiments() {
        print("You may choose any of the following condiments.")
        for item in listOfCondiments.allCases {
            print(item.rawValue.capitalized)
        }
    }
    
    func isItemOnList(item: String) -> Bool {
    
        if item == "" {
            return true
        }
        
        for bun in listOfBuns.allCases {
            if item.lowercased() == bun.rawValue.lowercased() {
                return true
            }
        }
        for meat in listOfMeats.allCases {
            if item.lowercased() == meat.rawValue.lowercased() {
                return true
            }
        }
        for cheese in listOfCheeses.allCases {
            if item.lowercased() == cheese.rawValue.lowercased() {
                return true
            }
        }
        for condiment in listOfCondiments.allCases {
            if item.lowercased() == condiment.rawValue.lowercased() {
                return true
            }
        }
        
        displayText(text: "\(item) is not on the menu")
        return false
    }
    
    public mutating func addBun(item: String) {
        
        if !isItemOnList(item: item){
            return
        }
        
        bun = item
        displayText(text: "Select your meats")
        listMeats()
    
    }
    
    public mutating func addCheese(item: String) {
        
        if !isItemOnList(item: item){
            return
        }
        
        cheese = item
        displayText(text: "Select your condiments")
        listCondiments()
    }
    
    public mutating func addMeats(arrayOfMeats: [String]) {
        for meat in arrayOfMeats {
            if isItemOnList(item: meat) {
                if meats == nil {
                   
                    meats = [meat]
                }
                else {
                    meats!.append(meat)
                }
            }
            
        }
        
        displayText(text: "Select your Cheese")
        listCheeses()
    }
    
    public mutating func addCondiments(items: [String]) {
        for item in items {
            if isItemOnList(item: item){
                if condiments == nil {
                    condiments = [item]
                }
                else {
                    condiments!.append(item)
                }
            }
            
        }
        
        displayBurger()
    }
    
    func displayText(text: String) {
        var border = ""
        for _ in 0..<text.count {
            border += "="
        }
        print("\n")
        print(border)
        print(text)
        print(border)
    }
    
    public func displayBurger() {
        
        displayText(text: "Review your Order")
        
        if let bun = bun, bun != "" {
            print("Bun: \(bun)")
        }
        else {
            print("Bun: none selected")
        }
        
        var list = "Meats: "
        if meats != nil {
            
            for meat in meats! {
                list += meat + ", "
            }
        }
        else {
            list += "none selected"
        }
        print(list)
        
        if let cheese = cheese, cheese != "" {
            print("Cheese: \(cheese)")
        }
        else {
            print("Cheese: none selected")
        }
        
        list = "Condiments: "
        if condiments != nil {
            
            for condiment in condiments! {
                list += condiment + ", "
            }
        }
        else {
            list += "none selected"
        }
        print(list)
        
        displayText(text: "If everything is correct, add it to your order")
        
    }
   
    
    
}


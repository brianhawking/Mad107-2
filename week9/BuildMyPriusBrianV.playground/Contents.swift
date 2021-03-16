import Cocoa


class Toyota {
    
    var myType: String
    var myModel: String?
    var myEngine: String?
    var myInteriorColor: String?
    var myExteriorColor: String?
    var myPackages: [String]?
    var myAccessories: [String]?
    var currentStep: Int = 0
    var myCost: Int = 0
    
    let Engines: [String] = ["1.8L 4-Cyl. Gas/Electric Hybrid"]
    
    let ExteriorColors: [String:Int] = [
        "Electric Storm Blue": 0,
        "Supersonic Red": 425,
        "Wind Chill Pearl": 0,
        "Classic Silver Metallic": 0,
        "Magnetic Gray Metallic": 0,
        "Midnight Black Metallic": 0,
        "Sea Glass Pearl": 0
    ]
    
    let InteriorColors: [String:Int] = [
        "Harvest Beige Softex Trim": 0,
        "Black Softex Trim": 0,
        "Moonstone Softex Trim": 0]
    
    let Models: [String:Int] = [
        "Prius 2020 Edition": 29875,
        "Prius L Eco": 24525,
        "Prius LE": 25735,
        "Prius LE AWD-e": 27135,
        "Prius XLE": 28575,
        "Prius XLE AWD-e": 29575,
        "Prius Limited": 32650
    ]
    
    let InteriorAccessories: [String:Int] = [
        "All-Weather Floor Liners":169,
        "Cargo Liner": 99,
        "Cargo Net - Envelope": 49,
        "Cargo Tote": 50,
        "Carpet Cargo Mat": 90,
        "Carpet Floor Mats": 169,
        "Coin Holder/Ashtray Cup": 17,
        "Emergency Kit": 59,
        "First Aid Kit w/ PPE": 25,
        "Security System": 359,
        "Universal Tablet Holder": 99
    ]
    let ExteriorAccessories: [String:Int] = [
        "Aero Side Splitter": 299,
        "Alloy Wheel Locks": 65,
        "Blackout Wheel Inserts": 299,
        "Body Side Moldings": 289,
        "Door Edge Guards": 125,
        "Illuminated Door Sills": 299,
        "Paint Protection Film (Front Bumper)": 485,
        "Paint Protection Film (Hood, Fenders, Mirror Backs & Door Cups": 395,
        "Rear Bumper Applique": 69,
        "Rear Bumper Protector": 79,
        "Removable Cross Bars": 299
    ]
    
    let PackagedAccessories: [String:[String]] = [
        "All-Weather Floor Liner Package": ["All-Weather Floor Liners", "Cargo Liner"],
        "Carpet Mat Package": ["Carpet Floor Mats", "Carpet Cargo Mat"],
        "Four Season Floor Mat/Liner Package":["Carpet Floor Mats", "Carpet Cargo Mat", "All-Weather Floor Liners"],
        "Preferred Accessory Package w/ All-Weather Floor Liners": ["First Aid Kit w/ PPE", "All-Weather Floor Liners", "Cargo Liner", "Rear Bumper Applique", "Cargo Net - Envelope"],
        "Preferred Accessory Package w/ Carpet Mats": ["First Aid Kit w/ PPE", "Carpet Floor Mats", "Carpet Cargo Mat", "Rear Bumper Applique", "Cargo Net - Envelope"],
        "Protection Package #2": ["Body Side Moldings", "Door Edge Guards", "Rear Bumper Protector"],
        "Protection Package #3": ["Body Side Moldings", "Door Edge Guards", "Rear Bumper Applique"]
    ]
    
    var CarPackages: [String: Int] = [
        "Premium Convenience Package": 515,
        "Advanced Technology Package": 800,
        "Advanced Technology Package: with options": 1315
    ]
    
    init() {
        myType = ""
    }
    
    func start() {
        currentStep = -1
        nextStep()
    }
    
    func nextStep() {
        currentStep += 1
        switch currentStep {
        case 0:
            displayModels(type: myType)
        case 1:
            displayEngines()
        case 2:
            displayExteriorColors()
        case 3:
            displayInteriorColors()
        case 4:
            displayPackages()
        case 5:
            displayAccessories(filter: "All")
        default:
            displayText(text: "Something went wrong. Please start again.")
        }
    }
    
    func displayText(text: String) {
        var border = ""
        for _ in 0..<text.count {
            border += "="
        }
        print(border)
        print(text)
        print(border)
    }
    
    func displayModels(type: String) {
        displayText(text: "Select your model. Choose from the following:")
        
        switch type {
        case "Prius":
            for model in Models {
                print(model.key,"-",model.value)
            }
        default:
            displayText(text: "No models found.")
        }
        
    }
    
    func displayEngines() {
        displayText(text: "Select your model. Choose from the following:")
        for engine in Engines {
            print(engine)
        }
    }
    
    func displayExteriorColors() {
        displayText(text: "Choose your Exterior Colors:")
        for color in ExteriorColors {
            print(color.key,"-", color.value)
        }
    }
    
    func displayInteriorColors() {
        displayText(text: "Choose your Interior Colors:")
        for color in InteriorColors {
            print(color.key, "-", color.value)
        }
    }
    
    func displayPackages() {
        
    }
    
    func displayAccessories(filter: String) {
        displayText(text: "Add accessories")
        
        switch filter {
        case "All":
            for package in PackagedAccessories {
                var cost = 0
                for accessory in package.value {
                    if InteriorAccessories[accessory] != nil {
                        cost += InteriorAccessories[accessory]!
                        if(accessory == "All-Weather Floor Liners" && package.key != "Four Season Floor Mat/Liner Package") {
                            cost -= 9
                        }
                    }
                    if ExteriorAccessories[accessory] != nil {
                        cost += ExteriorAccessories[accessory]!
                    }
                }
                print(package.key, "-", cost)
            }
            print("")
            for accessory in ExteriorAccessories {
                print(accessory.key, "-", accessory.value)
            }
            print("")
            for accessory in InteriorAccessories {
                print(accessory.key, "-", accessory.value)
            }
            print("")
            
        case "Interior":
            for accessory in InteriorAccessories {
                print(accessory.key, "-", accessory.value)
            }
        case "Exterior":
            for accessory in ExteriorAccessories {
                print(accessory.key, "-", accessory.value)
            }
        case "Packages":
            for package in PackagedAccessories {
                print(package.key)
            }
        default:
            print("default")
        }
    }
    
    func displayRow(text: String, cost: Int) {
        let totalWidth = 100
        let leftOverWidth = totalWidth - text.count - String(cost).count
        
        var t = text
        for _ in 0..<leftOverWidth {
            t += "."
        }
        t += "$"
        t += String(cost)
        
        print(t)
        
    }
    
    func displaySummary() {
        print("\n\n\n")
    
        
       
        if let myModel = myModel, let cost = Models[myModel] {
            print("\n\(myModel)")
            myCost += cost
            displayRow(text: "Starting MSRP", cost: cost)
        }
        
        if let exteriorColor = myExteriorColor, let cost = ExteriorColors[exteriorColor] {
            print("\nExterior Color")
            myCost += cost
            displayRow(text: exteriorColor, cost: cost)
        }
        
        if let interiorColor = myInteriorColor, let cost = InteriorColors[interiorColor] {
            print("\nInterior Color")
            myCost += cost
            displayRow(text: interiorColor, cost: cost)
        }
        
        if let myPackages = myPackages {
            print("\nPackages")

            for package in myPackages {
                if let cost = CarPackages[package] {
                    myCost += cost
                    displayRow(text: package, cost: cost)
                }
            }
        }
        
        var currentAccessories: [String] = []
        if let myAccessories = myAccessories {
            print("\nAccessories")
            for accessory in myAccessories {
                if PackagedAccessories[accessory] != nil {
                    
                    var cost = 0
                    for acc in PackagedAccessories[accessory]! {
                        currentAccessories.append(acc)
                        if InteriorAccessories[acc] != nil {
                            cost += InteriorAccessories[acc]!
                            
                            if acc == "All-Weather Floor Liners" && accessory == "Four Season Floor Mat/Liner Package" {
                                cost -= 9
                            }
                        }
                        if ExteriorAccessories[acc] != nil {
                            cost += ExteriorAccessories[acc]!
                        }
                    }
                    
                    myCost += cost
                    displayRow(text: accessory, cost: cost)
                }
                if InteriorAccessories[accessory] != nil {
                    if !currentAccessories.contains(accessory){
                        myCost += InteriorAccessories[accessory]!
                        displayRow(text: accessory, cost: InteriorAccessories[accessory]!)
                    }
                }
                if ExteriorAccessories[accessory] != nil {
                    if !currentAccessories.contains(accessory) {
                        myCost += ExteriorAccessories[accessory]!
                        displayRow(text: accessory, cost: ExteriorAccessories[accessory]!)
                    }
                    
                }
            }
        }
        
        print("")
        myCost += 995
        displayRow(text: "Delivery, Processing, and Handling Fee", cost: 995)
        
        print("")
        displayRow(text: "Total Price (MSRP) (As Built)", cost: myCost)
        
        
    }
    
    func selectModel(model: String) {
        if Models[model] != nil {
            myModel = model
            displayText(text: "You selected '\(model)'")
        }
        else {
            displayText(text: "\(model) is not a valud option. Please try again.")
        }
    }
    
    func selectEngine(engine: String) {
        if Engines.contains(engine) {
            myEngine = engine
            displayText(text: "You selected '\(engine)'")
        }
        else {
            displayText(text: "\(engine) is not a valid option. Please try again.")
        }
    }
    
    func selectExteriorColor(color: String) {
        if ExteriorColors[color] != nil {
            myExteriorColor = color
            displayText(text: "You selected '\(color)' for your exterior color.")
        }
        else {
            displayText(text: "\(color) is not a valid color.")
        }
    }
    
    func selectInteriorColor(color: String) {
        if InteriorColors[color] != nil {
            myInteriorColor = color
            displayText(text: "You selected '\(color)' for your interior color.")
        }
        else {
            displayText(text: "\(color) is not a valid color.")
        }
    }
    
    func selectPackage(name: String) {
       
    }
    
    func selectAccessories(name: String) {
        // is it an individual accessory or packaged accessory
        if PackagedAccessories[name] != nil {
            if myAccessories != nil {
                myAccessories!.append(name)
                
            }
            else {
                myAccessories = [name]
            }
            displayText(text: "\(name) added.")
            myAccessories = Array(Set(myAccessories!))
            return
        }
        
        if InteriorAccessories[name] != nil {
            if myAccessories != nil {
                myAccessories!.append(name)
            }
            else {
                myAccessories = [name]
            }
            displayText(text: "\(name) added.")
            myAccessories = Array(Set(myAccessories!))
            return
        }
        if ExteriorAccessories[name] != nil {
            if myAccessories != nil {
                myAccessories!.append(name)
                
            }
            else {
                myAccessories = [name]
            }
            displayText(text: "\(name) added.")
            myAccessories = Array(Set(myAccessories!))
            return
        }
        
        
        
//
//        if let package = PackagedAccessories[name] {
//            for acc in package {
//
//                if InteriorAccessories[acc] != nil {
//                    if myAccessories != nil {
//                        myAccessories!.append(acc)
//                    }
//                    else {
//                        myAccessories = [acc]
//                    }
//                    displayText(text: "\(acc) added.")
//                    myAccessories = Array(Set(myAccessories!))
//                }
//
//                if  ExteriorAccessories[acc] != nil {
//                    if myAccessories != nil {
//                        myAccessories!.append(acc)
//
//                    }
//                    else {
//                        myAccessories = [acc]
//                    }
//                    displayText(text: "\(acc) added.")
//                    myAccessories = Array(Set(myAccessories!))
//                }
//            }
//            return
//        }
        displayText(text: "Accessory was not found.")
    }
}

class Prius: Toyota {
    
    var Packages: [String: [(name: String, cost: Int)]] = [
        "Prius XLE": [(name: "Premium Convenience Package", cost: 515),
                      (name: "Advanced Technology Package", cost: 800),
                      (name: "Advanced Technology Package: with options", cost: 1315)
        ],
        "Prius XLE AWD-e": [(name: "Advanced Technology Package", cost: 800)],
        "Prius Limited": [(name: "Premium Convenience Package", cost: 515)]
    ]

    override func displayPackages() {
        displayText(text: "Choose your package(s)")
        if let model = myModel, let packages = Packages[model] {
            for package in packages {
                print(package.name,"-",package.cost)
            }
        }
        else {
            displayText(text: "No available packages.")
        }
    }
    
    override func selectPackage(name: String) {
        // check if car has that package
        if let model = myModel, let packages = Packages[model] {
            for package in packages {
                if name == package.name {
                    if myPackages == nil {
                        myPackages = [name]
                    }
                    else {
                        myPackages!.append(name)
                    }
                displayText(text: "You added the package: \(name)")
                return
                }
            }
        }
        displayText(text: "No package found.")
    }
    
    func addAdditionalSpecs() {
        // add/remove colors, packages, etc.
    }
                              
    override init() {
        super.init()
        myType = "Prius"
        addAdditionalSpecs()
        displayText(text: "Welcome to Build My Prius. Let's get started.")
    }

}

// build prius: var car = Prius()
// start building: car.start()
// methods: nextStep(), selectModel(), selectEngine(), selectExteriorColors()
// selectInteriorColors(), selectPackage(), selectAccessories()

var car = Prius()

car.start()

car.selectModel(model: "Prius XLE")

car.nextStep()

car.selectEngine(engine: "1.8L 4-Cyl. Gas/Electric Hybrid")

car.nextStep()

car.selectExteriorColor(color: "Supersonic Red")

car.nextStep()

car.selectInteriorColor(color: "Harvest Beige Softex Trim")

car.nextStep()

//car.selectPackage(name: "Advanced Technology Package")
car.selectPackage(name: "Premium Convenience Package")

car.nextStep()

car.selectAccessories(name: "Preferred Accessory Package w/ Carpet Mats")
car.selectAccessories(name: "Cargo Liner")

car.displaySummary()



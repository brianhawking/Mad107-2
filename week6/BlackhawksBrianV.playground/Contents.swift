import Foundation

// create dictionary for names
var teamNames = [Int: (name:String, position: String, sh:String, height: Int, weight: Int, born: String, birthplace: String)]()

var numbers: [Int] = [22, 77, 12, 58, 38, 36, 13, 52, 64, 88, 8, 23, 92, 73, 65, 15, 34, 17, 24, 19, 71, 74, 27, 29, 46, 44, 48, 2, 51, 5, 7, 16, 60, 32, 30]


teamNames[22] = createRoster(number: 22)

//teamNames[22] = (name:"R", position:"C", sh:"R", height: 72, weight: 200, born: "Jan 18, 1991", birthplace:"Rockford")



if let player = teamNames[22] {
    print(player.name)
}



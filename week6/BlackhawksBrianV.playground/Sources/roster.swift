import Foundation

//var teamNames = [Int: (name:String, position: String, sh:String, height: Int, weight: Int, born: String, birthplace: String)]()

public func createRoster(number: Int) -> (name:String, position:String, sh:String, height:Int, weight:Int, born:String, birthplace:String) {
    
    switch number {
    case 22:
        return (name:"R", position:"C", sh:"R", height: 72, weight: 200, born: "Jan 18, 1991", birthplace:"Rockford")
    default:
        return (name:"", position:"", sh:"", height: 0, weight: 0, born: "", birthplace:"")
    }
    
}

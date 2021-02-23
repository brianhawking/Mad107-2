
public func sortByAge(player: Dictionary<Int, (name:String, position:String, sh:String, height:Int, weight:Int, born:String, birthplace:String)>) {
    
   //let allKeys = [Int](player.keys)
    let allValues = [(name:String, position:String, sh:String, height:Int, weight:Int, born:String, birthplace:String)](player.values)
    
    for p in allValues {
        print(p.born)
    }
}


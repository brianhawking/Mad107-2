import Cocoa
import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    
    
}

let vc = ViewController()
vc.view.backgroundColor = UIColor.green
vc.view.frame = CGRect(x:0,y:0,width:300,height:500)
PlaygroundPage.current.liveView = vc


/*
 Goals:
1. Add viewcontrollers
 */

//DiaryManager().userExists(profileName: "Connor")
DiaryManager().deleteProfile(profileName: "Connor")
//DiaryManager().createProfile(profileName: "Bill", age: 4)


var entry = DiaryEntry(
    mood: "Sad",
    text: "Dear Diary,\nI broke one of my toys today.  I am sad."
)

//print(entry)

// convert to JSON
DiaryManager().convertToJSON(entry: entry)


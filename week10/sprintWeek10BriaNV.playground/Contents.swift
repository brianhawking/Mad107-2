import Cocoa
import UIKit

class viewController: UIViewController {


/* Goals Week 11
1. Add viewcontrollers so I can make this interactive
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


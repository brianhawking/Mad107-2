import Cocoa

/*
 Goals:
1. convert entry to a json object
2. print it to screen
 */

DiaryManager().userExists(profileName: "Connor")

DiaryManager().getDirectoryPathToDiaries(profileName: "Connor")

var entry = DiaryEntry(
    mood: "Sad",
    text: "I broke one of my toys today.  I am sad."
)

//print(entry)

// convert to JSON
DiaryManager().convertToJSON(entry: entry)


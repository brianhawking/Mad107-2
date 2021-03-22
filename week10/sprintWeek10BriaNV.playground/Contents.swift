import Cocoa

/*
 Goals:
1. Check if profile exists
2. Create a profile
3. Delete a profile
4. convert entry to a json object
5. print it to screen
 */

DiaryManager().userExists(profileName: "Connor")
DiaryManager().deleteProfile(profileName: "Connor")
DiaryManager().createProfile(profileName: "Connor")


var entry = DiaryEntry(
    mood: "Sad",
    text: "I broke one of my toys today.  I am sad."
)

//print(entry)

// convert to JSON
DiaryManager().convertToJSON(entry: entry)


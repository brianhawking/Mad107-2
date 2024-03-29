    import Foundation
    import PlaygroundSupport
    

    // add codable so we can work with json objects
    public struct DiaryEntry: Codable {
        
        public var year: Int
        public var month: Int
        public var day: Int
        public var mood: String
        public var dateTime: String
        public var text: String
        
        /* codable has an init() from codable that I need to "override" thats why I explicitly made one
        */

        
        public init(mood: String, text: String) {

            // get current day and time
            let date = Date()
            let calendar = Calendar.current
            
            // get time
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            let time = formatter.string(from: date)
            
            // get date
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            
            self.year = year
            self.month = month
            self.day = day
            self.mood = mood
            self.dateTime = time
            self.text = text
        
            print("You successfully created a diary entry object.")
        }
        
    }

    public struct DiaryManager {
        
        public init() {}
        
        public func serialize(string: String)->String {
            // remove any time
        
            let cleanedString = string.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
            
            return cleanedString
        }
        
        // checks if the user exists.
        public func userExists(profileName: String) -> Bool {
            // check if a folder exists in Users
            
            let profileName = serialize(string: profileName)
            
            let path = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)[0]
                .appendingPathComponent("Users")
                .appendingPathComponent(profileName)
            
     
            
           // print("path to documents: \(path)")
            
            // check if there's a folder for user
            if FileManager.default.fileExists(atPath: path.path) {
                print("\(profileName) exists")
                return true
            }
            else {
                print("\(profileName) does not exist.")
                return false
            }
        }
        
        // if user does not exist, create a folder for user
        public func createProfile(profileName: String, age: Int) {
            
            let profileName = serialize(string: profileName)
            
            
            // this will be the path to user's folder
            let path = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)[0]
                .appendingPathComponent("Users")
                .appendingPathComponent(profileName)
            
            
           // print("path to documents: \(path)")
        
            // check if the user has a profole
            if userExists(profileName: profileName) {
                print("\(profileName) already exists.")
            }
            else {
                // create the user's folder
                do {
                    try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
                    print("Profile for \(profileName) has been created.")
                }
                catch {
                    print("error with creating file directory. \(error.localizedDescription)")
                }
            }
        }
        
        // if user exists, delete it
        public func deleteProfile(profileName: String) {
            
            let profileName = serialize(string: profileName)
            
            // check if user exists
            if userExists(profileName: profileName) {
                do {
                    let path = FileManager.default.urls(for: .documentDirectory, in:
                        .userDomainMask)[0]
                        .appendingPathComponent("Users")
                        .appendingPathComponent(profileName)
                    try FileManager.default.removeItem(at: path)
                    print("\(profileName) is deleted.")
                }
                catch {
                    print("error with deleting profile.\n \(error)")
                }
            }
        }
        
        public func displayEntries(profileName: String) {
            let path = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)[0]
                .appendingPathComponent("Users")
                .appendingPathComponent(profileName)
                .appendingPathComponent("Diary")
                .appendingPathComponent("2021")
                .appendingPathComponent("4")
                .appendingPathComponent("1")

            do {
                let contents = try FileManager.default.contentsOfDirectory(atPath: path.path)

                for file in contents {
                    print(file)
                }
            }
            catch {
                print("No entries were found.")
            }
               
        }
        
        // converts the diary entry to JSON object.
        public func addToDiary(profileName: String, entry: DiaryEntry) -> Bool {
            
            let encoder = JSONEncoder()
           
            // add this to print json object better
            encoder.outputFormatting = .prettyPrinted
            
            do {
                let jsonData = try encoder.encode(entry)
                
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                    
                    // print to new file
                    // check if the user has a profole
                    if !userExists(profileName: profileName) {
                        print("\(profileName) does not exist.")
                    }
                    else {
                        // add the entry
                        do {
                            let profileName = serialize(string: profileName)
                            
                            var path = FileManager.default.urls(for: .documentDirectory, in:
                                .userDomainMask)[0]
                                .appendingPathComponent("Users")
                                .appendingPathComponent(profileName)
                                .appendingPathComponent("Diary")
                                .appendingPathComponent(String(entry.year))
                                .appendingPathComponent(String(entry.month))
                                .appendingPathComponent(String(entry.day))
                                .appendingPathComponent(entry.dateTime)
                                
                            do {
                                try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
                               
                            }
                            catch {
                                print("error with creating file directory. \(error.localizedDescription)")
                                return false
                            }
                            
                            path = path.appendingPathComponent("diaryEntry.json")
                            try jsonData.write(to: path)
                            return true
                        }
                        catch {
                            print("error with saving the diary entry: \(error)")
                            return false
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
                return false
            }
            return false
        }
        
        public func listUsers() {
            let path = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)[0]
                .appendingPathComponent("Users")
            
            do {
                let contents = try FileManager.default.contentsOfDirectory(atPath: path.path)

                displayText(text: "Users for SantaDiary")
                for file in contents {
                    print(file)
                }
            }
            catch {
                displayText(text: "No profiles were found.")
            }
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
    }



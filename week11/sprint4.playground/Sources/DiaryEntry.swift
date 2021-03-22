import Foundation

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

public struct DirectoryURLComponents {
    var mainDirectory: String
    var profileName: String
}

public struct DiaryManager {
    
    public init() {}
    
    
    // checks if the user exists.
    public func userExists(profileName: String) -> Bool {
        // check if a folder exists in Users
        
        let path = FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask)[0]
            .appendingPathComponent("Users")
            .appendingPathComponent(profileName)
        
//        code to list all documents in current directory.
//        print(path)
//
//        do {
//            let contents =
//                try FileManager.default.contentsOfDirectory(at: path,
//                                                            includingPropertiesForKeys: nil,
//                                                            options: [.skipsHiddenFiles])
//            for file in contents {
//                print(file)
//            }
//        }
//        catch {
//            print("no files")
//        }
//
//        path = path.appendingPathComponent(profileName)
        
        // check if there's a folder for user
        if FileManager.default.fileExists(atPath: path.path) {
            print("User exists")
            return true
        }
        else {
            print("\(path.absoluteString) does not exist.")
            return false
        }
       
    }
    
    // if user does not exist, create a folder for user
    public func createProfile(profileName: String) {
        
        // this will be the pathway to user's folder
        let path = FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask)[0]
            .appendingPathComponent("Users")
            .appendingPathComponent(profileName)
        
        print(path)
        

        // check if the user has a profole
        if userExists(profileName: profileName) {
            print("Profile already exists.")
        }
        else {
            // create the user's folder
            do {
                try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
                print("created the profile")
            } catch {
                print("error with creating file directory. \(error.localizedDescription)")
            }
            
        }
    }
    
    // converts the diary entry to JSON object.
    public func convertToJSON(entry: DiaryEntry) {
        
        let encoder = JSONEncoder()
       
        // add this to print json object better
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(entry)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                // print to new file
                
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getDirectoryPathToDiaries(profileName: String) {
        
        // get path URL to documents folder
        var directoryPathToDiariesURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // append "Users" folder and profile folder
        directoryPathToDiariesURL = directoryPathToDiariesURL
            .appendingPathComponent("Users")
            .appendingPathComponent(profileName)
            .appendingPathComponent("Diaries")
        
        // check if the diaries folder is created
        if !FileManager.default.fileExists(atPath: directoryPathToDiariesURL.path) {
            do {
                try FileManager.default.createDirectory(at: directoryPathToDiariesURL, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                print("error with creating file directory. \(error.localizedDescription)")
            }
        }
        
        print(directoryPathToDiariesURL)
       
    }
    
    public func createDirectoryURL(directoryURLCompenents: DirectoryURLComponents) -> URL {
        
        // get base directory path url (~documents)
        var destinationURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // append user's name to directory path
        destinationURL = destinationURL
            .appendingPathComponent("users")
            .appendingPathComponent(directoryURLCompenents.profileName)
            .appendingPathComponent(directoryURLCompenents.mainDirectory)
    
        // create the directory
        do {
            try FileManager.default.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("error with creating file directory. \(error.localizedDescription)")
        }
        return destinationURL
    }
    
    
    
}

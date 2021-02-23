import Foundation

// movieDabase - contains all the movies you own, organized by type
var movieDatabase: [String: [String]] = [
    "Action": [],
    "Animated": [],
    "Fantasy": [],
    "Disney": [],
    "Marvel": [],
    "80s": []
    ]

//print(movieDatabase)

// look through shelf, write down movie, and categorize it.
var moviesOnShelf: [(name: String, category:[String])] = []


moviesOnShelf.append((name: "Up", category: ["Animated", "<120"]))
moviesOnShelf.append((name: "How to Train Your Dragon", category: ["Animated", "Good Soundtrack", "Action"]))
moviesOnShelf.append((name: "Jumanji 2", category: ["Action", "Disney"]))
moviesOnShelf.append((name: "Ready Player One", category: ["Action", "Disney"]))


//print(moviesOnShelf)


// add them to database
for movie in moviesOnShelf {
    
    for category in movie.category {
       
        if var arrayOfMovies = movieDatabase[category] {
            
            arrayOfMovies.append(movie.name)
            movieDatabase.updateValue(arrayOfMovies, forKey: category)
        }
        else {
            // enter first movie of that category
            movieDatabase[category] = [movie.name]
        }
        
    }
}

//print(movieDatabase)

var moviesInBasement: [(name: String, category: [String])] = []

moviesInBasement.append((name: "Avengers", category: ["Disney", "Action", "Good Soundtrack", "Marvel"]))

for movie in moviesInBasement {
    
    for category in movie.category {
       
        if var arrayOfMovies = movieDatabase[category] {
            
            arrayOfMovies.append(movie.name)
            movieDatabase.updateValue(arrayOfMovies, forKey: category)
        }
        else {
            // enter first movie of that category
            movieDatabase[category] = [movie.name]
        }
        
    }
}

print(movieDatabase)
for (key, value) in movieDatabase {
    for movie in value {
        print(key," - ", movie)
    }
}



// ======== IMPLEMENT SEARCH FEATURES ==========================

// implement search feature
func searchBy(category: String) {
    print("======= SEARCH RESULTS FOR \(category) ================")
    if let arrayOfMovies = movieDatabase[category], arrayOfMovies.count != 0 {
       
        for movie in arrayOfMovies {
            print(movie)
        }
        
    }
    else {
        print("Sorry. We cannot find any movies for \(category) in our database.")
    }
}

//searchBy(category: "Marvel")


func searchByIntersection(categories: [String]) {
    
    var possibleMovies: [String] = []
    var initialCheck = true
    var cat: String = "===== RESULTS FOR "
    
    
    for category in categories {
      
        cat += "\(category), "
        
        if initialCheck {
            //print(movieDatabase[category]!)
            possibleMovies = movieDatabase[category]!
            initialCheck = false
        }
        else {
            let commonElements = possibleMovies.filter(movieDatabase[category]!.contains)
            possibleMovies = commonElements
        }
        
        
    }
    print(cat,"==============")
    if possibleMovies.count != 0 {
        for movie in possibleMovies {
            print(movie)
        }
    }
    else {
        print("No movie found.")
    }
    
}

//searchByIntersection(categories: ["Disney", "Action", "Marvel"])




func searchByUnion(categories: [String]) {
    var possibleMovies: [String] = []
    
    for category in categories {
        for movie in movieDatabase[category]! {
            possibleMovies.append(movie)
        }
    }
    
    print(possibleMovies)
}

func getCategoriesFromDatabase() {
    // print possible categories
    for category in movieDatabase.keys {
        print(category)
    }
}

moviesOnShelf.append((name: "Stand by Me", category: ["Coming of Age"]))
for movie in moviesOnShelf {
    print(movie.name)
}




getCategoriesFromDatabase()
//searchBy(category: "Animated")
//searchByIntersection(categories: ["Action"])
//searchByUnion(categories: ["Action", "<120"])



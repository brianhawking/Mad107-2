import Foundation

// you have an app on your phone called MovieDatabase
// it keeps track of all your movies and types
// you can add movies to the database
// you can search the database for movies by type

// movieDatabase - contains all the movies you own, organized by type
var movieDatabase: [String: [String]] = [
    "Action": [],
    "Animated": [],
    "Fantasy": [],
    "Disney": [],
    "Marvel": [],
    "1980s": []
    ]

//print(movieDatabase)

// find movies, write it down, and categorize it.
var moviesOnShelf: [(name: String, categories:[String])] = []
var moviesInBasement: [(name: String, categories: [String])] = []
var moviesInStorage: [(name: String, categories: [String])] = []


moviesOnShelf.append((name: "Up", categories: ["Animated", "<120", "Kid Friendly"]))
moviesOnShelf.append((name: "How to Train Your Dragon", categories: ["Animated", "Good Soundtrack", "Action", "Kid Friendly"]))
moviesOnShelf.append((name: "Jumanji 2", categories: ["Action", "Sony Pictures"]))
moviesOnShelf.append((name: "Ready Player One", categories: ["Action", "Warner Bros. Pictures", "Fantasy"]))
moviesOnShelf.append((name: "Cars", categories: ["Animated", "<120", "Good Soundtrack", "Kid Friendly"]))
moviesOnShelf.append((name: "Harry Potter and the Sorcerer's Stone", categories: ["Kid Friendly", "Fantasy", ">120"]))

//print(moviesOnShelf)

for movie in moviesOnShelf {
    //print(movie.name)
}


// add movies to database
for movie in moviesOnShelf {
    
    // access a category from the movie
    for category in movie.categories {
       
        // get all moves in th database for that category
        if var arrayOfMovies = movieDatabase[category] {
            
            arrayOfMovies.append(movie.name)
            movieDatabase.updateValue(arrayOfMovies, forKey: category)
            
        }
        else {
            // enter first movie of that category if the category doesn't exist
            movieDatabase[category] = [movie.name]
        }
        
    }
}

//print(movieDatabase)

// enter movies from basement
moviesInBasement.append((name: "Avengers", categories: ["Disney", "Action", "Good Soundtrack", "Marvel"]))
moviesInBasement.append((name: "The Breakfast Club", categories: ["Coming of Age", "1980s"]))
moviesInBasement.append((name: "Willow", categories: ["Fantasy", "Action", "1980s"]))

for movie in moviesInBasement {
    
    for category in movie.categories {
       
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



//for (key, value) in movieDatabase {
//    for movie in value {
//        print(key," - ", movie)
//    }
//}

//======== GET CURRENT DATABASE TYPES =======================
//for category in movieDatabase.keys {
//    print(category)
//}


// ======== IMPLEMENT SEARCH FEATURE ==========================

var category = "Fantasy"

print("======= SEARCH RESULTS FOR \(category) ================")
    
if let arrayOfMovies = movieDatabase[category], arrayOfMovies.count != 0 {
       
    for movie in arrayOfMovies {
        print(movie)
    }
        
}
else {
    print("Sorry. We cannot find any movies for \(category) in our database.")
}

// ======== List all movies in each category
for (key, value) in movieDatabase {
    print("================ \(key) ===================")
    for movie in value {
        print(movie)
    }
}







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

// find movies, write it down, and categorize it.
var moviesOnShelf: [(name: String, categories:[String])] = []


func addMoviesToDatabase(movies: [(name: String, categories:[String])]) {
    for movie in movies {
        for category in movie.categories {
            // get all movies in database with that category
            if var arrayOfMovies = movieDatabase[category] {
                arrayOfMovies.append(movie.name)
                movieDatabase.updateValue(arrayOfMovies, forKey: category)
            }
            else {
                movieDatabase[category] = [movie.name]
            }
        }
    }
}

func filter(database: [String: [String]], by: (String)->Void) {
    print("HI FROM FILTER")
}

func showAllMovies() {
    for (key, value) in movieDatabase {
        for movie in value {
            print(key," - ", movie)
        }
    }
}

let filteredMovies = filter(database: movieDatabase


moviesOnShelf.append((name: "Up", categories: ["Animated", "<120", "Kid Friendly"]))
moviesOnShelf.append((name: "How to Train Your Dragon", categories: ["Animated", "Good Soundtrack", "Action", "Kid Friendly"]))
moviesOnShelf.append((name: "Jumanji 2", categories: ["Action", "Sony Pictures"]))
moviesOnShelf.append((name: "Ready Player One", categories: ["Action", "Warner Bros. Pictures", "Fantasy"]))
moviesOnShelf.append((name: "Cars", categories: ["Animated", "<120", "Good Soundtrack", "Kid Friendly"]))
moviesOnShelf.append((name: "Harry Potter and the Sorcerer's Stone", categories: ["Kid Friendly", "Fantasy", ">120"]))
moviesOnShelf.append((name: "Avengers", categories: ["Disney", "Action", "Good Soundtrack", "Marvel"]))
moviesOnShelf.append((name: "The Breakfast Club", categories: ["Coming of Age", "1980s"]))
moviesOnShelf.append((name: "Willow", categories: ["Fantasy", "Action", "1980s"]))


addMoviesToDatabase(movies: moviesOnShelf)
showAllMovies()

// ======= FILTER ========================

// filter by union, intersection, all, alphabetical
filter(movies: movieDatabase, by: )


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







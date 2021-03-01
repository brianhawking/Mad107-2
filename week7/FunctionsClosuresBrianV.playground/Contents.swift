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

func search(database: [String: [String]], with categories: [String], filterBy: ([String], String)->([String]))->[String] {
    
    var filter = "\n====== FILTERED BY "
    
    var possibleMovies: [String] = []
    
    if categories.count == 0 {
        print("ERROR: NO CATEGORIES CHOSEN")
    }
    else {
        possibleMovies = database[categories[0]]!
    }
    
    for category in categories {
        filter += category + ", "
        possibleMovies = filterBy(possibleMovies, category)
    }
    
    print(filter,"===============")

    for movie in possibleMovies {
        print(movie)
    }
    
    return possibleMovies
}



let filterByNone = search(database: movieDatabase, with: Array(movieDatabase.keys)) {
    (movies, category) in
    return Array(Set(movies + movieDatabase[category]!))
}

let filteredByIntersection = search(database: movieDatabase, with: ["Fantasy", "Action"]) {
    (movies, category) in
    return movies.filter(movieDatabase[category]!.contains)
}

let filteredByUnion = search(database: movieDatabase, with: ["Fantasy", "Action"]) { (movies, category) in
    return Array(Set(movies + movieDatabase[category]!))
}

let filterByUnionAscending = search(database: movieDatabase, with: ["Fantasy"]) { (movies, category) in
    return Array(Set(movies + movieDatabase[category]!)).sorted(by: <)
}













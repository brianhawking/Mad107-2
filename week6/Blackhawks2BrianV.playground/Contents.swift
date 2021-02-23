import Foundation

// create dictionary for roster
var roster = [
            Int: (
                name: String,
                position: String,
                sh: String,
                height: Int,
                weight: Int,
                born: String,
                birthplace: String
            )]()

// array of tuples sorted by age
var rosterByAge:[(key: Int, value: (
                    name: String,
                    position: String,
                    sh: String,
                    height: Int,
                    weight: Int,
                    born: String,
                    birthplace: String))] = []


// array of tuples sorted by country
var rosterByCountry:[(key: Int, value: (name: String,
                  position: String,
                  sh: String,
                  height: Int,
                  weight: Int,
                  born: String,
                  birthplace: String))] = []


var averageHeight: Double = 0
var totalHeight: Int = 0

var age: Int = 0
var averageAge: Double = 0
var totalAge: Int = 0

var monthTally:[Int:(name: String, tally: Int)] = [
    1:("Jan", 0),
    2:("Feb", 0),
    3:("Mar", 0),
    4:("Apr", 0),
    5:("May", 0),
    6:("Jun", 0),
    7:("Jul", 0),
    8:("Aug", 0),
    9:("Sep", 0),
    10:("Oct", 0),
    11:("Nov", 0),
    12:("Dec", 0)
]


// current month and year
let currentDate = (
    year: Calendar.current.component(.year, from: Date()),
    month: Calendar.current.component(.month, from: Date())
    )


// DIRECTIONS -------------------------------------

// add players to roster
roster[22] = (name:"Ryan Carpenter", position:"C", sh:"R", height: 72, weight: 200, born: "01/18/1991", birthplace:"Oviedo, FL, USA")
roster[77] = (name:"Kirby Dach", position:"C", sh:"R", height: 76, weight: 194, born: "01/21/2001", birthplace:"Fort Saskatchewan, AB, CAN")
roster[12] = (name: "Alex DeBrincat", position: "LW", sh:"R", height:67, weight: 165, born: "12/18/1997", birthplace: "Farmington Hills, MI, USA")
roster[58] = (name: "MacKenzie Entwistle", position: "RW", sh:"R", height:75, weight: 184, born: "07/14/1999", birthplace: "Georgetown, ON, CAN")
roster[38] = (name: "Brandon Hagel", position: "LW", sh:"L", height:71, weight: 174, born: "08/27/1998", birthplace: "Saskatoon, SK, CAN")
roster[36] = (name: "Matthew Highmore", position: "C", sh:"L", height:71, weight: 188, born: "02/27/1996", birthplace: "Halifax, NS, CAN")
roster[13] = (name: "Mattias Janmark", position: "C", sh:"L", height:73, weight: 195, born: "12/08/1992", birthplace: "Danderyd, SWE")
roster[52] = (name: "Reese Johnson", position: "C", sh: "R", height:73, weight: 193, born: "07/10/1998", birthplace: "Regina, SK, CAN")
roster[64] = (name: "David Kampf", position: "C", sh: "L", height: 74, weight: 188, born: "01/12/1995", birthplace: "Chomutov, CZE")
roster[88] = (name: "Patrick Kane", position: "RW", sh:"L", height: 70, weight: 177, born: "11/19/1988", birthplace: "Buffalo, NY, USA")
roster[8] = (name: "Dominik Kubalik", position: "LW", sh: "L", height: 74, weight: 179, born: "08/21/1995", birthplace: "Plzen, CZE")
roster[23] = (name: "Phillipp Kurashev", position: "C", sh: "L", height: 72, weight: 190, born: "10/12/1999", birthplace: "Munsingen, CHE")
roster[92] = (name: "Alex Nylander", position: "LW", sh: "R", height: 73, weight: 192, born:"03/02/1998", birthplace: "Calgary, AB, CAN")
roster[73] = (name: "Brandon Pirri", position: "C", sh: "L", height: 73, weight: 180, born: "04/10/1991", birthplace: "Toronto, ON, CAN")
roster[65] = (name: "Andrew Shaw", position: "RW", sh: "R", height: 71, weight: 182, born: "07/20/1991", birthplace: "Belleville, ON, CAN")
roster[15] = (name: "Zack Smith", position: "C", sh: "L", height: 74, weight: 208, born: "04/05/1988", birthplace: "Maple Creek, SK, CAN")
roster[34] = (name: "Carl Soderberg", position: "C", sh: "L", height: 75, weight: 210, born: "10/12/1985", birthplace: "Malmo, SWE")
roster[17] = (name: "Dylan Strome", position: "C", sh: "L", height: 75, weight: 200, born: "03/07/1997", birthplace: "Mississauga, ON, CAN")
roster[24] = (name: "Pius Suter", position: "C", sh: "L", height: 71, weight: 176, born: "05/24/1996", birthplace: "Zurich, CHE")
roster[19] = (name: "Jonathan Toews", position: "C", sh: "L", height: 74, weight: 201, born: "04/29/1988", birthplace: "Winnipeg, MB, CAN")
roster[71] = (name: "Lucas Wallmark", position: "C", sh: "L", height: 72, weight: 178, born: "09/05/1995", birthplace: "Umea, SWE")
roster[74] = (name: "Nicolas Beaudin", position: "D", sh: "L", height: 71, weight: 168, born: "10/07/1999", birthplace: "Chateauguay, QC, CAN")
roster[27] = (name: "Adam Boqvist", position: "D", sh: "R", height: 71, weight: 179, born: "08/15/2000", birthplace: "Falun, SWE")
roster[29] = (name: "Madison Bowey", position: "D", sh: "R", height: 74, weight: 202, born: "04/22/1995", birthplace: "Winnipeg, MB, CAN")
roster[46] = (name: "Lucas Carlsson", position: "D", sh: "L", height: 72, weight: 189, born: "07/05/1997", birthplace: "Gavle, SWE")
roster[44] = (name: "Calvin de Haan", position: "D", sh: "L", height: 73, weight: 195, born: "05/09/1991", birthplace: "Carp, ON, CAN")
roster[48] = (name: "Wyatt Kalynuk", position: "D", sh: "L", height: 73, weight: 180, born: "04/14/1997", birthplace: "Brandon, MB, CAN")
roster[2] = (name: "Duncan Keight", position: "D", sh: "L", height: 73, weight: 192, born: "07/16/1983", birthplace: "Winnipeg, MB, CAN")
roster[51] = (name: "Ian Mitchell", position: "D", sh: "R", height: 71, weight: 173, born: "01/18/1999", birthplace: "St. Albert, AB, CAN")
roster[5] = (name: "Connor Murphy", position: "D", sh: "R", height: 76, weight: 212, born: "03/26/1993", birthplace: "Dublin, OH, USA")
roster[7] = (name: "Brent Seabrook", position: "D", sh: "R", height: 75, weight: 220, born: "04/20/1985", birthplace: "Richmon, BC, CAN")
roster[16] = (name: "Nikita Zadorov", position: "D", sh: "L", height: 78, weight: 235, born: "04/16/1995", birthplace: "Moscow, RUS")
roster[60] = (name: "Collin Delia", position: "G", sh: "", height: 74, weight: 208, born: "06/20/1994", birthplace: "Rancho Cucamonga, CA, USA")
roster[32] = (name: "Kevin Lankinen", position: "G", sh: "", height: 74, weight: 185, born: "04/28/1995", birthplace: "Helsinki, FIN")
roster[30] = (name: "Malcolm Subban", position: "G", sh: "", height: 74, weight: 215, born: "12/21/1993", birthplace: "Toronto, ON, CAN")



// rewrite birthday to YYYY/MM/DD
for (key, value) in roster {
    let birthday = value.born.split(separator: "/")
    let newBirthday = "\(birthday[2])/\(birthday[0])/\(birthday[1])"
    roster.updateValue(
        (name: value.name,
         position: value.position,
         sh: value.sh,
         height: value.height,
         weight: value.weight,
         born: newBirthday,
         birthplace: value.birthplace), forKey: key)
    
    //print(newBirthday)
}


// sort by age - oldest to youngest
rosterByAge = roster.sorted(by: {$0.value.born < $1.value.born})



// iterate over roster to find total age and total weights
for player in rosterByAge {
   
    // find age of player and add it to totalAge
    let birthday = player.value.born.split(separator: "/")

    
    if let birthYear = Int(birthday[0]) {
        
        if let birthMonth = Int(birthday[1]) {
            
            if birthMonth > currentDate.month {
                age = currentDate.year - birthYear - 1
                totalAge += age
            }
            else {
                age = currentDate.year - birthYear
                totalAge += age
            }
            
            if var (month, tally) = monthTally[birthMonth] {
                tally += 1
                monthTally.updateValue( (name: month, tally: tally), forKey: birthMonth)
            }
           
        }
    }
    
    totalHeight += player.value.height

    print(player.value.name, age)
}

print("---------------------------------------------")
rosterByCountry = roster.sorted(by: {$0.value.birthplace.suffix(3) < $1.value.birthplace.suffix(3)})
for player in rosterByCountry {
    print(player.value.name,"-", player.value.birthplace.suffix(3))
}


// calculate averageWeight, averageAge
// print to console
if roster.count != 0 {
    averageHeight = Double(totalHeight)/Double(roster.count)
    averageAge = Double(totalAge)/Double(roster.count)
    
    print("---------------------------------------------")
    print("The average height is \(averageHeight)")
    print("The average age is \(averageAge)")
}

// find most common birthday month
var mostMonth: String = ""
var highestCount: Int = 0
for month in monthTally {
    if (month.value.tally > highestCount){
        highestCount = month.value.tally
        mostMonth = month.value.name
    }
}

print("---------------------------------------------")
print("The month in which most of the players birthday falls is \(mostMonth) with \(highestCount) players.")





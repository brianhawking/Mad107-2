import Foundation // needed for timer class

/*
Desciption: create a clock app.  It will display the hour, minute, and second.
 Instead of getting the current time when initializing the variable clock I just gave it
  a time of 3:08 55.  I did this so you can see all four printing cases
 
 -- brian veitch
*/

// variables and constants --------------------------

// clock variable.  I'll star the clock at 3:08 55
var clock = (hour: 3, minute: 08, second: 55)

// constant.  When the clock variables reach these values they need to be reset to 0
// for minutes, seconsd and 1 for hour
let Max = (hour: 13, minute: 60, second: 60)

// apple timer. Triggers every 1 second and repeats forever
Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    
    // increment by one second
    clock.second += 1
    
    // check if second variable reaches 60 seconds. If so, reset to 0
    if (clock.second == Max.second) {
        
        clock.second = 0
        
        // another minute has passed so increment minute by 1
        clock.minute += 1
        
        // if minute has reached 60, reset to 0 and increment hour by 1
        if (clock.minute == Max.minute){
            clock.minute = 0
            clock.hour += 1
            
            // if hour reaches "13" it should be reset to 1
            if (clock.hour == Max.hour){
                clock.hour = 1
            }
        }
    }
    
    
    // displays the current time based on 4 cases
    switch (clock.minute, clock.second) {
        
        // need to add 0 in front of minute and second when printing
        case (0...9, 0...9):
            print("\(clock.hour):0\(clock.minute) 0\(clock.second)")
            
        // need to add 0 in front of minute when printing
        case (0...9, 10...59):
            print("\(clock.hour):0\(clock.minute) \(clock.second)")
            
        // need to add 0 in front of second when printing
        case (10...59, 0...9):
            print("\(clock.hour):\(clock.minute) 0\(clock.second)")
            
        // no adjustment is needed when printing
        default:
            print("\(clock.hour):\(clock.minute) \(clock.second)")
    }
        
}

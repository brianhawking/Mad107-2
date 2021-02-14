import Foundation

var clock = (hour: 3, minute: 08, second: 55)
let Max = (hour: 13, minute: 60, second: 60)

Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    
    clock.second += 1
    
    if (clock.second % Max.second == 0) {
        
        clock.second = 0
        clock.minute += 1
        
        if (clock.minute % Max.minute == 0){
            clock.minute = 0
            clock.hour += 1
            
            if (clock.hour % Max.hour == 0){
                clock.hour = 1
            }
        }
    }
    
    switch (clock.minute, clock.second) {
    case (0...9, 0...9):
        print("\(clock.hour):0\(clock.minute) 0\(clock.second)")
    case (0...9, 10...59):
        print("\(clock.hour):0\(clock.minute) \(clock.second)")
    case (10...59, 0...9):
        print("\(clock.hour):\(clock.minute) 0\(clock.second)")
    default:
        print("\(clock.hour):\(clock.minute) \(clock.second)")
    }
        
}

import Foundation

var fibonacciNumbers:[Int] = []
var maxNumber: Int = 1000

func calculateFibonacciNumbers(max: Int) -> [Int] {
    
    var fibonacci: [Int] = [1,1]
    var index: Int = 2
    
    while fibonacci[index-2] + fibonacci[index-1] < max {
        fibonacci.append(fibonacci[index-2] + fibonacci[index-1])
        index += 1
    }
    
    return fibonacci
}

fibonacciNumbers = calculateFibonacciNumbers(max: maxNumber)

print(fibonacciNumbers)

for i in 2..<fibonacciNumbers.count {
    print(Double(fibonacciNumbers[i-1])/Double(fibonacciNumbers[i-2]))
}





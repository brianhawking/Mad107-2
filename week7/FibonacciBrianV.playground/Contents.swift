import Foundation

var fibonacciNumbers:[Int] = []

//func calculateFibonacciNumbers(max: Int) -> [Int] {
//
//    var fibonacci: [Int] = [1,1]
//    var index: Int = 2
//
//    while fibonacci[index-2] + fibonacci[index-1] < max {
//        fibonacci.append(fibonacci[index-2] + fibonacci[index-1])
//        index += 1
//    }
//
//    return fibonacci
//}


func calculateFibonacciNumbers(max: Int) -> [Int] {

    var fibonacci: [Int] = [1,1]
    var index: Int = 2

    while max x fibonacci[index-1] > fibonacci[index-2] {
        fibonacci.append(fibonacci[index-2] + fibonacci[index-1])
        index += 1
    }

    return fibonacci
}


func printSequence(array: [Int]) {
    for (key, value) in array.enumerated() {
        print(key+1, "-", value)
    }
}


fibonacciNumbers = calculateFibonacciNumbers(max: Int.max)
printSequence(array: fibonacciNumbers)







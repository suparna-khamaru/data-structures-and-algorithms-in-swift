import Foundation

var numbers = [12,66,34,99,9,2,1,5,6]

for i in 0..<numbers.count {

    let key = numbers[i]
    var prev = i - 1
    
    while prev >= 0 && numbers[prev] > key {
    
        numbers[prev + 1] = numbers[prev]
        prev = prev - 1
    }
    numbers[prev + 1] = key
}

print(numbers)                  //  [1, 2, 5, 6, 9, 12, 34, 66, 99]

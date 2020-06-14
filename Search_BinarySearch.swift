import UIKit

/// The below function returns multiple result: 'found' Result & 'indexValue' of Result 
/// when searched in an array using Binary Search 

func BinarySearch(valueToSearch: Int) -> (Bool, Int?) {
    
    let numbers = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

    var left = 0
    var right = numbers.count - 1
    var middle = 0
    
    var isFound = false
    var foundAtIndex: Int?

    while left <= right {
        middle = (left + right) / 2
        
        if numbers[middle] == valueToSearch {
            isFound = true
            foundAtIndex = middle
            break
        }
        else if numbers[middle] < valueToSearch {
            left = middle + 1
        }
        else {
            right = middle - 1
        }
    }
    return (isFound, foundAtIndex)
}

print(BinarySearch(valueToSearch: 31))   // (true, Optional(7))
print(BinarySearch(valueToSearch: 99))   // (false, nil)
print(BinarySearch(valueToSearch: 13))   // (false, nil)
print(BinarySearch(valueToSearch: 17))   // (true, Optional(3))

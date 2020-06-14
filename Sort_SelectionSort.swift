import Foundation

func SelectionSort() -> [Int] {
    
    var numbers = [7,6,2,19,11,45,99,23,56,78,9]
    print("Before sorting: \(numbers)")
    
    var minIndex = 0
    
    for i in 0..<numbers.count {
        
        minIndex = i
        
        for j in (i+1)..<numbers.count {
            
            if numbers[j] < numbers[minIndex] {
                minIndex = j
            }
            
            numbers.swapAt(i, minIndex)
        }
    }
    return numbers
}

print("After sorting:  \(SelectionSort())")

/* 
Output printed:

    Before sorting: [7, 6, 2, 19, 11, 45, 99, 23, 56, 78, 9]
    After sorting:  [2, 6, 7, 9, 11, 19, 23, 45, 78, 56, 99]

*/

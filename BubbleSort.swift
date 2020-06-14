import UIKit

func BubbleSort() -> [Int] {
    
    var numbers = [6, 2, 19, 7, 11, 45, 99, 23, 56, 78, 9]
    print("Before Sorting: \(numbers)")

    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if numbers[i] < numbers[j] {
                numbers.swapAt(i, j)
            }
        }
    }
    return numbers
}
    
print("After Sorting:  \(BubbleSort())")

/*

Output printed:

    Before Sorting: [6, 2, 19, 7, 11, 45, 99, 23, 56, 78, 9]
    After Sorting:  [2, 6, 7, 9, 11, 19, 23, 45, 56, 78, 99]
    
*/

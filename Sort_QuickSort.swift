
import XCTest

class QuickSort: XCTestCase {

    func quickSort(_ input: [Int]) -> [Int] {
        
        guard input.count > 1 else {
            return input
        }
        
        let pivotIndex = input.count / 2
        print("pivot index: \(pivotIndex)")
        
        let pivot = input[pivotIndex]
        
        let less = input.filter {$0 < pivot }
        let greater = input.filter {$0 > pivot }
        let equal = input.filter {$0 == pivot }
        
        return quickSort(less) + equal + quickSort(greater)
    }

    func testQuickSort() {
        print(quickSort([0,9,6,2,3,2,1,3]))     // [0, 1, 2, 2, 3, 3, 6, 9]
        print(quickSort([0,9,6,2,5,8,1,3]))     // [0, 1, 2, 3, 5, 6, 8, 9]
    }
}

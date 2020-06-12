import UIKit

func factorial(number: Int) -> Int {
    
    if number == 0 {                                //base case
        return 1
    }
    
    return number * factorial(number: number - 1)   //recursive case
}

print(factorial(number: 6))                         // 720
print(factorial(number: 5))                         // 120

import UIKit

func power(number: Int, n: Int) -> Int {
    
    if n == 0 {  //base case
        return 1
    }
    else {
        return number * power(number: number, n: n - 1)
    }
}

print(power(number: 3, n: 2))         // 9
print(power(number: 2, n: 3))         // 8

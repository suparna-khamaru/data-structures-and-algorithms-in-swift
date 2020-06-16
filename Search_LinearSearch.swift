import Foundation

func linearSearch(searchItem: Int) -> String {
    let numbers = [10, 8, 9, 7, 1, 3, 2]

    for item in 0..<numbers.count {
        if numbers[item] == searchItem {
            return "Search Item: \(searchItem) is found at index: \(item)"
        }
    }
    return "Search Item: \(searchItem) is not found"
}

print(linearSearch(searchItem: 1))        // Search Item: 1 is found at index: 4
print(linearSearch(searchItem: 7))        // Search Item: 7 is found at index: 3
print(linearSearch(searchItem: 1000))     // Search Item: 1000 is not found

import UIKit

struct Stack<Element> {
    private var storage: [Element] = []
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    init() {}
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: ", ")
        return  stackElements
    }
}


var stack = Stack<Int>()

stack.push(20)               // 20 
stack.push(10)               // 10, 20
stack.push(3)                // 3, 10, 20
stack.push(99)               // 99, 3, 10, 20
print(stack)        //99, 3, 10, 20

stack.pop()                  // 99
print(stack)        //3, 10, 20

import UIKit

struct Queue<T> {
    
    var array: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

var queue = Queue<Int>()

queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.enqueue(40)
print(queue)               //[10, 20, 30, 40]

queue.dequeue()
print(queue)               //[20, 30, 40]

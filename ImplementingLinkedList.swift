import UIKit

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value

    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    init() { }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

var list = LinkedList<Int>()
list.push(2)
list.push(22)
print(list)                             //22 -> 2 

list.append(10)
list.append(5)
print(list)                             //22 -> 2 -> 10 -> 5 

let middleNode = list.node(at: 1)!
list.insert(999, after: middleNode)
print(list)                             //22 -> 2 -> 999 -> 10 -> 5 

let newNode = list.node(at: 3)!
list.insert(99, after: newNode)
print(list)                             //22 -> 2 -> 999 -> 10 -> 99 -> 5 

list.pop()
print(list)                             //2 -> 999 -> 10 -> 99 -> 5 

list.removeLast()
print(list)                             //2 -> 999 -> 10 -> 99 

let node = list.node(at: 0)!
let removedValue = list.remove(after: node)
print(list)                             //2 -> 10 -> 99  

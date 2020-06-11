import UIKit

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

let node1 = Node(value: 1)   //1
let node2 = Node(value: 2)   //2
let node3 = Node(value: 3)   //3

node1.next = node2           //1 -> 2 
node2.next = node3           //2 -> 3 

print(node1)                 // 1 -> 2 -> 3  

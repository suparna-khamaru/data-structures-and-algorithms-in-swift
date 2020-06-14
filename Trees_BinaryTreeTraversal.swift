import UIKit

class BinaryNode<Element> {
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    func inOrderTraversal(visit: (Element) -> Void) {         // leftChild -> Node -> RightChild
        leftChild?.inOrderTraversal(visit: visit)
        visit(value)
        rightChild?.inOrderTraversal(visit: visit)
    }
    
    func postOrderTraversal(visit: (Element) -> Void) {       // leftChild -> RightChild -> Node
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(value)
    }
    
    func preOrderTraversal(visit: (Element) -> Void) {        // Node -> leftChild -> rightChild
        visit(value)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
}

/*              10
             /      \
            9         2
         /   \      /   \
         1    3    4     6
*/

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two

nine.leftChild = one
nine.rightChild = three

two.leftChild = four
two.rightChild = six

print("\nIn Order Traversal")
ten.inOrderTraversal {
    print($0)             //1 9 3 10 4 2 6
}

print("\nPost Order Traversal")
ten.postOrderTraversal {
    print($0)             // 1 3 9 4 6 2 10
}

print("\nPre Order Traversal")
ten.preOrderTraversal {
    print($0)             //10 9 1 3 2 4 6
}

/*
Outputs printed:

    In Order Traversal
    1
    9
    3
    10
    4
    2
    6

    Post Order Traversal
    1
    3
    9
    4
    6
    2
    10

    Pre Order Traversal
    10
    9
    1
    3
    2
    4
    6
*/

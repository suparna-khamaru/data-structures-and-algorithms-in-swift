import UIKit

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

extension TreeNode {
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
}

let beverages = TreeNode<String>("Beverages")
let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")
beverages.add(hot)
beverages.add(cold)

let tea = TreeNode<String>("Tea")
let coffee = TreeNode<String>("Coffee")
hot.add(tea)
hot.add(coffee)

let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")
cold.add(soda)
cold.add(milk)

beverages.forEachDepthFirst {
    print($0.value)   //depth first traversal
}

/*
Output Printed:
    Beverages
    Hot
    Tea
    Coffee
    Cold
    Soda  
    Milk
*/

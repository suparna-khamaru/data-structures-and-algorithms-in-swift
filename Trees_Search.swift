import UIKit

struct Queue<Element> {
    
    var elements: [Element] = []

    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

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

extension TreeNode where T: Equatable {
    
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)             //call root node
        
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
        }
        
        while let node = queue.dequeue() {
            visit(node)         //call node
            
            node.children.forEach {
                queue.enqueue($0)
            }
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        
        var result: TreeNode?
        
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

/*
           Beverages
           /       \
        Hot         Cold
       /   \        /   \
    Tea   Coffee   Soda  Milk

*/

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

//Test 1:

  if let searchResult = beverages.search("Soda") {
      print(searchResult.value)                         // Soda
  }

//Test 2:

  if let searchResult = beverages.search("Custard") {
      print(searchResult.value)                         //
  }
  else {
      print("Custard not found")                        // Custard not found
  }

//Test 3:

  if let searchResult = beverages.search("Milk") {
      print(searchResult.value)                         // Milk
  }

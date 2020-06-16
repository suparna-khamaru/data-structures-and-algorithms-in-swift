import Foundation

enum EdgeType {
    
    case directed
    case undirected
}

struct Vertex<T> {
    
    let data: T
    let index: Int
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index): \(data)"
    }
}

struct Edge<T> {
    
    let source: Vertex<T>
    let destination: Vertex<T>
    
    let weight: Double?
}

protocol Graph {
    
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    
    func addDirectedEdge(from source: Vertex<Element>,
                         to destination: Vertex<Element>,
                         weight: Double?)
    
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    
    func add(_ edge: EdgeType,
             from source: Vertex<Element>,
             to destination: Vertex<Element>,
             weight: Double?)
    
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    // addUndirectedEdge
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?) {
        
        addDirectedEdge(from: source,
                        to: destination,
                        weight: weight)
        
        addDirectedEdge(from: destination,
                        to: source,
                        weight: weight)
    }
    
    // add
    func add(_ edge: EdgeType,
             from source: Vertex<Element>,
             to destination: Vertex<Element>,
             weight: Double?) {
        
        switch edge {
            
        case .directed:
            addDirectedEdge(from: source,
                            to: destination,
                            weight: weight)
            
        case .undirected:
            addUndirectedEdge(between: source,
                            and: destination,
                            weight: weight)
        }
    }
}

class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    init() { }
    
    func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(data: data,
                            index: adjacencies.count)
        
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>,
                         to destination: Vertex<T>,
                         weight: Double?) {
        
        let edge = Edge(source: source,
                        destination: destination,
                        weight: weight)
        
        adjacencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>,
                to destination: Vertex<T>) -> Double? {
        
        return edges(from: source).first { $0.destination == destination }?.weight
    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies { // 1
            var edgeString = ""
            for (index, edge) in edges.enumerated() { // 2
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3
        }
        return result
    }
}


let graph = AdjacencyList<String>()

let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")

graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)

graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)

graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)

graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)

graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)

graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)

print(graph)


/*
Output printed:

    7: Seattle ---> [ 4: San Francisco, 5: Washington DC ]
    5: Washington DC ---> [ 1: Tokyo, 6: Austin Texas, 4: San Francisco, 7: Seattle ]
    6: Austin Texas ---> [ 3: Detroit, 5: Washington DC, 4: San Francisco ]
    0: Singapore ---> [ 2: Hong Kong, 1: Tokyo ]
    2: Hong Kong ---> [ 0: Singapore, 1: Tokyo, 4: San Francisco ]
    1: Tokyo ---> [ 0: Singapore, 2: Hong Kong, 3: Detroit, 5: Washington DC ]
    3: Detroit ---> [ 1: Tokyo, 6: Austin Texas ]
    4: San Francisco ---> [ 2: Hong Kong, 6: Austin Texas, 5: Washington DC, 7: Seattle ]




*/

//
//  BreadthFirstSearchAlgo.swift
//  SwiftAlgorithms
//
//  Created by iOSDeveloperIndia on 07/03/18.
//  Copyright © 2018 AnshulSharma. All rights reserved.
//

import Foundation

public class Graph<T: Hashable> {
    var vertices: Int
    var adj: [T : [T]]
    
    init(v: Int) {
        self.vertices = v
        let zipped = zip([T](), Array(repeating: [T](), count: self.vertices))
        adj = Dictionary(uniqueKeysWithValues: zipped)
    }
    
    func addEdge(_ from: T, _ to: T) {
        if  self.adj[from] != nil {
            self.adj[from]?.append(to)
        }
        else {
            self.adj[from] = [T]()
            self.adj[from]?.append(to)
        }
    }
    
    func BFS(s: T) {
        let zippedPairs = zip(adj.keys, Array(repeating: false, count: self.vertices))
        var visited = Dictionary(uniqueKeysWithValues: zippedPairs)
        
        var queue = [T]()
        visited[s] = true
        queue.append(s)
        while !queue.isEmpty {
            let item = queue.first
            queue.remove(at:0)
            print(" \(item!) , ")
            for i in adj[item!]! {
                if !visited[i]! {
                    visited[i] = true
                    
                    queue.append(i)
                }
            }
        }
        
    }
}


func breadthFirstSearch() {
    let graph = Graph<Int>(v: 5)
    
    graph.addEdge(0, 1)
    graph.addEdge(0, 2)
    graph.addEdge(1, 2)
    graph.addEdge(2, 0)
    graph.addEdge(2, 3)
    graph.addEdge(3, 3)
    graph.addEdge(1, 4)
    graph.addEdge(4, 4)
    
    print("Following is Breadth First Traversal starting from vertex 2")
    
    graph.BFS(s:2)
}


///  Complex implementation
struct Vertex<T: Hashable> {
    public var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

public enum EdgeType {
    case directed
    case undirected
}
public struct Edge<T : Hashable> {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double
}

extension Edge: Hashable {
    public var hashValue: Int {
        return "\(source) \(destination) \(weight)".hashValue
    }
    
    public static func ==(lhs: Edge, rhs: Edge) ->  Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}

public enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

extension String {
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.indices {
            var j = i
            var found = true
            
            for p in pattern.indices {
                if j == self.indices.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                }
                else {
                    j = self.index(after: j)
                }
            }
            
            if found {
                return i
            }
        }
        return nil
    }
}



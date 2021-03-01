//
//  DepthFirstSearchAlgo.swift
//  SwiftAlgorithms
//
//  Created by Anshul Sharma on 08/03/18.
//  Copyright © 2018 AnshulSharma. All rights reserved.
//

import Foundation

class GraphDFS<T: Hashable> {
    
    var vertices: Int
    
    var adj:[T: [T]]
    
    init(v: Int) {
        self.vertices = v
        let zipped = zip([T](), Array(repeating: [T](), count: self.vertices))
       adj = Dictionary(uniqueKeysWithValues: zipped)
    }
    
    func addEdge(_ from: T, _ to: T) {
        if self.adj[from] != nil {
            self.adj[from]?.append(to)
        }
        else {
            self.adj[from] = [T]()
            self.adj[from]?.append(to)
        }
    }
    
    func DFS(s: T) {
        let zippedPair = zip(self.adj.keys, Array(repeating: false, count: self.vertices))
        var visited = Dictionary(uniqueKeysWithValues: zippedPair)
        
        self.DFSUtil(&visited, s)
        
    }
    
    func DFSUtil(_ visited: inout [T : Bool], _ vertice: T) {
        visited[vertice] = true
        
        print(" \(vertice)")
        if let veticeArray = self.adj[vertice] {
            for i in veticeArray {
                if let bool = visited[i], bool == false {
                    DFSUtil(&visited, i)
                }
            }
        }
    }
}

extension ViewController {
    
    func testDFS() {
        
        let g = GraphDFS<String>(v:6)
        
        g.addEdge("A", "B")
        g.addEdge("A", "C")
        g.addEdge("B", "D")
        g.addEdge("B", "E")
        g.addEdge("C", "E")
        g.addEdge("D", "E")
        g.addEdge("D", "F")
        g.addEdge("E", "F")
        g.addEdge("F", "F")
        g.DFS(s: "A")
        
    }
}

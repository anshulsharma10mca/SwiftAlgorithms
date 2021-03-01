//
//  LinkedList.swift
//  SwiftAlgorithms
//
//  Created by Anshul Sharma on 05/03/18.
//  Copyright © 2018 AnshulSharma. All rights reserved.
//

import Foundation

class Node {
    private var _value: Int
    var next: Node?
    
    init(_ newValue: Int) {
        self._value = newValue
    }
    
    func value() -> Int {
        return _value
    }
    
    
}

extension ViewController {
    func createLinkedList() -> Node? {
        let node = Node(8)
        node.next = Node(9)
        node.next?.next = Node(10)
        node.next?.next?.next = Node(11)
        node.next?.next?.next?.next = Node(12)
        return node
    }
    
    func testIteration() {
        let linkedList = createLinkedList()
        self.iterateLinkedList(linkedListNode: linkedList)
    }
    
    func testReversal() {
        print("reversed Linked List")
        let linkeList = createLinkedList()
        let reversedLinkedList = self.reverserd(linkeList)
        self.iterateLinkedList(linkedListNode: reversedLinkedList)
    }
    
    func testNodeRemoval() {
        
        let stocksIdentifiers = ["AAPL", "GOOGL", "NKE", "AMZ"]
        
        let stocksValues = [158.28, 940.13, 53.73]
        
        let pairs = zip(stocksIdentifiers, stocksValues)
        
        let stocksValuesDict = Dictionary(uniqueKeysWithValues: pairs)
        print(stocksValuesDict)
        let linkedList = createLinkedList()
        self.iterateLinkedList(linkedListNode: linkedList)
        print("remove result : \(self.removeNode(list: linkedList, value: 12))")
    }
    
    func iterateLinkedList(linkedListNode: Node?) {
        
        if let linkedList = linkedListNode {
            var node: Node? = linkedList
            while node != nil {
                if let nodeObj = node {
                    print("node : \(nodeObj.value())")
                }
                
                if let nodeNext = node?.next {
                    node = nodeNext
                }
                else {
                    node = nil
                }
                
            }
        }
    }
    
    func reverserd(_ list: Node?) -> Node? {
        guard let linkedList = list else { return nil }
        var rearNode: Node? = linkedList
        var reversedRearNode: Node? = rearNode?.next
        rearNode?.next = nil
        while reversedRearNode?.next != nil {
            let tempNode = reversedRearNode?.next
            reversedRearNode?.next = rearNode
            rearNode = reversedRearNode
            reversedRearNode = tempNode
        }
        
        reversedRearNode?.next = rearNode
        return reversedRearNode
    }
    
    func removeNode(list: Node?, value: Int) -> Int {
        guard let linkedList = list else { return -1 }
        var originalList: Node? = linkedList
        var earlierNode: Node?
        var nextNode: Node? = linkedList.next
        var currentNode: Node? = linkedList
        
        while currentNode?.value() != value && currentNode?.next != nil {
            earlierNode = currentNode
            currentNode = currentNode?.next
        }
        
        if currentNode?.value() == value {
            nextNode = currentNode?.next
            if earlierNode != nil {
                earlierNode?.next = nextNode
            }
            else {
                originalList = nextNode
            }
            let val = currentNode?.value()
            currentNode = nil
            print("Updated linked list")
            self.iterateLinkedList(linkedListNode: originalList)
            return val!
        }
        
        print("Without Updated linked list")
        self.iterateLinkedList(linkedListNode: originalList)
        return -1
    }
}

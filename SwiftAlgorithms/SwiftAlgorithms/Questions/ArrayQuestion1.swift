//
//  ArrayQuestion1.swift
//  SwiftAlgorithms
//
//  Created by Anshul Sharma on 07/03/18.
//  Copyright © 2018 AnshulSharma. All rights reserved.
//

import Foundation

extension ViewController {
    
    func findKthElement() {
        let array = [2, 4, 5, 7, 7, 6, 8]
        let item = 2
        let diff = 2
        
        print("item index : \(self.findElement(array, item, diff))")
        
    }
    
    func findElement(_ array: [Int], _ item: Int, _ diff: Int) -> Int {
        var i = 0
        
        while i < array.count {
            if array[i] == item {
                return i
            }
            
            i = i + max(1, abs(array[i] - item) / diff)
        }
        
        return Int.max
    }
}

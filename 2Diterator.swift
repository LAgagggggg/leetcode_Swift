//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class vectorsIterator<T> {

    private var vectors: [[T]]
    private var indexX = 0
    private var indexY = 0

    init(vectors: inout [[T]]) {
        self.vectors = vectors
    }

    func next() -> T {
        turnToNext()
        let result = vectors[indexX][indexY]
        indexY += 1
        return result

    }

    func hasNext() -> Bool {
        if indexX == vectors.count {//this is the end
            return false
        } else {
            turnToNext()
            return indexX < vectors.count
        }
    }

    private func turnToNext() {
        while indexX < vectors.count && indexY == vectors[indexX].count {//skip nonsense index
            indexY = 0
            indexX += 1
        }
    }

    func remove() {
        if indexY == 0 {
            return
        }
        indexY -= 1
        withUnsafeMutablePointer(to: &vectors) { (pointer) in
            pointer.pointee[indexX].remove(at: indexY)
        }
//        vectors[indexX].remove(at: indexY)
    }

    func rewind() {
        indexX = 0
        indexY = 0
    }
}

var theVector = Array<[Int]>()
theVector.append(contentsOf: [[1, 2, 3], [4, 5, 6], [7], [], [8, 9]])
//var theVector: [[Int]] = [[], [], [6], [], []]
var iterator = vectorsIterator<Int>(vectors: &theVector)
while iterator.hasNext() {
    let value = iterator.next()
    if value == 5 {
        iterator.remove()
    }
    print(value)
}

print(theVector)

iterator.rewind()
while iterator.hasNext() {
    print(iterator.next())
}

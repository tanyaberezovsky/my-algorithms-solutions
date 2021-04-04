//https://practice.geeksforgeeks.org/problems/rotten-oranges2536/1

import Foundation
enum QueueErrors: Error {
    case noSuchElementException
}
public struct Queue<T> {

    private class Node<T> {
        fileprivate var data: T
        fileprivate var next: Node<T>?
        init(val: T) {
            data = val
        }
    }

    private var first: Node<T>?
    private var last: Node<T>?
    
    public mutating func add(item: T) {
        let newNode = Node(val: item)
        if last != nil {
            last?.next = newNode
        }
        last = newNode
        if first == nil {
            first = newNode
        }
    }
    
    public mutating func remove() throws -> T {
        guard let data = first?.data else { throw QueueErrors.noSuchElementException }
        
        self.first = first?.next
        if first == nil {
            last = nil
        }
        
        return data
    }
    
    
    public func peek() throws -> T {
        guard let data = first?.data else { throw QueueErrors.noSuchElementException }
        return data
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
}

struct Cell{
    var row: Int
    var col: Int
}
func rotOranges(oranges: [[Int]]) -> Int {
    var oranges = oranges
    var time = -1
    var addedNewTimeFrame = false
    var q: Queue<Cell> = initQueue(oranges)
    var cell: Cell
    print(oranges)
    while !q.isEmpty() {
        addedNewTimeFrame = false
        cell = try! q.peek()
        print(cell)
        if let leftCell = getValidLeft(oranges, cell) {
            addedNewTimeFrame = true
            oranges[leftCell.row][leftCell.col] = 2
            q.add(item: leftCell)
        }
        if let rightCell = getValidRight(oranges, cell) {
            addedNewTimeFrame = true
            oranges[rightCell.row][rightCell.col] = 2
            q.add(item: rightCell)
        }
        if let topCell = getValidTop(oranges, cell) {
            addedNewTimeFrame = true
            oranges[topCell.row][topCell.col] = 2
            q.add(item: topCell)
        }
        if let downCell = getValidDown(oranges, cell) {
            addedNewTimeFrame = true
            oranges[downCell.row][downCell.col] = 2
            print("down \(downCell)")
            print("down \(oranges[downCell.row][downCell.col] )")
            q.add(item: downCell)
        }
       
        print(oranges)
        try! q.remove()
        if addedNewTimeFrame == true {
            time += 1
        } 
    }
    print(oranges)
    return isAllRotten(oranges) ? time : -1
}

private func getValidTop(_ oranges:[[Int]], _ cell: Cell) -> Cell? {
    if  cell.row - 1 >= 0 && oranges[cell.row - 1][cell.col] == 1 {
        return Cell(row: cell.row - 1, col: cell.col)
    }
    return nil
}
private func getValidDown(_ oranges:[[Int]], _ cell: Cell) -> Cell? {
    if  cell.row + 1 < oranges.count && oranges[cell.row + 1][cell.col] == 1 {
        return Cell(row: cell.row + 1, col: cell.col)
    }
    return nil
}
private func getValidLeft(_ oranges:[[Int]], _ cell: Cell) -> Cell? {
    if  cell.col - 1 >= 0 && oranges[cell.row][cell.col - 1] == 1 {
        return Cell(row: cell.row, col: cell.col - 1)
    }
    return nil
}
private func getValidRight(_ oranges:[[Int]], _ cell: Cell) -> Cell? {
    if  cell.col + 1 < oranges[cell.row].count && oranges[cell.row][cell.col + 1] == 1 {
        return Cell(row: cell.row, col: cell.col + 1)
    }
    return nil
}

private func initQueue(_ oranges: [[Int]])  -> Queue<Cell> {
    var q = Queue<Cell>()
    for row in 0..<oranges.count {
        for col in 0..<oranges[row].count {
            if oranges[row][col] == 2 {
                q.add(item: Cell(row: row, col: col))
            }
        }
    }
    return q
}

private func isAllRotten(_ oranges: [[Int]])  -> Bool {
    for row in 0..<oranges.count {
        for col in 0..<oranges[row].count {
            if oranges[row][col] == 1 {
                return false
            }
        }
    }
    return true
}

private func print(_ oranges: [[Int]])  -> Bool {
    var str = ""
    for row in 0..<oranges.count {
        for col in 0..<oranges[row].count {
            str = "\(str) \(oranges[row][col])"
        }
        print(str)
        str = ""
    }
    print("---------------------")
    return true
}

var o = [ [2,1,0,2,1],
          [0,0,1,2,1],
          [1,0,0,2,1]
]


var o2 = [ [2,1,0,2,1],
           [1,0,1,2,1],
           [1,0,0,2,1]
 ]

rotOranges(oranges: o)
rotOranges(oranges: o2)

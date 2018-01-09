//Solution goes in Sources

import Foundation

class Queens {
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    var white: [Int]
    var black: [Int]
    
    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == black.count else {
            throw InitError.incorrectNumberOfCoordinates
        }
        guard white != black else {
            throw InitError.sameSpace
        }
        for (w, b) in zip(white, black) {
            if w < 0 || w > 8 || b < 0 || b > 8 {
                throw InitError.invalidCoordinates
            }
        }
        self.white = white
        self.black = black
    }
    
    var canAttack: Bool {
        return (white[0] == black[0] || white[1] == black[1] || abs(white[1] - white[0]) == abs(black[1] - black[0]))
    }
}

extension Queens: CustomStringConvertible {
    var description: String {
        let row = [String](repeatElement("_", count: 8))
        var board = [[String]](repeatElement(row, count: 8))
        board[white[0]][white[1]] = "W"
        board[black[0]][ black[1]] = "B"
        var rows = [String]()
        for row in board {
            rows.append(row.joined(separator: " "))
        }
        return rows.joined(separator: "\n")
    }
}











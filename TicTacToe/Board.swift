//
//  Board.swift
//  TicTacToe
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//
import UIKit

struct Board {
    var state: [[BoardState]]
    var size: Int
    var winner: BoardState?
    var currentPlayer: BoardState
    var moveCount: Int
    var tappedCell: UIImageView?
    
    init() {
        self.size = 3
        self.currentPlayer = BoardState.x
        self.moveCount = 0
        self.state = [[BoardState]](repeating: [BoardState](repeating: BoardState.empty, count: 3), count: 3)
    }
    
    mutating func reset() {
        self.currentPlayer = BoardState.x
        self.moveCount = 0
        self.winner = nil
        self.tappedCell = nil
        self.state = [[BoardState]](repeating: [BoardState](repeating: BoardState.empty, count: self.size), count: self.size)
    }
}

//
//  Board.swift
//  TicTacToe
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//

struct Board {
    var state: [[BoardState]]
    var size: Int
    var winner: BoardState?
    var currentPlayer: BoardState
    var moveCount: Int
    
    init(boardSize: Int) {
        self.size = boardSize
        self.currentPlayer = BoardState.x
        self.moveCount = 0
        state = [[BoardState]](repeating: [BoardState](repeating: BoardState.empty, count: boardSize), count: boardSize)
    }
}

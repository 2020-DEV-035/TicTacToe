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
    
    init(boardSize: Int) {
        self.size = boardSize
        state = [[BoardState]](repeating: [BoardState](repeating: BoardState.empty, count: boardSize), count: boardSize)
    }
}

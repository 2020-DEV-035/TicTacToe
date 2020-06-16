//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = Board(boardSize: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func makeMoveAndCheckForWin(on board: inout Board, row: Int, col: Int) {
        if board.state[row][col] == BoardState.empty {
            board.state[row][col] = board.currentPlayer
            board.moveCount += 1
        }
        
        if let won = isWinningMove(on: board, row: row, col: col) {
            board.winner = won
        } else {
            switchPlayer(on: &board)
        }
    }
    
    func isWinningMove(on board: Board, row: Int, col: Int) -> BoardState? {
        
        //horizontal
        for i in 0..<board.size {
            if board.state[row][i] != board.currentPlayer { break }
            if (i == board.size - 1) { return board.currentPlayer }
        }
        
        //draw
        if board.moveCount == Int(pow(Double(board.size),Double(2))) {
            return BoardState.draw
        }
        
        return nil
    }
    
    private func switchPlayer(on board: inout Board) {
        if board.currentPlayer == BoardState.x {
            board.currentPlayer = BoardState.o
        } else {
            board.currentPlayer = BoardState.x
        }
    }
    
}


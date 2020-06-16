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
    var currentPlayer = BoardState.x
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func isWinningMove(on board: Board, row: Int, col: Int, player currentPlayer: BoardState) -> BoardState? {
        
        //horizontal
        for i in 0..<board.size {
            if board.state[row][i] != currentPlayer { break }
            if (i == board.size - 1) { return currentPlayer }
        }
        
        return nil
    }
    
    func makeMove(on board: inout Board, row: Int, col: Int, player currentPlayer: BoardState) -> Board {
        if board.state[row][col] == BoardState.empty {
            board.state[row][col] = currentPlayer
            //switchPlayer(currentPlayer: currentPlayer)
        }
        
        if let won = isWinningMove(on: board, row: row, col: col, player: currentPlayer) {
            board.winner = won
        } else {
            //switch player + new round
        }
        
        return board
    }
    
    private func switchPlayer(currentPlayer: BoardState) {
        if currentPlayer == BoardState.x {
            self.currentPlayer = BoardState.o
        } else {
            self.currentPlayer = BoardState.x
        }
    }
    
}


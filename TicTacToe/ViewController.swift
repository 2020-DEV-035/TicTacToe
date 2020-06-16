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
    
    func isWinningMove(on board: Board, player currentPlayer: BoardState, _ x: Int, _ y: Int) -> BoardState? {
        
        //horizontal
        for i in 0..<board.size {
            if board.state[x][i] != currentPlayer { break }
            if (i == board.size - 1) { return currentPlayer }
        }
        
        return nil
    }
    
    func makeMove(on board: inout Board, x: Int, y: Int, player currentPlayer: BoardState) -> Board {
        if board.state[x][y] == BoardState.empty {
            board.state[x][y] = currentPlayer
            //switchPlayer(currentPlayer: currentPlayer)
        }
        
        if let won = isWinningMove(on: board, player: currentPlayer, x, y) {
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


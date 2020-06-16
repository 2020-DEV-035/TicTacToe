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
    
    func checkForWin(on board: Board, currentPlayer: BoardState) -> BoardState? {
        
        //horizontal
        for i in 0..<board.size {
            if board.state[0][i] != currentPlayer { break }
            if (i == board.size - 1) { return currentPlayer }
        }
        
        return nil
    }
    
    func makeMove(on board: Board, x: Int, y: Int,  currentPlayer: BoardState) -> Board {
        var newBoard = board
        
        if board.state[x][y] == BoardState.empty {
            newBoard.state[x][y] = currentPlayer
            switchPlayer(currentPlayer: currentPlayer)
        }
        
        return newBoard
    }
    
    private func switchPlayer(currentPlayer: BoardState) {
        if currentPlayer == BoardState.x {
            self.currentPlayer = BoardState.o
        } else {
            self.currentPlayer = BoardState.x
        }
    }
    
}


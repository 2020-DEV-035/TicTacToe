//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let boardSize = 3
    var board: [[BoardOption]] = []
    var currentPlayer = BoardOption.x
    
    required init() {
        self.board = [[BoardOption]](repeating: [BoardOption](repeating: BoardOption.empty, count: boardSize), count: boardSize)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func checkForWin(on board: [[BoardOption]], currentPlayer: BoardOption) -> BoardOption? {
        
        //horizontal
        for i in 0..<boardSize {
            if board[0][i] != currentPlayer { break }
            if (i == boardSize - 1) { return currentPlayer }
        }
        
        return nil
    }
    
    func makeMove(on board: [[BoardOption]], x: Int, y: Int,  currentPlayer: BoardOption) -> [[BoardOption]] {
        var newBoard = board
        
        if board[x][y] == BoardOption.empty {
            newBoard[x][y] = BoardOption.x
            switchPlayer(currentPlayer: currentPlayer)
        }
        
        return newBoard
    }
    
    private func switchPlayer(currentPlayer: BoardOption) {
        if currentPlayer == BoardOption.x {
            self.currentPlayer = BoardOption.o
        } else {
            self.currentPlayer = BoardOption.x
        }
    }
    
}


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
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(vStack)
        createBoard()
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    func makeMoveAndCheckForWin(row: Int, col: Int) {
        if board.state[row][col] == BoardState.empty {
            board.state[row][col] = board.currentPlayer
            board.moveCount += 1
        }
        
        if let won = isWinningMove(row: row, col: col) {
            board.winner = won
        } else {
            switchPlayer()
        }
    }
    
    func isWinningMove(row: Int, col: Int) -> BoardState? {
        
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
    
    private func switchPlayer() {
        if board.currentPlayer == BoardState.x {
            board.currentPlayer = BoardState.o
        } else {
            board.currentPlayer = BoardState.x
        }
    }
    
    private func createBoard() {
        for col in 0..<board.size {
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.distribution = .fillEqually
            hStack.spacing = 10
            
            for row in 0..<board.size {
                let myView = UIView()
                myView.backgroundColor = .red
                myView.tag = row
                hStack.addArrangedSubview(myView)

            }
            
            hStack.tag = col
            vStack.addArrangedSubview(hStack)
        }
    }
    
}


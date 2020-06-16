//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board: [[BoardOption]] = []
    var currentPlayer = BoardOption.x

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func checkForWin(_ board: [[BoardOption]], currentPlayer: BoardOption) -> BoardOption? {
        
        //horizontal
        for i in 0..<3 {
            if board[0][i] != currentPlayer { break }
            if (i == 3 - 1) { return currentPlayer }
        }
        
        return nil
    }
}


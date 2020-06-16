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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func checkForWin(_ board: [[BoardOption]]) -> Winner? {
        
        //horizontal
        for i in 0..<3 {
            if board[0][i] != BoardOption.x { break }
            if (i == 3 - 1) { return Winner.playerX }
        }
        
        return Winner.none
    }
}


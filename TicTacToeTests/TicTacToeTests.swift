//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by 2020-DEV-035 on 16/06/2020.
//  Copyright © 2020 2020-DEV-035. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    var sut: ViewController!
    var x: BoardOption!
    var o: BoardOption!
    var empty: BoardOption!

    override func setUpWithError() throws {
        sut = ViewController()
        x = BoardOption.x
        o = BoardOption.o
        empty = BoardOption.empty
    }

    override func tearDownWithError() throws {
        sut = nil
        x = nil
        o = nil
        empty = nil
    }

    func testPlayerXHorizontalWin() throws {
        let board: [[BoardOption]] = [[x, x, x,],
                                     [o, o, empty],
                                     [empty, empty, empty]]
        
        let winner = sut.checkForWin(board)
        
        XCTAssertEqual(winner, Winner.playerX)
    }
    
    func testPlayerOHorizontalWin() throws {
        let board: [[BoardOption]] = [[o, o, o,],
                                     [x, x, empty],
                                     [empty, empty, empty]]
        
        let winner = sut.checkForWin(board)
        
        XCTAssertEqual(winner, Winner.playerO)
    }

}

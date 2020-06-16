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
    var board: [[BoardOption]]!

    override func setUpWithError() throws {
        sut = ViewController()
        x = BoardOption.x
        o = BoardOption.o
        empty = BoardOption.empty
        board = [[BoardOption]](repeating: [BoardOption](repeating: BoardOption.empty, count: 3), count: 3)
    }

    override func tearDownWithError() throws {
        sut = nil
        x = nil
        o = nil
        empty = nil
        board = nil
    }

    func testPlayerXHorizontalWin() throws {
        board = [[x, x, x,],
                [o, o, empty],
                [empty, empty, empty]]
        
        let winner = sut.checkForWin(on: board, currentPlayer: x)
        
        XCTAssertEqual(winner, BoardOption.x)
    }
    
    func testPlayerOHorizontalWin() throws {
        board = [[o, o, o,],
                [x, x, empty],
                [empty, empty, empty]]
        
        let winner = sut.checkForWin(on: board, currentPlayer: o)
        
        XCTAssertEqual(winner, BoardOption.o)
    }
    
    func testPlayerXWinningMove() throws {
        board = [[x, x, empty,],
                [o, o, empty],
                [empty, empty, empty]]
        
        board = sut.makeMove(on: board, x: 0, y: 2, currentPlayer: x)
        let winner = sut.checkForWin(on: board, currentPlayer: x)
        
        XCTAssertEqual(winner, BoardOption.x)
    }

}

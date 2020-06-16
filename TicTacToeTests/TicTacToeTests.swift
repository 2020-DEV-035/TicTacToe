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
    var x: BoardState!
    var o: BoardState!
    var empty: BoardState!
    var board: Board!

    override func setUpWithError() throws {
        sut = ViewController()
        x = BoardState.x
        o = BoardState.o
        empty = BoardState.empty
        board = Board(boardSize: 3)
    }

    override func tearDownWithError() throws {
        sut = nil
        x = nil
        o = nil
        empty = nil
        board = nil
    }

    func testPlayerXHorizontalWin() throws {
        board.state = [[x, x, x,],
                       [o, o, empty],
                       [empty, empty, empty]]
        
        let winner = sut.checkForWin(on: board, currentPlayer: x)
        
        XCTAssertEqual(winner, BoardState.x)
    }
    
    func testPlayerOHorizontalWin() throws {
        board.state = [[o, o, o,],
                       [x, x, empty],
                       [empty, empty, empty]]
        
        let winner = sut.checkForWin(on: board, currentPlayer: o)
        
        XCTAssertEqual(winner, BoardState.o)
    }
    
    func testPlayerXWinningMove() throws {
        board.state = [[x, x, empty,],
                       [o, o, empty],
                       [empty, empty, empty]]
        
        board = sut.makeMove(on: board, x: 0, y: 2, currentPlayer: x)
        let winner = sut.checkForWin(on: board, currentPlayer: x)
        
        XCTAssertEqual(winner, BoardState.x)
    }
    
    func testPlayerOWinningMove() throws {
        board.state = [[o, o, empty,],
                       [x, x, empty],
                       [x, empty, empty]]
        
        board = sut.makeMove(on: board, x: 0, y: 2, currentPlayer: o)
        let winner = sut.checkForWin(on: board, currentPlayer: o)
        
        XCTAssertEqual(winner, BoardState.o)
    }

}

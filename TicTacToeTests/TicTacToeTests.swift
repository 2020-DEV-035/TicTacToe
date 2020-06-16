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

    func testHorizontalWinOnFirstRow() throws {
        board.state = [[x, x, empty,],
                       [o, o, empty],
                       [empty, empty, empty]]
        board.currentPlayer = x
        
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 2)
        
        XCTAssertEqual(board.winner, board.currentPlayer)
    }
    
    func testHorizontalWinOnSecondRow() throws {
        board.state = [[x, x, empty,],
                       [o, o, empty],
                       [empty, empty, empty]]
        board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(on: &board, row: 1, col: 2)
        
        XCTAssertEqual(board.winner, board.currentPlayer)
    }
    
    func testHorizontalWinOnThirdRow() throws {
        board.state = [[x, x, empty,],
                       [empty, empty, empty],
                       [o, o, empty]]
        board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(on: &board, row: 2, col: 2)
        
        XCTAssertEqual(board.winner, board.currentPlayer)
    }
    
    func testIsStartPlayerX() throws {
        XCTAssertEqual(board.currentPlayer, x)
    }
    
    func testSwitchToPlayerO() throws {
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 0)
        
        XCTAssertEqual(board.currentPlayer, o)
    }
    
    func testSwitchToPlayerX() throws {
        board.state = [[x, empty, empty,],
                       [empty, empty, empty],
                       [empty, empty, empty]]
        board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 1)
        
        XCTAssertEqual(board.currentPlayer, x)
    }
    
    func testDraw() throws {
        board.state = [[x, o, x,],
                       [o, x, o],
                       [o, x, empty]]
        board.currentPlayer = o
        board.moveCount = 8
        
        sut.makeMoveAndCheckForWin(on: &board, row: 2, col: 2)
        
        XCTAssertEqual(board.winner, BoardState.draw)
    }
    
    func testMoveCountAtStart() throws {
        XCTAssertEqual(board.moveCount, 0)
    }
    
    func testMoveCount() throws {
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 0)
        
        XCTAssertEqual(board.moveCount, 1)
    }

}

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
    var currentPlayer: BoardState!

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
        currentPlayer = nil
    }

    func testHorizontalWinOnFirstRow() throws {
        board.state = [[x, x, empty,],
                       [o, o, empty],
                       [empty, empty, empty]]
        currentPlayer = x
        let winner: BoardState?
        
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 2, player: currentPlayer)
        winner = sut.isWinningMove(on: board, row: 0, col: 2, player: currentPlayer)
        
        XCTAssertEqual(winner, currentPlayer)
    }
    
    func testHorizontalWinOnSecondRow() throws {
        board.state = [[x, x, empty,],
                       [o, o, empty],
                       [empty, empty, empty]]
        currentPlayer = o
        let winner: BoardState?
        
        sut.makeMoveAndCheckForWin(on: &board, row: 1, col: 2, player: currentPlayer)
        winner = sut.isWinningMove(on: board, row: 1, col: 2, player: currentPlayer)
        
        XCTAssertEqual(winner, currentPlayer)
    }
    
    func testHorizontalWinOnThirdRow() throws {
        board.state = [[x, x, empty,],
                       [empty, empty, empty],
                       [o, o, empty]]
        currentPlayer = o
        let winner: BoardState?
        
        sut.makeMoveAndCheckForWin(on: &board, row: 2, col: 2, player: currentPlayer)
        winner = sut.isWinningMove(on: board, row: 2, col: 2, player: currentPlayer)
        
        XCTAssertEqual(winner, currentPlayer)
    }
    
    func testIsStartPlayerX() throws {
        XCTAssertEqual(board.currentPlayer, x)
    }
    
    func testSwitchToPlayerO() throws {
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 0, player: board.currentPlayer)
        
        XCTAssertEqual(board.currentPlayer, o)
    }
    
    func testSwitchToPlayerX() throws {
        board.state = [[x, empty, empty,],
                       [empty, empty, empty],
                       [empty, empty, empty]]
        board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(on: &board, row: 0, col: 1, player: board.currentPlayer)
        
        XCTAssertEqual(board.currentPlayer, x)
    }

}

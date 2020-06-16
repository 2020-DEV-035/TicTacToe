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

    override func setUpWithError() throws {
        sut = ViewController()
        x = BoardState.x
        o = BoardState.o
        empty = BoardState.empty
    }

    override func tearDownWithError() throws {
        sut = nil
        x = nil
        o = nil
        empty = nil
    }

    func testHorizontalWinOnFirstRow() throws {
        sut.board.state = [[x, x, empty,],
                           [o, o, empty],
                           [empty, empty, empty]]
        sut.board.currentPlayer = x
        
        sut.makeMoveAndCheckForWin(row: 0, col: 2)
        
        XCTAssertEqual(sut.board.winner, x)
    }
    
    func testHorizontalWinOnSecondRow() throws {
        sut.board.state = [[x, x, empty,],
                           [o, o, empty],
                           [empty, empty, empty]]
        sut.board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(row: 1, col: 2)
        
        XCTAssertEqual(sut.board.winner, o)
    }
    
    func testHorizontalWinOnThirdRow() throws {
        sut.board.state = [[x, x, empty,],
                           [empty, empty, empty],
                           [o, o, empty]]
        sut.board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(row: 2, col: 2)
        
        XCTAssertEqual(sut.board.winner, o)
    }
    
    func testIsStartPlayerX() throws {
        XCTAssertEqual(sut.board.currentPlayer, x)
    }
    
    func testSwitchToPlayerO() throws {
        sut.makeMoveAndCheckForWin(row: 0, col: 0)
        
        XCTAssertEqual(sut.board.currentPlayer, o)
    }
    
    func testSwitchToPlayerX() throws {
        sut.board.state = [[x, empty, empty,],
                           [empty, empty, empty],
                           [empty, empty, empty]]
        sut.board.currentPlayer = o
        
        sut.makeMoveAndCheckForWin(row: 0, col: 1)
        
        XCTAssertEqual(sut.board.currentPlayer, x)
    }
    
    func testDraw() throws {
        sut.board.state = [[x, o, x,],
                           [o, x, o],
                           [o, x, empty]]
        sut.board.currentPlayer = o
        sut.board.moveCount = 8
        
        sut.makeMoveAndCheckForWin(row: 2, col: 2)
        
        XCTAssertEqual(sut.board.winner, BoardState.draw)
    }
    
    func testMoveCountAtStart() throws {
        XCTAssertEqual(sut.board.moveCount, 0)
    }
    
    func testMoveCount() throws {
        sut.makeMoveAndCheckForWin(row: 0, col: 0)
        
        XCTAssertEqual(sut.board.moveCount, 1)
    }
    
    func testReset() throws {
        sut.board.state = [[x, o, x,],
                           [o, x, o],
                           [o, x, empty]]
        sut.board.currentPlayer = o
        sut.board.moveCount = 8
        sut.board.winner = o
        let image = UIImageView.init(image: UIImage(named: "O"))
        sut.board.tappedCell = image
        
        sut.board.reset()
        
        XCTAssertEqual(sut.board.state, [[empty, empty, empty,],
                                        [empty, empty, empty],
                                        [empty, empty, empty]])
        XCTAssertEqual(sut.board.currentPlayer, x)
        XCTAssertEqual(sut.board.moveCount, 0)
        XCTAssertNil(sut.board.winner)
        XCTAssertNil(sut.board.tappedCell)
    }

}

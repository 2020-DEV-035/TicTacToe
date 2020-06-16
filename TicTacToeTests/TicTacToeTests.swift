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

    override func setUpWithError() throws {
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPlayerXHorizontalWin() throws {
        let x = BoardOption.x
        let o = BoardOption.o
        let empty = BoardOption.empty
        let board: [[BoardOption]] = [[x, x, x,],
                                     [o, o, empty],
                                     [empty, empty, empty]]
        
        let winner = sut.checkForWin(board)
        
        XCTAssertNotNil(winner)
        XCTAssertEqual(winner, Winner.playerX)
    }

}

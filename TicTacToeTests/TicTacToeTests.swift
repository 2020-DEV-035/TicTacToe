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

    func testExample() throws {
        
    }

}

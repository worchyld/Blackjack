//
//  CardTests.swift
//  BlackjackTests
//
//  Created by Amarjit on 02/03/2022.
//

import XCTest

@testable import Blackjack

class CardTests: XCTestCase {

    func testAce() {
        let ace = Card(rank: .ace, suit: .clubs)
        XCTAssertTrue(ace.rank.values.first == 1 || ace.rank.values.second == 11)
        XCTAssertEqual(ace.suit, .clubs)
    }

}

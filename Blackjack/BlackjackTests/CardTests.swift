//
//  CardTests.swift
//  BlackjackTests
//
//  Created by Amarjit on 02/03/2022.
//

import XCTest

@testable import Blackjack

class CardTests: XCTestCase {

    func testDeckIs52Cards() {
        let deck = Deck()
        deck.prepare()
        
        XCTAssertTrue(deck.cards.count == 52)
        NSLog(deck.description + "\n")
    }
    
    func testAceValueIs1Or11() {
        let ace = Card(rank: .ace, suit: .clubs)
        XCTAssertTrue(ace.rank.values.first == 1 || ace.rank.values.second == 11)
        XCTAssertEqual(ace.suit, .clubs)
    }
    
    func testJackToKingValues() {
        let jack = Card(rank: .jack, suit: .hearts)
        let queen = Card(rank: .queen, suit: .hearts)
        let king = Card(rank: .king, suit: .hearts)
        
        XCTAssertTrue(jack.rank.values.first == 10)
        XCTAssertTrue(queen.rank.values.first == 10)
        XCTAssertTrue(king.rank.values.first == 10)
    }

}

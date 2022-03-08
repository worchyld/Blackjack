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
    
    func testDeckIsShuffled() {
        let deck = Deck()
        deck.prepare()
        deck.shuffle()
        print(deck.description)
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
    
    func testCardSuitNames() {
        let jackDiamonds = Card(rank: .jack, suit: .diamonds).suit.description
        let jackHearts = Card(rank: .jack, suit: .hearts).suit.description
        let jackClubs = Card(rank: .jack, suit: .clubs).suit.description
        let jackSpades = Card(rank: .jack, suit: .spades).suit.description
        
        XCTAssertEqual(jackDiamonds, "diamonds")
        XCTAssertEqual(jackHearts, "hearts")
        XCTAssertEqual(jackClubs, "clubs")
        XCTAssertEqual(jackSpades, "spades")
    }
    
    func testCardRankName() {
        let jack = Card(rank: .jack, suit: .clubs)
        let rankName = jack.rank.description
        
        XCTAssertEqual(rankName, "j")
    }
    
    func testSumOfCardsEquals21() {
        let card1 = Card(rank: .jack, suit: .diamonds) //10
        let card2 = Card(rank: .four, suit: .diamonds) //4
        let card3 = Card(rank: .three, suit: .diamonds) //3
        let card4 = Card(rank: .four, suit: .diamonds) //4
        
        let cards = [card1, card2, card3, card4]
        
        var total = 0
        for card in cards {
            let values = card.value
            if (values.second == nil) {
                total += values.first
            } else {
                let secondValue = values.second!
                total += secondValue
            }
        }
        
        XCTAssertEqual(total, 21)
    }

}

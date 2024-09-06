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
    
    func testJackValueIs10() {
        let card = Card(rank: .jack, suit: .clubs)
        let hand = Hand(cards: [card])
        let expected = 10
        XCTAssertEqual(hand.score, expected)
    }
    
    func testQueenValueIs10() {
        let card = Card(rank: .queen, suit: .clubs)
        let hand = Hand(cards: [card])
        let expected = 10
        XCTAssertEqual(hand.score, expected)
    }
    
    func testKingValueIs10() {
        let card = Card(rank: .jack, suit: .clubs)
        let hand = Hand(cards: [card])
        let expected = 10
        XCTAssertEqual(hand.score, expected)
    }
    
    func testNumericValue() {
        let card = Card(rank: .two, suit: .clubs)
        let hand = Hand(cards: [card])
        let expected = 2
        XCTAssertEqual(hand.score, expected)
    }

    func testCombinedHandValue() {
        let fiveClubs = Card(rank: .five, suit: .clubs)
        let fiveSpades = Card(rank: .five, suit: .spades)
        let fourHearts = Card(rank: .four, suit: .hearts)
        
        let hand = Hand(cards: [fiveClubs, fiveSpades, fourHearts])
        
        let expected = 14
        XCTAssertEqual(hand.score, expected)
    }
    
    func testAceIsHighValue() {
        let card = Card(rank: .ace, suit: .clubs)
        let hand = Hand(cards: [card])
        let expected = 11
        XCTAssertEqual(hand.score, expected)
    }
    
    
    func testAcesIsLowValue() {
        let cardTen = Card(rank: .ten, suit: .clubs)
        let cardSeven = Card(rank: .seven, suit: .clubs)
        let cardThree = Card(rank: .three, suit: .clubs)
        let cardAce = Card(rank: .ace, suit: .clubs)
        
        let hand = Hand(cards: [cardTen, cardSeven, cardThree, cardAce])
        let expected = (10+7+3+1)
        XCTAssertEqual(hand.score, expected)
    }

}

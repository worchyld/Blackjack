//
//  Deck.swift
//  Blackjack
//
//  Created by Amarjit on 03/03/2022.
//

import Foundation
import GameplayKit

// Deck
class Deck {
    var cards: [Card] = [Card]()
    
    func prepare() {
        let ranks = [Card.Rank.ace, Card.Rank.two, Card.Rank.three, Card.Rank.four, Card.Rank.five, Card.Rank.six, Card.Rank.seven, Card.Rank.eight, Card.Rank.nine, Card.Rank.ten, Card.Rank.jack, Card.Rank.queen, Card.Rank.king]
        let suits = [Card.Suit.spades, Card.Suit.clubs, Card.Suit.diamonds, Card.Suit.hearts]
        
        for rank in ranks {
            for suit in suits {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    // draw 1 card from the deck
    func drawExactlyOneCard() -> Card? {
        guard !self.cards.isEmpty else {
            return nil
        }
        return nil // TBC
    }
    
    // shuffle deck
    func shuffle() {
        self.cards.shuffle()
    }
    
}

extension Deck : CustomStringConvertible {
    var description: String {
        var output: String = ""
        for card in self.cards {
            output.append("Card: \(card.description)\n")
        }
        return output
    }
}

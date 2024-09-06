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
    private var _cards: [Card] = [Card]()
    
    var cards: [Card] {
        get {
            return self._cards
        }
    }
    
    // prepare the deck, fill to 52 cards in an unshuffled state
    func prepare() {
        let ranks = [Card.Rank.ace, Card.Rank.two, Card.Rank.three, Card.Rank.four, Card.Rank.five, Card.Rank.six, Card.Rank.seven, Card.Rank.eight, Card.Rank.nine, Card.Rank.ten, Card.Rank.jack, Card.Rank.queen, Card.Rank.king]
        let suits = [Card.Suit.spades, Card.Suit.clubs, Card.Suit.diamonds, Card.Suit.hearts]
        
        for rank in ranks {
            for suit in suits {
                self._cards.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    // shuffle deck
    func shuffle() {
        self._cards.shuffle()
    }
}

extension Deck : CustomStringConvertible {
    var description: String {
        var output: String = ""
        for card in self._cards {
            output.append("Card: \(card.description)\n")
        }
        return output
    }
}

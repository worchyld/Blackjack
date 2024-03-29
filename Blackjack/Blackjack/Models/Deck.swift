//
//  Deck.swift
//  Blackjack
//
//  Created by Amarjit on 03/03/2022.
//

import Foundation
import GameplayKit

protocol DeckDelegate {
    func prepare()
    func shuffle()
    func drawExactlyOneCard() -> Card?
    func removeCard()
    var deckSize: Int { get set }
    var cards: [Card] { get set }
}

// Deck
class Deck : DeckDelegate {
    var deckSize: Int = 0
    var cards: [Card] = [Card]()
    
    // prepare the deck, fill to 52 cards in an unshuffled state
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
    
    // remove card
    func removeCard() {
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

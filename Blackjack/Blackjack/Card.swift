//
//  Card.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation

struct Card {
    
    // Suit enumerated
    enum Suit : Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // Rank enumerated
    enum Rank : Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second : Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit : Suit
}

extension Card : CustomStringConvertible {
    var description: String {
        var output = "suit is \(suit.rawValue),"
                output += " value is \(rank.values.first)"
                if let second = rank.values.second {
                    output += " or \(second)"
                }
        return output
    }
}

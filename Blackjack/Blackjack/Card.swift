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
    
    enum Rank: CaseIterable {
      case two, three, four, five, six, seven, eight, nine, ten
      case jack, queen, king
      case ace
    }
    
    /*
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
    }*/
    
    let rank: Rank, suit : Suit
    
}

//
// Card description extensions
//

extension Card.Suit : CustomStringConvertible {
    // map the output back to the key
    // there's probably a better way to do this
    var description: String {
        switch String(self.rawValue) {
        case "♠": return "spades"
        case "♡": return "hearts"
        case "♢": return "diamonds"
        case "♣": return "clubs"
        default:
            return ""
        }
    }
}

extension Card.Rank : CustomStringConvertible {
    var description: String {
        return ""
        /*
        switch self {
        case .two, .three, .four, .five, .six, .seven,.eight,.nine,.ten:
            return String(self.rawValue)
        case .ace:
            return "ace"
        case .jack:
            return "j"
        case .queen:
            return "q"
        case .king:
            return "k"
        }*/
    }
}

extension Card : CustomStringConvertible {
    var description: String {
        let output = "\(suit.description) \n suit is \(suit.rawValue),"
                //output += " value is \(rank.values.first)"
//                if let second = rank.values.second {
//                    output += " or \(second)"
//                }
        return output
    }
}


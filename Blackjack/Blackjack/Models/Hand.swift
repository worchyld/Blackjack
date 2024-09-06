//
//  Hand.swift
//  Blackjack
//
//  Created by Amarjit on 09/03/2022.
//

import Foundation

struct Hand {
  init<Cards: Sequence>(cards: Cards) where Cards.Element == Card {
    let reduction = cards.reduce(into: (score: 0, aceCount: 0)) {
      switch $1.rank {
      case .jack, .queen, .king:
        $0.score += 10
      case .ace:
        $0.score += 1
        $0.aceCount += 1
      default:
        $0.score += try! $1.rank.caseIndex + 2
      }
    }

    var score = reduction.score
    AnyIterator { score <= 11 ? 10 : nil }
      .prefix(reduction.aceCount)
      .forEach { score += $0 }
    self.score = score
  }

  let score: Int
}

// Extensions for Hand
extension Hand {
    func isBust() -> Bool {
        return score > 21
    }

    func is21() -> Bool {
      return score == 21
    }
    
    func isBlackjack(cards: [Card]) -> Bool {
        // Note: This assumes that a Hand with exactly 2 cards and a score of 21 is a Blackjack.
        // You might need to adjust this if your game rules are different.
        return score == 21 && cards.count == 2
    }
}

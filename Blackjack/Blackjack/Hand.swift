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

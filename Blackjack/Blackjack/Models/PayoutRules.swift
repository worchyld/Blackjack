//
//  PayoutRules.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import Foundation

struct PayoutRules {
    let regularWin: Double
    let blackjack: Double
    let push: Double
    
    static let standard = PayoutRules(regularWin: 2.0, blackjack: 2.5, push: 1.0)
    
    func calculatePayout(for betAmount: Int, withOutcome outcome: BetOutcome) -> Int {
        switch outcome {
        case .regularWin:
            return Int(Double(betAmount) * regularWin)
        case .blackjack:
            return Int(Double(betAmount) * blackjack)
        case .push:
            return Int(Double(betAmount) * push)
        case .loss:
            return 0
        }
    }
}

enum BetOutcome {
    case regularWin
    case blackjack
    case push
    case loss
}

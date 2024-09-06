//
//  BettingManager.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import Foundation

// Handles the bets

class BettingManager {
    enum BettingError: Error {
        case invalidBet
        case insufficientFunds
    }
    
    struct BettingAccount {
        var coins: Int
        var currentBet: Int
    }
    
    private(set) var account: BettingAccount
    private let payoutRules: PayoutRules
    
    init(initialCoins: Int, payoutRules: PayoutRules = .standard) {
        self.account = BettingAccount(coins: initialCoins, currentBet: 0)
        self.payoutRules = payoutRules
    }
    
    func placeBet(_ amount: Int) throws {
        guard amount > 0 else { throw BettingError.invalidBet }
        guard account.coins >= amount else { throw BettingError.insufficientFunds }
        
        account.currentBet = amount
        account.coins -= amount
    }
    
    func resolveBet(outcome: BetOutcome) {
        let payout = payoutRules.calculatePayout(for: account.currentBet, withOutcome: outcome)
        account.coins += payout
        account.currentBet = 0
    }
    
    func getCurrentBet() -> Int {
        return account.currentBet
    }
    
    func getAvailableCoins() -> Int {
        return account.coins
    }
}

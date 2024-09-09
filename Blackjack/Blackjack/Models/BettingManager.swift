//
//  BettingManager.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import Foundation
import Combine

// Handles the bets

class BettingManager: ObservableObject {
    enum BettingError: Error {
        case invalidBet
        case insufficientFunds
    }
    
    struct BettingAccount {
        var coins: Int
        var currentBet: Int
    }
    
    @Published private(set) var account: BettingAccount
    private let payoutRules: PayoutRules

    var currentBet: Int {
        get { account.currentBet}
    }
    var coins: Int {
        get { account.coins }
    }
    
    init(initialCoins: Int, payoutRules: PayoutRules = .standard) {
        self.account = BettingAccount(coins: initialCoins, currentBet: 0)
        self.payoutRules = payoutRules
    }
    
    func canBet(_ amount: Int) -> Bool {
       return amount > 0 && amount <= coins
    }
    
    func addToBet(_ amount: Int) throws {
        guard amount > 0 else { throw BettingError.invalidBet }
        guard account.coins >= amount else { throw BettingError.insufficientFunds }
        
        account.currentBet += amount
        account.coins -= amount
    }
    
    func cancelBet() {
        account.coins += account.currentBet
        account.currentBet = 0
    }

    func submitBet() -> Int {
        let submittedBet = account.currentBet
        account.currentBet = 0
        return submittedBet
    }
    
    func resolveBet(outcome: BetOutcome) {
        let payout = payoutRules.calculatePayout(for: account.currentBet, withOutcome: outcome)
        account.coins += payout
        account.currentBet = 0
    }
}

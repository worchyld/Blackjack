//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation

enum GameState {
    case newHand, deal, playerTurn, dealerTurn
}

enum GameResult {
    case playerBlackjack, playerBust, playerWins, dealer21, dealerBusts, dealerWins
}

class BlackjackGame {
    var pot : Int = 0
    var currentBet : Int = 0
    var doubleDown : Bool = false
    var deck: Deck = Deck()
    
    init() {
        reset()
    }
    
    func reset() {
        self.pot = 0
        self.currentBet = 0
        self.doubleDown = false
    }
     
}

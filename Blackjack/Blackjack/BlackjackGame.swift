//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation

class BlackjackGame {
    var pot : Int = 0
    var currentBet : Int = 0
    var doubleDown : Bool = false
    var deck: [Card] = [Card]()
    enum GameState : Int {
        case reset = 1, deal, player, dealer
    }
    var gameState: GameState = .reset
    
    func reset() {
        self.pot = 0
        self.currentBet = 0
        self.doubleDown = false
        self.deck = [Card]()
    }
     
}

//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation

enum GameState {
    case idle, playerTurn, dealerTurn, gameOver
}

enum GameResult {
    case playerBlackjack, playerBust, playerWins, dealerBlackjack, dealerBusts, dealerWins, push
}

protocol GameStateDelegate: AnyObject {
    func gameStateChanged(to state: GameState)
    func dealerScoreChanged(score: Int)
    func playerScoreChanged(score: Int)
    func gameOver(result: GameResult)
}

class BlackjackGame {
    private var deck: Deck
    private var playerHand: [Card] = []
    private var dealerHand: [Card] = []
    private(set) var currentBet: Int = 0
    private(set) var pot: Int = 0
    private(set) var gameState: GameState = .idle
    
    weak var delegate: GameStateDelegate?
    
    init() {
       self.deck = Deck()
    }
    
    func newGame() {
        // Implementation for starting a new game
        reset()
    }

    func shuffleDeck() {
        // Implementation for shuffling the deck
        deck.shuffle()
    }
    
    func placeBet(_ amount: Int) {
       // Implementation for placing a bet
    }

    func deal() {
       // Implementation for dealing initial cards
    }

    func hit() {
       // Implementation for hitting (drawing a card)
    }

    func stand() {
       // Implementation for standing (ending player's turn)
    }

    func dealerPlay() {
       // Implementation for dealer's turn
    }
    
    // MARK: (Private)
    
    private static func createDeck() -> [Card] {
        let deck = Deck()
        deck.prepare()
        return deck.cards
    }
    
    private func evaluateGame() -> GameResult {
        // Implementation for evaluating the game result
        return .push // Placeholder
    }
    
    private func calculateScore(hand: [Card]) -> Int {
        // Implementation for calculating hand score
        return 0 // Placeholder
    }
}
    
extension BlackjackGame {
    func reset() {
        currentBet = 0
        pot = 0
        gameState = .idle
        playerHand = []
        dealerHand = []
    }
}

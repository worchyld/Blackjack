//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation

// enum GameState {
//     case newHand, deal, playerTurn, dealerTurn
// }

// enum GameResult {
//     case playerBlackjack, playerBust, playerWins, dealer21, dealerBusts, dealerWins
// }

// protocol GameStateDelegate {
//     func gameStateChanged(to: GameState)
//     func dealerScoreChanged(score: Int)
//     func playerScoreChanged(score: Int)
//     func playerBalanceChanged(newBalance: Int)
//     func gameOver()
// }

// class BlackjackGame {
//     var pot : Int = 0
//     var currentBet : Int = 0
//     var doubleDown : Bool = false
//     var deck: Deck = Deck()
    
//     init() {
//         reset()
//     }
    
//     func reset() {
//         self.pot = 0
//         self.currentBet = 0
//         self.doubleDown = false
//     }
     
// }


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
    
private static func createDeck() -> [Card] {
        var deck: [Card] = []
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
        return deck
    }

    func newGame() {
        // Implementation for starting a new game
        currentBet = 0
        pot = 0
        gameState = .idle
        playerHand = []
        dealerHand = []
        
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
    
    private func evaluateGame() -> GameResult {
        // Implementation for evaluating the game result
        return .push // Placeholder
    }
    
    private func calculateScore(hand: [Card]) -> Int {
        // Implementation for calculating hand score
        return 0 // Placeholder
    }
}
//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import Foundation


/**
enum GameState {
    case idle
    case betPlaced
    case dealingInitialCards
    case playerTurn
    case dealerTurn
    case evaluating
    case gameOver
}

enum GameResult {
    case playerBlackjack, playerBust, playerWins, dealerBlackjack, dealerBusts, dealerWins, push
}

protocol GameStateDelegate: AnyObject {
    func gameStateChanged(to state: GameState)
    func dealerScoreChanged(score: Int)
    func playerScoreChanged(score: Int)
    func gameOver(result: GameResult)
    func balanceChanged(newBalance: Int)
}

class BlackjackGame {
    private var deck: Deck
    
    private var player: Player
    private var dealer: Player
    
    private var playerHand: [Card] = []
    private var dealerHand: [Card] = []
    
    private(set) var currentBet: Int = 0
    private(set) var pot: Int = 0
    private(set) var gameState: GameState = .idle

    private var playerBettingManager: BettingManager

    weak var delegate: GameStateDelegate?
    weak var errorHandler: GameErrorHandler?

    init(playerName: String = "Player 1", initialCoins: Int = 10, payoutRules: PayoutRules = .standard) {
        self.deck = Deck()
        self.player = Player(name: "Player 1", initialCoins: initialCoins)
        self.dealer = Player(name: "Dealer", initialCoins: 0)
        
        self.playerBettingManager = BettingManager(initialCoins: initialCoins, payoutRules: payoutRules)
    }
    
    // Implementation for starting a new game
    func newGame() {
        reset()
    }

    // Implementation for shuffling the deck
    func shuffleDeck() {
        deck.shuffle()
    }
    
    // Implementation for placing a bet
    func placeBet(_ amount: Int) {
        guard gameState == .idle else {
            errorHandler?.handleError(.invalidGameState)
            return
        }
        do {
            try playerBettingManager.placeBet(amount)
            gameState = .betPlaced
            delegate?.gameStateChanged(to: gameState)
            delegate?.balanceChanged(newBalance: playerBettingManager.getAvailableCoins())
        } catch BettingManager.BettingError.invalidBet {
            errorHandler?.handleError(.invalidBet)
        } catch BettingManager.BettingError.insufficientFunds {
            errorHandler?.handleError(.insufficientFunds)
        } catch {
            errorHandler?.handleError(.invalidBet)
        }
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
    private func reset() {
        currentBet = 0
        pot = 0
        gameState = .idle
        playerHand = []
        dealerHand = []
    }
}
**/
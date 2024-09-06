import Foundation

struct Player {
    var name: String
    var hand: [Card] = []
    var coins: Int
    var bet: Int = 0
    
    init(name: String, initialCoins: Int) {
        self.name = name
        self.coins = initialCoins
    }
    
    mutating func placeBet(_ amount: Int) throws {
        guard amount > 0 else { throw GameError.invalidBet }
        guard coins >= amount else { throw GameError.insufficientFunds }
        bet = amount
        coins -= amount
    }
    
    mutating func winBet() {
        coins += bet * 2
        bet = 0
    }
    
    mutating func loseBet() {
        bet = 0
    }
    
    mutating func pushBet() {
        coins += bet
        bet = 0
    }
    
    mutating func receiveCard(_ card: Card) {
        hand.append(card)
    }
    
    mutating func clearHand() {
        hand.removeAll()
    }
    
    func calculateScore() -> Int {
        var score = 0
        var aceCount = 0
        
        for card in hand {
            switch card.rank {
            case .ace:
                aceCount += 1
                score += 11
            case .jack, .queen, .king:
                score += 10
            default:
                score += card.rank.rawValue
            }
        }
        
        while score > 21 && aceCount > 0 {
            score -= 10
            aceCount -= 1
        }
        
        return score
    }
}
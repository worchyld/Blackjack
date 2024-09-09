import Foundation

struct Player {
    var name: String
    var hand: [Card] = []
    var coins: Int
    var bet: Int
    
    init(name: String, initialCoins: Int = 20) {
        self.name = name
        self.coins = initialCoins
        self.hand = []
        self.bet = 0
    }
}

extension Player {
    mutating func receiveCard(_ card: Card) {
        hand.append(card)
    }
    
    mutating func clearHand() {
        hand.removeAll()
    }
}

extension Player {    
    func calculateScore() -> Int {
        let hand = Hand(cards: self.hand)
        return hand.score
    }
}

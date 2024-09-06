import Foundation

struct Player {
    var name: String
    var cards: [Card]
    var coins: Int
    var bet: Int
    
    init(name: String = "Player 1", initialCoins: Int = 0) {
        self.name = name
        self.coins = initialCoins
        self.cards = []
        self.bet = 0
    }
    
    mutating func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    mutating func clearHand() {
        cards.removeAll()
    }
    
    func calculateScore() -> Int {
        let hand = Hand.init(cards: cards)
        return hand.score
    }
}

//
//  BJTableView.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI


struct CardView: View {
    let isFaceUp: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isFaceUp ? Color.white : Color.blue)
                .frame(width: 60, height: 90)
            
            if isFaceUp {
                Text("A♠️") // Placeholder for actual card value
            }
        }
    }
}


class BlackjackGameViewModel: ObservableObject {
    @Published private var game: BlackjackGame
    @Published var dealerScore: Int = 0
    @Published var playerScore: Int = 0
    @Published var playerCoins: Int = 0
    @Published var gameState: GameState = .idle
    
    init() {
        game = BlackjackGame(initialCoins: 1000)
        game.delegate = self
        game.errorHandler = self
    }
    
    func startNewGame() {
        game.newGame()
        game.shuffleDeck()
    }
    
    func deal() {
        game.deal()
    }
    
    func hit() {
        game.hit()
    }
    
    func stand() {
        game.stand()
    }
}

extension BlackjackGameViewModel: GameStateDelegate {
    func gameStateChanged(to state: GameState) {
        DispatchQueue.main.async {
            self.gameState = state
        }
    }
    
    func dealerScoreChanged(score: Int) {
        DispatchQueue.main.async {
            self.dealerScore = score
        }
    }
    
    func playerScoreChanged(score: Int) {
        DispatchQueue.main.async {
            self.playerScore = score
        }
    }
    
    func gameOver(result: GameResult) {
        // Handle game over
    }
    
    func balanceChanged(newBalance: Int) {
        DispatchQueue.main.async {
            self.playerCoins = newBalance
        }
    }
}

extension BlackjackGameViewModel: GameErrorHandler {
    func handleError(_ error: GameError) {
        // Handle errors
    }
}



struct PlayView: View {
    @StateObject private var viewModel = BlackjackGameViewModel()
        
        var body: some View {
            VStack {
                Text("Dealer Score: \(viewModel.dealerScore)")
                    .font(.headline)
                
                ZStack {
                    ForEach(0..<52, id: \.self) { index in
                        CardView(isFaceUp: false)
                            .offset(x: CGFloat(index) * 0.5, y: CGFloat(index) * 0.5)
                    }
                }
                .frame(height: 100)
                
                Spacer()
                
                Text("Player Score: \(viewModel.playerScore)")
                    .font(.headline)
                
                Text("Player Coins: \(viewModel.playerCoins)")
                    .font(.subheadline)
                
                HStack {
                    Button("Deal") {
                        viewModel.deal()
                    }
                    .disabled(viewModel.gameState != .betPlaced)
                    
                    Button("Hit") {
                        viewModel.hit()
                    }
                    .disabled(viewModel.gameState != .playerTurn)
                    
                    Button("Stand") {
                        viewModel.stand()
                    }
                    .disabled(viewModel.gameState != .playerTurn)
                }
                .padding()
            }
            .padding()
            .onAppear {
                viewModel.startNewGame()
            }
        }
}

#Preview {
    PlayView()
}

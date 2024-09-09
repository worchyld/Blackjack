//
//  BetChipsView.swift
//  Blackjack
//
//  Created by Amarjit on 09/09/2024.
//

import SwiftUI

enum Chips: Int {
    case five = 5
    case ten = 10
    case twenty = 20
    case fifty = 50
}

struct BetChipsView: View {
    @ObservedObject var bettingManager: BettingManager
    var onSubmit: (Int) -> Void
    
    var body: some View {
        Text("Coins: $\(bettingManager.coins)")
            .font(.headline)
            .padding()
        
        Text("Bet: $\(bettingManager.currentBet)")
            .font(.title)
            .padding()
        
        HStack {
            ForEach([Chips.five, .ten, .twenty, .fifty], id: \.self) { chip in
                Button(action: {
                    try? bettingManager.addToBet(chip.rawValue)
                }) {
                    Text("$\(chip.rawValue)")
                        .padding()
                        .cornerRadius(10)
                }
                .disabled(!bettingManager.canBet(chip.rawValue))
            }
        }
        .padding()
        
        HStack {
            CancelButtonView(bettingManager: bettingManager)

            SubmitButtonView(currentBet: bettingManager.currentBet, submitAction: {
                let submittedBet = bettingManager.submitBet()
                onSubmit(submittedBet)
                print("Bet placed: $\(submittedBet)  Coins: $\(bettingManager.coins)")
            })
            
            
        }
        .padding()
    }
}

struct CancelButtonView: View {
    @ObservedObject var bettingManager: BettingManager
    
    var body: some View {
        Button("Cancel") {
            bettingManager.cancelBet()
        }
        .padding()
        .cornerRadius(10)
    }
}

struct SubmitButtonView: View {
    let currentBet: Int
    let submitAction: () -> Void
    
    var body: some View {
        Button("Submit", action: submitAction)
            .padding()
            .cornerRadius(10)
            .disabled(currentBet == 0)
    }
}


#Preview {
    BetChipsView(bettingManager: BettingManager(initialCoins: 100), onSubmit: { _ in })
}

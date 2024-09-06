//
//  Error.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import Foundation

enum GameError: Error {
    case invalidBet
    case insufficientFunds
    case gameNotInProgress
    case invalidGameState
    // Add more error cases as needed
}

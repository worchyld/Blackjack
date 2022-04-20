//
//  AnimatedNumberModifier.swift
//  Blackjack
//
//  Created by Amarjit on 20/04/2022.
//

import Foundation
import SwiftUI

struct AnimatableNumberModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(Int(number))")
            )
    }
}

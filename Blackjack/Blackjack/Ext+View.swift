//
//  Ext+View.swift
//  Blackjack
//
//  Created by Amarjit on 20/04/2022.
//

import Foundation
import SwiftUI

extension View {
    func animatingOverlay(for number: Double) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}

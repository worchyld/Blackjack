//
//  AnimatedNumberView.swift
//  Blackjack
//
//  Created by Amarjit on 20/04/2022.
//

import SwiftUI

// to be removed

struct AnimatedNumberView: View {
    @State private var number: Double = 0

    var body: some View {
        VStack(spacing: 20) {
            Color.clear
                .frame(width: 50, height: 50)
                .animatingOverlay(for: number)
            
            
            Button {
                withAnimation {
                    number = .random(in: 0 ..< 200)
                }
            } label: {
                Text("Create random number")
            }
        }
    }
}

struct AnimatedNumberView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedNumberView()
    }
}

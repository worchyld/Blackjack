//
//  MainMenuView.swift
//  Blackjack
//
//  Created by Amarjit on 22/04/2022.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            Text("Simple Blackjack")
            Button {
            } label: {
                Text("Play")
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

//
//  ContentView.swift
//  Blackjack
//
//  Created by Amarjit on 02/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Simple BlackJack")
                .font(.largeTitle)
                .foregroundColor(.white)
                        
            HStack(alignment: .center, spacing: 30.0) {
                Button(action: {
                    print("Hello button tapped!")
                }) {
                    Text("Play")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
                        )
                }                
            }.padding(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

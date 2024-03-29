//
//  GameTableView.swift
//  Blackjack
//
//  Created by Amarjit on 02/05/2023.
//

import SwiftUI

struct GameTableView: View {        
    var body: some View {
        VStack {
            Text("Simple BlackJack")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Score: 10")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            HStack(alignment: .center, spacing: 30.0) {
                Button(action: {
                    print("Hello button tapped!")
                }) {
                    Text("Hit")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
                        )
                }
                
                Button(action: {
                    print("Hello button tapped!")
                }) {
                    Text("Stand")
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


struct GameTableView_Previews: PreviewProvider {
    static var previews: some View {
        GameTableView()
    }
}

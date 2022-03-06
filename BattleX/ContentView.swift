//
//  ContentView.swift
//  BattleX
//
//  Created by Dav Yaginuma on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameState : GameState
    
    let dieView = DieView()
    
    var body: some View {
        VStack {
            Text("BattleX")
                .font(Font.title)
                .foregroundColor(Color.black)
                .padding()
            Spacer()
            HStack {
                DamageView(isPlayerOne: true)
                Spacer()
                DamageView(isPlayerOne: false)
            }
            HStack {
                Spacer()
                Image("hedgehog")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 100)
                    .border(
                        gameState.player1Doubling ? Color.green : Color.gray,
                        width: gameState.player1Active ? 5 : 1)
                Spacer()
                dieView
                Spacer()
                Image("mouse")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 100)
                    .border(gameState.player2Doubling ? Color.green : Color.gray,
                            width: !gameState.player1Active ? 5 : 1)
                Spacer()
            }
            HStack {
                Spacer()
                if gameState.isGameOver {
                    Button("Player \(gameState.player1Active ? 1 : 2) wins! Tap to Restart") {
                        gameState.reset()
                    }
                } else {
                    Button(gameState.player1Active ? "< Roll" : "Roll >") {
                            gameState.rollDie()
                    }.disabled(gameState.isRolling)
                }
                Spacer()
            }
            Spacer()
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeRight)
    }
}

//
//  ContentView.swift
//  BattleX
//
//  Created by Dav Yaginuma on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameState : GameState
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    HStack {
                        Image("hedgehog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100)
                            
                        Spacer()
                        Image("mouse")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100)
                    }
                    VStack {
                        Text("BattleX")
                            .font(Font.title)
                            .padding()

                        Spacer()
                        NavigationLink(destination: GameView()) {
                            Text("Play sharing device")
                        }
                        Spacer()
                        NavigationLink(destination: GameView()) {
                            Text("Play vs another device")
                        }
                        .disabled(true) // TODO: GameKit implementation
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}

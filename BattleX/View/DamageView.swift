//
//  DamageView.swift
//  BattleX
//
//  Created by Dav Yaginuma on 3/5/22.
//

import SwiftUI

struct DamageView : View {
    @EnvironmentObject var gameState : GameState
    var isPlayerOne : Bool
    
    var body : some View {
        VStack {
            Text("Damage")
                .foregroundColor(Color.black)
            ProgressView(value: gameState.playerDamagePercent(isPlayerOne: isPlayerOne))
                .accentColor(Color.red)
        }
    }
}

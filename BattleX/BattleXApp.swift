//
//  BattleXApp.swift
//  BattleX
//
//  Created by Dav Yaginuma on 3/4/22.
//

import SwiftUI

@main
struct BattleXApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GameState())
        }
    }
}

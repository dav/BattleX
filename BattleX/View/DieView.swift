import SwiftUI

struct DieView : View {
    @EnvironmentObject var gameState : GameState

    var body : some View {
        Text(gameState.currentDieFace)
            .foregroundColor(gameState.isRolling ? Color.red : Color.green)
            .fontWeight(.bold)
            .font(.system(size: 50))
    }
}

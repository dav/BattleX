import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState : GameState
    
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
                DieView()
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
                    Button("\(gameState.player1Active ? "Headgehog" : "Mouse") wins! Tap to Restart") {
                        gameState.reset()
                    }
                } else {
                    Button(gameState.player1Active ? "Hedgehog Roll" : "Mouse Roll") {
                            gameState.rollDie()
                    }
                    .foregroundColor(Color.black)
                    .tint(gameState.player1Active ? Color.blue : Color.orange)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .disabled(gameState.isRolling)
                }
                Spacer()
            }
            Spacer()
        }.background(Color.white)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}

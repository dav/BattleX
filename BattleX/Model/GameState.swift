import Foundation

@MainActor
class GameState : ObservableObject {
    var player1Active : Bool = true
    
    private var maxDamage : Int = 20
    @Published var player1Damage : Int = 0
    @Published var player2Damage : Int = 0
    @Published var currentDieFace : String = "?"
    @Published var player1Doubling = false
    @Published var player2Doubling = false
    @Published var isRolling = false
    @Published var isGameOver = false

    var player1DamagePercent : Float { get {
        player1Damage > 0 ? 0 : Float(maxDamage) / Float(player1Damage)
    }}
    
    var player2DamagePercent : Float { get {
        player2Damage > 0 ? 0 : Float(maxDamage) / Float(player2Damage)
    }}

    
    func rollDie() -> Void {
        isRolling = true
        let stepValue = 0.1
        for step in 1..<10 {
            let nanoSeconds = Double(step) * stepValue
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(nanoSeconds)) {
                let value = Int.random(in: 1..<7)
                print("face=\(value)")
                self.currentDieFace = String(value)
            }
        }
        
        let nanoSeconds = 10 * stepValue
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(nanoSeconds)) {
            let value = Int.random(in: 1..<7)
            print("Rolled \(value)")
            self.currentDieFace = String(value)
            self.isRolling = false
            self.handleRoll(value)
        }
    }
    
    func handleRoll(_ value: Int) {
        print("Handling roll of \(value)")
        var damage : Int
        let rolledFour = value == 4
        switch(value) {
            case 6:
                damage = 0
                fallthrough
            default:
                damage = value
        }
        
        if self.player1Active {
            if self.player1Doubling { damage *= 2 }
            self.player1Doubling = rolledFour
        } else {
            if self.player2Doubling { damage *= 2 }
            self.player2Doubling = rolledFour
        }
        inflictDamage(damage)
    }

    func inflictDamage(_ amount : Int) -> Void {
        if player1Active {
            player2Damage += amount
            if player2Damage >= maxDamage {
                player2Damage = maxDamage
                gameOver(playerOneWon: true)
                return
            }
        } else {
            player1Damage += amount
            if player1Damage >= maxDamage {
                player1Damage = maxDamage
                gameOver(playerOneWon: false)
                return
            }
        }
        
        print("p1: \(player1Damage) vs p2: \(player2Damage)")
        
        player1Active.toggle()
    }
    
    func gameOver(playerOneWon: Bool) -> Void {
        player1Active = playerOneWon
        isGameOver = true
    }
    
    func reset() -> Void {
        player1Damage = 0
        player2Damage = 0
        isGameOver = false
    }
    
    func playerDamagePercent(isPlayerOne: Bool) -> Double {
        let damage = isPlayerOne ? player1Damage : player2Damage
        return Double(damage) / Double(maxDamage)
    }
}

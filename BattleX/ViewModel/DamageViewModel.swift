import SwiftUI

class DamageViewModel : ObservableObject {
    @Published public var percentDamaged: Float = 0
    
    private var player : Int
    private var max : Int
    private var currentDamage : Int = 0

    init(player: Int, max: Int){
        self.player = player
        self.max = max
    }

    func inflictDamage(_ amount: Int) -> Void {
        currentDamage += amount
        percentDamaged = Float(currentDamage) / Float(max)
    }
}

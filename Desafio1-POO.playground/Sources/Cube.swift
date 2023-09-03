import Foundation

public class Cube: Shape {
    
    public let amountSide: UInt8 = 6
    public let sideSize: Float
    private let play: ((UInt8) -> Void)
    
    public init(sideSize: Float, play: @escaping ((UInt8) -> Void)) {
        self.sideSize = sideSize
        self.play = play
    }
    
    public func playCube() {
        play(UInt8(Int.random(in: 1...6)))
    }
}

import Foundation

public struct Square: Shape, AreaCalculable, Codable {
    public var amountSide: UInt8 = 4
    public let size: Double
    
    public func calculateArea() -> Double {
        return Double(size * size)
    }
    
    public init(size: Double) {
        self.size = size
    }
}

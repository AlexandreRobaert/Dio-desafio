import Foundation

public protocol Shape {
    var amountSide: UInt8 { get }
}

public protocol AreaCalculable {
    func calculateArea() -> Double
}

import Foundation

public enum TipoAnimal: String, Codable {
    case terrestre
    case aquatico
    case aereo
    case anfibio
}

public struct Size: Codable {
    public let largura: Float
    public let altura: Float
    
    public init(largura: Float, altura: Float) {
        self.largura = largura
        self.altura = altura
    }
}

open class Animal: Codable {
    
    let nome: String
    let tamanho: Size
    let tipo: TipoAnimal
    let som: String?
    
    public init(nome: String, tamanho: Size, tipo: TipoAnimal, som: String?) {
        self.nome = nome
        self.tamanho = tamanho
        self.tipo = tipo
        self.som = som
    }
    
    open func fazerBarulho() {
        if let som {
            print(som)
        } else {
            print("O animal não faz barulho!")
        }
    }
}

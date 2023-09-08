import Foundation

public class Ave: Animal {
    
    public let podeVoar: Bool
    
    public init(nome: String, tamanho: Size, tipo: TipoAnimal, som: String?, podeVoar: Bool) {
        self.podeVoar = podeVoar
        super.init(nome: nome, tamanho: tamanho, tipo: tipo, som: som)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

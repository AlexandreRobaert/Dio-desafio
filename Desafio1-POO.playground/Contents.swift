import UIKit
import Foundation

class Main {
    
    var animais: [Animal] = []
    
    func fetchAnimais() async throws {
        animais = try await JsonReader.fetch(file: "animais")
    }
    
    func fazerBarulhos() {
        let galinha: Galinha = .init(nome: "Galinha", tamanho: Size(largura: 0.3, altura: 0.3), tipo: .terrestre, som: "Cócó", podeVoar: false)
        let elefante = Elefante(nome: "Elefante", tamanho: Size(largura: 5.3, altura: 5.8), tipo: .terrestre, som: "Som de Elefante")
        animais.append(contentsOf: [galinha, elefante])
        self.animais.forEach {
            switch $0 {
            case let ave as Ave:
                print("Pode Voar: \(ave.podeVoar)")
                if let galinha = ave as? Galinha {
                    galinha.botarOvos()
                }
            case let elefante as Elefante:
                elefante.fazerBarulho()
            default:
                $0.fazerBarulho()
            }
        }
    }
}

let main = Main()

Task {
    
    do {
        try await main.fetchAnimais()
        main.fazerBarulhos()
    } catch {
        print("Ops! Houve um erro")
    }
}

import UIKit

class Integrator {
    var shapes: [Shape] = []
    
    func getSquare() async throws -> [Square] {
        let squares: [Square] = try await JsonReader.fetch(file: "squares")
        self.shapes = squares
        return squares
    }
    
    func addCubes(_ cubes: [Cube]) {
        shapes.append(contentsOf: cubes)
    }
}

class Main {
    let integrator: Integrator
    
    init(integrator: Integrator) {
        self.integrator = integrator
    }
    
    public func start() {
        Task {
            do {
                try await integrator.getSquare()
                self.getMinorSquareAndShow()
                self.addCubesInIntegrator()
                self.callPlayCubes()
            } catch FetchError.notFound {
                print("Arquivo JSON não encontrado")
            } catch FetchError.parseError {
                print("JSON inválido")
            } catch {
                print("Sem dados")
            }
        }
    }
    
    private func getMinorSquareAndShow() {
        var squareCurrent: Square = .init(size: Double.infinity)
        integrator.shapes.forEach { shape in
            if let square = shape as? Square {
                if squareCurrent.size > square.size {
                    squareCurrent = square
                }
                print("Quadrado de \(square.size) X \(square.size)")
            }
        }
        print("O menor Quadrado tem \(squareCurrent.size) X \(squareCurrent.size) com \(squareCurrent.calculateArea()) M²")
    }
    
    private func addCubesInIntegrator() {
        var cubes: [Cube] = []
        for i in 1...10 {
            cubes.append(.init(sideSize: Float(i) + 1.3, play: { sortedSide in
                print("O lado sorteado no cubo \(i) foi -> \(sortedSide)")
            }))
        }
        integrator.addCubes(cubes)
    }
    
    private func callPlayCubes() {
        integrator.shapes.forEach { shape in
            if let cube = shape as? Cube {
                cube.playCube()
            }
        }
    }
}

Main(integrator: Integrator()).start()

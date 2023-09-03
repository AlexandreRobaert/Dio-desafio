import Foundation

public enum FetchError: Error {
    case notFound
    case parseError
    case invalidData
}

public enum JsonReader {
    public static func fetch<T: Codable>(file name: String) async throws -> T {
        guard let path = Bundle.main.path(forResource: name, ofType: "json") else {
            throw FetchError.notFound
        }
        guard let data = path.data(using: .utf8) else {
            throw FetchError.invalidData
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print((error as CustomDebugStringConvertible).debugDescription)
            throw FetchError.parseError
        }
    }
}

import Foundation

public enum FetchError: Error {
    case notFound
    case parseError
    case invalidData
}

public enum JsonReader {
    public static func fetch<T: Codable>(file name: String) async throws -> T {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            throw FetchError.notFound
        }
        guard let data = try? Data(contentsOf: url) else {
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

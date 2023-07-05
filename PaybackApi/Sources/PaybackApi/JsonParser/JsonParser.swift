import Foundation

protocol JsonParser {
    func decode<T: Codable>(data: Data?, type: T.Type) -> T?
}

struct JsonParserImplementation: JsonParser {
    func decode<T: Codable>(data: Data?, type: T.Type) -> T? {
        guard let data else { return nil }
        do {
            let decoder = JSONDecoder()
            let event = try? decoder.decode(type, from: data)
            return event
        }
    }
}

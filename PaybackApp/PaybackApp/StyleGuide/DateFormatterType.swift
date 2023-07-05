import Foundation

struct DateFormatterType {
    let formatter: DateFormatter
    init(format: String) {
        formatter = DateFormatter(format: format)
    }
    
    static let list = DateFormatterType(format: "dd.MM.yyyy")
    static let dateFull = DateFormatterType(format: "yyyy-MM-dd'T'HH:mm:ssZ")
}

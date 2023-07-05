import Foundation

// MARK: - Date to String
extension Date {
    func toString(_ type: DateFormatterType) -> String {
        type.formatter.string(from: self)
    }
}

// MARK: - String to Date
extension String {
    func toDate(_ type: DateFormatterType) -> Date? {
        type.formatter.date(from: self)
    }
}

// MARK: - DateFormatter for handling types
extension DateFormatter {
    convenience init(format: String) {
        self.init()
        self.dateFormat = format
    }
}

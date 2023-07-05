import Foundation

public struct ApiError: Error {
    public let error: String
    public let statusCode: Int?
}

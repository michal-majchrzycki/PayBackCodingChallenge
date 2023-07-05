import Foundation

public protocol PaybackApi {
    func fetchData() async -> Result<Transactions?, ApiError>?
}

@available(iOS 13.0, *)
public struct PaybackApiImplementation: PaybackApi {
    private let api: ApiClient
    
    public func fetchData() async -> Result<Transactions?, ApiError>? {
        await api.fetchData()
    }
    
    public init() {
        api = ApiClientIMPL(parser: JsonParserImplementation())
    }
}

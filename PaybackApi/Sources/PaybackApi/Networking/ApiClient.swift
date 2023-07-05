import Foundation

protocol ApiClient {
    var parser: JsonParser { get }
    func fetchData() async -> Result<Transactions?, ApiError>
}

@available(iOS 13.0, *)
struct ApiClientIMPL: ApiClient {
    let parser: JsonParser
    
    public func fetchData() async -> Result<Transactions?, ApiError> {
#warning("TODO: This is only mocked data")
        return await mockFetchData()
    }
}

// MARK: - fetchTransactions Mock
@available(iOS 13.0, *)
extension ApiClientIMPL {
    private func mockFetchData() async -> Result<Transactions?, ApiError> {
        let data = await getMockJsonData()
        let randomTime = UInt32.random(in: 0..<5)
        return await withUnsafeContinuation({ continuation in
            if Int.random(in: 0...10) < 3 {
                continuation.resume(returning: .failure(ApiError(error: "Not Found", statusCode: 404)))
            } else {
                sleep(randomTime)
                continuation.resume(returning: .success(parser.decode(data: data, type: Transactions.self)))
            }
        })
    }
    
    private func getMockJsonData() async -> Data? {
        guard let path = Bundle.module.path(forResource: "PBTransactions", ofType: ".json") else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            // TODO: Handle errors
        }
        return nil
    }
}

// MARK: - Transactions
public struct Transactions: Codable {
    public let items: [Item]?
}

// MARK: - Item
public struct Item: Codable {
    public let partnerDisplayName: String?
    public let alias: Alias?
    public let category: Int?
    public let transactionDetail: TransactionDetail?
}

// MARK: - Alias
public struct Alias: Codable {
    public let reference: String?
}

// MARK: - TransactionDetail
public struct TransactionDetail: Codable {
    public let description: String?
    public let bookingDate: String?
    public let value: Value?
}

// MARK: - Value
public struct Value: Codable {
    public let amount: Int?
    public let currency: String?
}

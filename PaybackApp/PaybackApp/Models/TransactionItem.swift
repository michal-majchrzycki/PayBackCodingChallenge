import Foundation

struct TransactionItem: Identifiable {
    let id = UUID()
    let date: String?
    let name: String?
    let description: String?
    let amount: String?
    let currency: String?
    let category: String?
}

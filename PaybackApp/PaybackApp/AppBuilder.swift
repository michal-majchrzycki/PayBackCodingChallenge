import SwiftUI

struct AppBuilder {
    func buildList() -> some View {
        ListBuilder().buildList()
    }
    
    func buildDetails(for transaction: TransactionItem?) -> some View {
        DetailBuilder().buildDetail(for: transaction)
    }
}

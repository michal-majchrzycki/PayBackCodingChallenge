import SwiftUI

struct DetailBuilder {
    @ViewBuilder
    func buildDetail(for transaction: TransactionItem?) -> some View {
        if let transaction {
            let viewModel = DetailViewModelImplementation(transaction: transaction)
            let router = DetailRouterImplementation()
            DetailView(router: router, viewModel: viewModel)
        } else {
            ErrorView(message: "DetailBuilder.NoTransactions.error".localized)
        }
    }
}


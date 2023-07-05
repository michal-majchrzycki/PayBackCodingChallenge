import SwiftUI

protocol ListRouter: ObservableObject {
    associatedtype someView: View

    func showLoading() -> LoadingView
    func showError(_ error: String) -> ErrorView
    func showDetail(for transaction: TransactionItem?) -> someView
}

final class ListRouterImplementation: ListRouter {
    func showLoading() -> LoadingView {
        LoadingView()
    }
    
    func showError(_ error: String) -> ErrorView {
        ErrorView(message: error)
    }

    func showDetail(for transaction: TransactionItem?) -> some View {
        AppBuilder().buildDetails(for: transaction)
    }
}

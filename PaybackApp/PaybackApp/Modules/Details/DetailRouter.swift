import SwiftUI

protocol DetailRouter: ObservableObject {
    func showLoading() -> LoadingView
    func showError(_ error: String) -> ErrorView
}

final class DetailRouterImplementation: DetailRouter {
    func showLoading() -> LoadingView {
        LoadingView()
    }
    
    func showError(_ error: String) -> ErrorView {
        ErrorView(message: error)
    }
}

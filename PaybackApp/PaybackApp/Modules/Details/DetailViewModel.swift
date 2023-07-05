import Foundation

enum DetailViewState {
    case loading
    case error(_ message: String)
    case loaded(_ data: TransactionItem)
}

protocol DetailViewModel: ObservableObject {
    var transaction: TransactionItem { get }
    var state: DetailViewState { get }
}

final class DetailViewModelImplementation: DetailViewModel {
    let transaction: TransactionItem
    @Published var state: DetailViewState = .loading
    
    init(transaction: TransactionItem) {
        self.transaction = transaction
        state = .loaded(transaction)
    }
}

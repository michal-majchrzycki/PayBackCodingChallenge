import Foundation
import PaybackApi
import SwiftUI

enum ListViewState {
    case loading
    case error(_ message: String)
    case loaded(_ data: [TransactionItem])
}

protocol ListViewModel: ObservableObject {
    var worker: TransactionItemWorker { get }
    var network: any NetworkWorker { get }
    var state: ListViewState { get }
    var valueAmountSum: String { get }
    func onApperar()
    func didTapNavigationButton()
    func didPullToRefresh()
}

final class ListViewModelImplementation: ListViewModel {
    let worker: TransactionItemWorker
    @State var network: any NetworkWorker
    @Published var state: ListViewState = .loading
    @Published var valueAmountSum: String = ""
    
    private var items: [Item]?
    
    init(worker: TransactionItemWorker, state: ListViewState, network: any NetworkWorker) {
        self.worker = worker
        self.state = state
        self.network = network
    }
    
    func onApperar() {
        monitorNetwork()
        fetchData()
    }
    
    private func monitorNetwork() {
        if !network.isConnected {
            state = .error("ListViewModel.noInternet.text".localized)
        }
    }
}

// MARK: - Handle Fetch Data
extension ListViewModelImplementation {
    private func fetchData() {
        Task {
            let result = await PaybackApiImplementation().fetchData()
            DispatchQueue.main.async {
                switch result {
                case .success(let transactions):
                    self.handleFetchDataSuccess(transactions)
                case .failure(let apiError):
                    self.handleFetchDataError(apiError)
                case .none:
                    break
                }
            }
        }
    }
    
    private func handleFetchDataSuccess(_ transactions: Transactions?) {
        guard let items = transactions?.items else { return }
        self.items = items
        self.state = .loaded(items.map { self.worker.mapItem($0) })
        self.getSumOfValueAmount()
    }
    
    private func getSumOfValueAmount() {
        let valueAmountCount = items?.map { item in
            item.transactionDetail?.value?.amount ?? 0
        }
        if let sum = valueAmountCount?.reduce(0, +) {
            self.valueAmountSum = "\(sum)"
        }
    }
    
    private func handleFetchDataError(_ error: ApiError) {
        self.state = .error(error.error + ", " + "\(error.statusCode ?? 0)")
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
            self.state = .loaded([])
        }
    }
}

// MARK: - User Actions
extension ListViewModelImplementation {
    func didTapNavigationButton() {
        items?.sort { $0.category ?? 0 < $1.category ?? 0 }
        let transactions = items?.map { self.worker.mapItem($0) }
        guard let transactions else { return }
        self.state = .loaded(transactions)
    }
    
    func didPullToRefresh() {
        state = .loading
        fetchData()
    }
}

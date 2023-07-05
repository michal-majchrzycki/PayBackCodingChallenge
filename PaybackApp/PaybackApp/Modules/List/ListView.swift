import SwiftUI

struct ListView<ViewModel, Router>: View where ViewModel: ListViewModel, Router: ListRouter {
    @StateObject var router: Router
    @StateObject var viewModel: ViewModel
    @State var pickedTransation: TransactionItem?
    
    var trans: [TransactionItem] = []
    
    var body: some View {
        setupUI()
    }
}

// MARK: - Setup UI
extension ListView {
    private func setupUI() -> some View {
        NavigationStack {
            switch viewModel.state {
            case .loading:
                router.showLoading()
            case .error(let error):
                router.showError(error)
            case .loaded(let data):
                VStack {
                    if data.isEmpty {
                        Text("ListView.PullToRefresh".localized)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    NavigationLink(destination: router.showDetail(for: pickedTransation)) {
                        ListCollectionView(transactions: data, picked: $pickedTransation)
                            .refreshable {
                                viewModel.didPullToRefresh()
                            }
                    }
                    .toolbar {
                        Text("ListView.SumTitle".localized + viewModel.valueAmountSum)
                        Button(action: {
                            viewModel.didTapNavigationButton()
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                    }
                }
                
            }
        }
        .onAppear {
            viewModel.onApperar()
        }
    }
}

//MARK: - Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(router: ListRouterImplementation(), viewModel: ListViewModelImplementation(worker: TransactionItemWorkerImplementation(), state: .loading, network: NetworkWorkerImplementation()))
    }
}


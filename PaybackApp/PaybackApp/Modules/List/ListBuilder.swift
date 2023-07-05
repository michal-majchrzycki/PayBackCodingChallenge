import SwiftUI

struct ListBuilder {
    func buildList() -> some View {
        let worker = TransactionItemWorkerImplementation()
        let viewModel = ListViewModelImplementation(worker: worker, state: .loading, network: NetworkWorkerImplementation())
        let router = ListRouterImplementation()
        let view = ListView(router: router, viewModel: viewModel)
        
        return view
    }
}

import SwiftUI

struct DetailView<ViewModel, Router>: View where ViewModel: DetailViewModel, Router: DetailRouter {
    @StateObject var router: Router
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            router.showLoading()
        case .error(let error):
            router.showError(error)
        case .loaded(let data):
            DetailTransactionView(transaction: data)
        }
    }
}

//MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTransaction = TransactionItem(date: "date", name: "name", description: "description", amount: "amount", currency: "currency", category: "category")
        DetailView(router: DetailRouterImplementation(), viewModel: DetailViewModelImplementation(transaction: mockTransaction))
    }
}

import SwiftUI

struct ListCollectionView: View {
    let transactions: [TransactionItem]
    @Binding var picked: TransactionItem?
    
    var body: some View {
        setupUI()
    }
}

// MARK: - Setup UI
extension ListCollectionView {
    private func setupUI() -> some View {
        List {
            ForEach(transactions) { transaction in
                ListCollectionItem(transaction: transaction)
                    .onTapGesture {
                        self.picked = transaction
                    }
            }
        }
        .navigationTitle("ListCollectionView.navigationTitle".localized)
    }
}

//MARK: - Preview
struct ListCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var picked: TransactionItem?
        ListCollectionView(transactions: [], picked: $picked)
    }
}

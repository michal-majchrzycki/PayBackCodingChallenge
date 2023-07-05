import SwiftUI

struct DetailTransactionView: View {
    let transaction: TransactionItem
    
    private enum Constants {
        static let topPadding: CGFloat = 40.0
    }
    
    var body: some View {
        setupUI()
    }
}

// MARK: - Setup UI
extension DetailTransactionView {
    private func setupUI() -> some View {
        VStack {
            ZStack {
                BasicRectangle(color: .white, shadow: true)
                VStack {
                    let na = "General.notAvailable".localized
                    Text("DetailTransactionView.Label.Partner".localized)
                        .foregroundColor(.orange)
                        .font(.headline)
                    Text(transaction.name ?? na)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                    Text("DetailTransactionView.Label.Description".localized)
                        .foregroundColor(.orange)
                        .font(.headline)
                    Text(transaction.description ?? na)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }
                .padding()
                .navigationBarTitle("DetailTransactionView.Label.Details".localized)
            }
        }
        .padding(.top, Constants.topPadding)
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity, alignment: .top)
    }
}

//MARK: - Preview
struct DetailTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTransaction = TransactionItem(date: "date", name: "name", description: "description", amount: "amount", currency: "currency", category: "category")
        DetailTransactionView(transaction: mockTransaction)
    }
}

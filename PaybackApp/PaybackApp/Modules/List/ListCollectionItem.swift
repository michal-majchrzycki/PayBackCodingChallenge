import SwiftUI

struct ListCollectionItem: View {
    let transaction: TransactionItem
    
    private enum Constants {
        static let padding: CGFloat = 18.0
        static let chevronSize: CGSize = CGSize(width: 25.0, height: 25.0)
        static let shadowRadius: CGFloat = 4.0
        static let shadowAxis: CGPoint = CGPoint(x: 0.0, y: 2.0)
        static let cornerRadius: CGFloat = 10.0
    }
    
    var body: some View {
        setupUI()
    }
}

//MARK: - Setup UI
extension ListCollectionItem {
    func setupUI() -> some View {
        HStack {
            VStack(alignment: .leading) {
                let na = "General.notAvailable".localized
                Text(transaction.date ?? na)
                    .font(.subheadline)
                    .foregroundColor(.orange)
                Text(transaction.name ?? na)
                    .foregroundColor(.black)
                    .font(.headline)
                Text(transaction.description ?? na)
                    .foregroundColor(.gray)
                    .font(.headline)
                HStack {
                    Text(transaction.amount ?? na)
                        .font(.subheadline)
                        .foregroundColor(.orange)
                    Text(transaction.currency ?? na)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                    Text("ListCollectionItem.CategoryTitle".localized + (transaction.category ?? na))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding(Constants.padding)
            
            Spacer()
            Image(systemName: "chevron.right.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: Constants.chevronSize.width, height: Constants.chevronSize.height)
                .clipped()
                .padding(Constants.padding)
                .foregroundColor(.blue)
        }
        .background(Color.white)
        .cornerRadius(Constants.cornerRadius)
        .shadow(color: .gray, radius: Constants.shadowRadius, x: Constants.shadowAxis.x, y: Constants.shadowAxis.y)
    }
}

//MARK: - Preview
struct ListCollectionItem_Previews: PreviewProvider {
    static var previews: some View {
        let mockTransaction = TransactionItem(date: "date", name: "name", description: "description", amount: "amount", currency: "currency", category: "category")
        ListCollectionItem(transaction: mockTransaction)
    }
}

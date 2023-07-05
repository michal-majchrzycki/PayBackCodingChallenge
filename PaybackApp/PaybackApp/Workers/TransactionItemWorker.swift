import Foundation
import PaybackApi

protocol TransactionItemWorker {
    func mapItem(_ item: Item) -> TransactionItem
}

struct TransactionItemWorkerImplementation: TransactionItemWorker {
    func mapItem(_ item: Item) -> TransactionItem {
        let dateFromString = item.transactionDetail?.bookingDate?.toDate(.dateFull)
        let stringDate = dateFromString?.toString(.list)
        
        return TransactionItem(
            date: stringDate,
            name: item.partnerDisplayName,
            description: item.transactionDetail?.description,
            amount: "\(item.transactionDetail?.value?.amount ?? 0)",
            currency: item.transactionDetail?.value?.currency,
            category: "\(item.category ?? 0)")
    }
}

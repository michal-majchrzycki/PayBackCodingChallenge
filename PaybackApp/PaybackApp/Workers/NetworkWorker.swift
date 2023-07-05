import Foundation
import Network

protocol NetworkWorker: ObservableObject {
    var isConnected: Bool { get }
}

final class NetworkWorkerImplementation: NetworkWorker {
    private let monitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "NetworkWorker")
    var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        monitor.start(queue: workerQueue)
    }
}

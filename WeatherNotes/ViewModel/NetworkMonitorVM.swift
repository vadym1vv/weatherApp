//
//  NetworkMonitorVM.swift
//  WeatherNotes
//
//  Created by Vadym Vasylaki on 07.12.2025.
//

import Foundation
import Network

final class NetworkMonitorVM: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected: Bool = true
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    func checkConnectionWithPing(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "https://www.google.com") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 5.0
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            DispatchQueue.main.async {
                if let error = error {
#if DEBUG
                    print("Ping failed with error: \(error.localizedDescription)")
#endif
                    completion(false)
                } else if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }.resume()
    }
    
    deinit {
        monitor.cancel()
    }
}

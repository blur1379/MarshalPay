//
//  NetworkManeger.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import Foundation
import Network
class NetworkManeger : ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManeger")
    @Published var isConnected = true
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}

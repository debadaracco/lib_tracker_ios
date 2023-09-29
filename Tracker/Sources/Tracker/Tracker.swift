import Foundation

public protocol TrackerStrategy {
    func track(_ event: String, _ parameters: [String: Any])
}

public class TrackerHelper {
    public static let shared = TrackerHelper()
    
    private var clients: [TrackerStrategy] = [TrackerStrategy]()
    
    private init(){}
    
    public func set(_ clients: [TrackerStrategy]) {
        self.clients.append(contentsOf: clients)
    }
    
    public func track(_ event: String, _ parameters: [String: Any]) {
        self.clients.forEach { strategy in
            strategy.track(event, parameters)
        }
    }
}

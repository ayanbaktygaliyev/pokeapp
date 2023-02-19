import SwiftUI

public class Router<Route: Equatable>: ObservableObject {
    private let logger: Logger
    private(set) var routes: [Route] = []
    
    var onPush: ((Route) -> Void)?
    var onPopLast: ((Int, Bool) -> Void)?

    public init(initial: Route? = nil, debug: Bool = false) {
        logger = debug ? DebugLog() : EmptyLog()
        logger.log("Router initialized.")

        if let initial = initial {
            push(initial)
        }
    }

    public func push(_ route: Route) {
        logger.log("Router - pushing \(route) route.")
        routes.append(route)
        onPush?(route)
    }

    public func pop(animated: Bool = true) {
        if !routes.isEmpty {
            let popped = routes.removeLast()
            logger.log("Router - \(popped) route popped.")
            onPopLast?(1, animated)
        }
    }

    public func popTo(_ route: Route, inclusive: Bool = false, animated: Bool = true) {
        logger.log("Router: popping route \(route).")

        if routes.isEmpty {
            logger.log("Router - path is empty.")
            return
        }

        guard var found = routes.lastIndex(where: { $0 == route }) else {
            logger.log("Router - route not found.")
            return
        }

        if !inclusive {
            found += 1
        }

        let numToPop = (found..<routes.endIndex).count
        logger.log("Router - popping \(numToPop) routes")
        // Don't remove the destination route from routes
        // Since next pop won't work
        routes.removeLast(numToPop - 1)
        onPopLast?(numToPop, animated)
    }
    
    public func onSystemPop() {
        if !routes.isEmpty {
            let popped = routes.removeLast()
            logger.log("Router - \(popped) route popped by system")
        }
    }
}

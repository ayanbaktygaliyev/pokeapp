import SwiftUI

struct NavigationControllerHost<Route: Equatable, Screen: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    
    private let navTitle: String
    private let navHidden: Bool
    private let router: Router<Route>
    
    @ViewBuilder
    private var routeMap: (Route) -> Screen
    
    public init(
        navTitle: String,
        navHidden: Bool,
        router: Router<Route>,
        routeMap: @escaping (Route) -> Screen
    ) {
        self.navTitle = navTitle
        self.navHidden = navHidden
        self.router = router
        self.routeMap = routeMap
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let navigation = PopUINavigationController()
        navigation.isNavigationBarHidden = navHidden
        navigation.popHandler = { router.onSystemPop() }
        
        for path in router.routes {
            let controller = UIHostingController(rootView: routeMap(path))
            navigation.pushViewController(controller, animated: true)
        }
        
        router.onPush = { route in
            let controller = UIHostingController(rootView: routeMap(route))
            navigation.pushViewController(controller, animated: true)
        }
        
        router.onPopLast = { numToPop, animated in
            let navigationStackCount = navigation.viewControllers.count
            
            if numToPop == navigationStackCount {
                navigation.viewControllers = []
            } else {
                let popTo = navigation.viewControllers[navigationStackCount - numToPop - 1]
                navigation.popToViewController(popTo, animated: animated)
            }
        }
        
        router.onPresent = { controller, completion in
            controller.view.backgroundColor = .clear
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .overFullScreen
            controller.accessibilityViewIsModal = true
            navigation.present(controller, animated: true, completion: completion)
        }
                        
        return navigation
    }
    
    func updateUIViewController(_ navigation: UINavigationController, context: Context) {
        navigation.topViewController?.navigationItem.title = navTitle
        navigation.navigationBar.isHidden = navHidden
    }
    
    static func dismantleUIViewController(_ navigation: UINavigationController, coordinator: ()) {
        navigation.viewControllers = []
        guard let navigation = navigation as? PopUINavigationController else {
            return
        }
        navigation.popHandler = nil
    }
}

private class PopUINavigationController: UINavigationController, UINavigationControllerDelegate {
    var popHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer?.isEnabled = false
        isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true, animated: animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        if let coordinator = viewController.transitionCoordinator,
//           let dismissedViewController = coordinator.viewController(forKey: .from),
//           !navigationController.viewControllers.contains(dismissedViewController) {
//                self.popHandler?()
//        }
    }
}

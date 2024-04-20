//
//  MainTabController.swift
//  ShimmerLearn
//
//  Created by SAHIL AMRUT AGASHE on 20/04/24.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let demoController = UINavigationController(rootViewController: DemoController())
        demoController.tabBarItem.title = "Demo"
        
        let viewController = UINavigationController(rootViewController: ViewController())
        viewController.tabBarItem.title = "Practical"
        
        viewControllers = [viewController, demoController]
    }
}

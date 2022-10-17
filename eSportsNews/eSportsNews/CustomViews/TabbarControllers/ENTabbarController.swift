//
//  ENTabbarController.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//


import UIKit

class ENTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createMainNC(), createEventsVC()]
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = Color.backgroundColor
    }
    
    func createMainNC() -> UINavigationController {
        let mainVC = MainVC()
        mainVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    func createEventsVC() -> UINavigationController {
        let eventsVC = EventsVC()
        eventsVC.title = "Explore"
        eventsVC.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "location.circle"), tag: 1)
        
        return UINavigationController(rootViewController: eventsVC)
    }
}

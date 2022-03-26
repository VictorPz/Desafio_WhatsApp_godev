//
//  ViewController.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 25/03/22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    let callsTableView = CallsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.backgroundColor = #colorLiteral(red: 0.9647058845, green: 0.9647058845, blue: 0.9647058845, alpha: 1)
        tabBar.tintColor = .label
        setupViewControllers()
    }
    
    private func tabBarNavController(for rootViewController: UIViewController, title: String,
                                     navigationTitle: String,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = navigationTitle
        return navController
    }
    
    func setupViewControllers() {
          viewControllers = [
              tabBarNavController(for: StatusViewController(), title: "Status", navigationTitle: "Status", image: UIImage(systemName: "circle.dashed")!),
              tabBarNavController(for: CallsViewController(), title: "Calls", navigationTitle: "Calls", image: UIImage(systemName: "phone")!),
              tabBarNavController(for: CameraViewController(), title: "Camera", navigationTitle: "Camera", image: UIImage(systemName: "camera")!),
              tabBarNavController(for: ChatsViewController(), title: "Chats", navigationTitle: "Conversas", image: UIImage(systemName: "message")!),
              tabBarNavController(for: SettingsViewController(), title: "Settings", navigationTitle: "Settings", image: UIImage(systemName: "gear")!)
          ]
      }
}


//
//  MainTabBarController.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/22.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private var homeViewController = ViewControllerFactory.viewController(for: .home) {
        didSet {
            homeViewController.tabBarItem = setTabBarItem(image: ImageLiteral.iconHome, selectedImage: ImageLiteral.iconHomeSelected)
        }
    }
    private var searchViewController = ViewControllerFactory.viewController(for: .search) {
        didSet {
            searchViewController.tabBarItem = setTabBarItem(image: ImageLiteral.iconSearch, selectedImage: ImageLiteral.iconSearchSelected)
        }
    }
    private var reelsViewController = ViewControllerFactory.viewController(for: .reels) {
        didSet {
            reelsViewController.tabBarItem = setTabBarItem(image: ImageLiteral.iconReels, selectedImage: ImageLiteral.iconReelsSelected)
        }
    }
    private var shopViewController = ViewControllerFactory.viewController(for: .shop) {
        didSet {
            shopViewController.tabBarItem = setTabBarItem(image: ImageLiteral.iconShop, selectedImage: ImageLiteral.iconShopSelected)
        }
    }
    private var myPageViewController = ViewControllerFactory.viewController(for: .myPage) {
        didSet {
            myPageViewController.tabBarItem = setTabBarItem(image: ImageLiteral.iconProfile, selectedImage: ImageLiteral.iconProfileSelected)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers = [homeViewController, searchViewController, reelsViewController, shopViewController, myPageViewController]
        setViewControllers(viewControllers, animated: true)
    }
    
    private func setTabBarItem(image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        return tabBarItem
    }
}

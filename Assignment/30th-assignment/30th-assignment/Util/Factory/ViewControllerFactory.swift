//
//  ViewControllerFactory.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import UIKit

enum TypeOfViewController {
    case greeting
    case home
    case login
    case mainTab
    case myPage
    case reels
    case search
    case shop
    case signUp
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .greeting:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Greeting", storyboardId: "GreetingViewController")
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Home", storyboardId: "HomeViewController")
        case .login:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Login", storyboardId: "LoginViewController")
        case .mainTab:
            return StoryboardRepresentation(bundle: nil, storyboardName: "MainTabBar", storyboardId: "MainTabBarController")
        case .myPage:
            return StoryboardRepresentation(bundle: nil, storyboardName: "MyPage", storyboardId: "MyPageViewController")
        case .reels:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Reels", storyboardId: "ReelsViewController")
        case .search:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Search", storyboardId: "SearchViewController")
        case .shop:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Shop", storyboardId: "ShopViewController")
        case .signUp:
            return StoryboardRepresentation(bundle: nil, storyboardName: "SignUp", storyboardId: "SignUpViewController")
        }
    }
}

struct StoryboardRepresentation {
    let bundle: Bundle?
    let storyboardName: String
    let storyboardId: String
}

struct ViewControllerFactory {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let viewControllerMetadata = typeOfVC.storyboardRepresentation()
        let storyBoard = UIStoryboard(name: viewControllerMetadata.storyboardName, bundle: viewControllerMetadata.bundle)
        let viewController = storyBoard.instantiateViewController(withIdentifier: viewControllerMetadata.storyboardId)
        return viewController
    }
}

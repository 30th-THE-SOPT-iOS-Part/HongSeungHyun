//
//  ViewControllerFactory.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import UIKit

enum TypeOfViewController {
    case login
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .login:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Login", storyboardId: "LoginViewController")
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

//
//  LoginCoordinator.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import UIKit

enum Transition {
    case inputUsername
    case inputUserPassword
    case greeting
    case dismiss
}

final class LoginCoordinator: BaseCoordinator {
    override func start() {
        guard let loginViewController = ViewControllerFactory.viewController(for: .login) as? LoginViewController
        else { return }
        
        loginViewController.loginViewModel = LoginViewModel(coordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func performTransition(to transition: Transition, with signUpViewModel: SignUpViewModel? = nil) {
        switch transition {
        case .inputUsername:
            guard let signUpViewController = ViewControllerFactory.viewController(for: .signUp) as? SignUpViewController
            else { return }
            
            signUpViewController.signUpType = .inputUserName
            signUpViewController.signUpViewModel = SignUpViewModel(coordinator: self)
            self.navigationController.pushViewController(signUpViewController, animated: true)
            
        case .inputUserPassword:
            guard let signUpViewController = ViewControllerFactory.viewController(for: .signUp) as? SignUpViewController
            else { return }
            
            signUpViewController.signUpType = .inputUserPassword
            signUpViewController.signUpViewModel = signUpViewModel
            self.navigationController.pushViewController(signUpViewController, animated: true)
        case .greeting:
            guard let greetingViewController = ViewControllerFactory.viewController(for: .greeting) as? GreetingViewController
            else { return }
            
            greetingViewController.greetingViewModel = GreetingViewModel(coordinator: self)
            greetingViewController.modalPresentationStyle = .fullScreen
            self.navigationController.present(greetingViewController, animated: true)
        case .dismiss:
            self.navigationController.popToRootViewController(animated: true)
            self.navigationController.dismiss(animated: true)
        }
    }
}

//
//  SignUpViewModel.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import Foundation

final class SignUpViewModel {
    struct Input {
        var userInfo: String?
    }
    
    var input: Input = Input()
    weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func nextButtonDidTap(for signUpViewControllerType: SignUpViewController.SignUpViewControllerType) {
        switch signUpViewControllerType {
        case .inputUserName:
            UserInfo.shared.userId = self.input.userInfo
            self.coordinator?.performTransition(to: .inputUserPassword)
        case .inputUserPassword:
            UserInfo.shared.userPassword =  self.input.userInfo
            self.coordinator?.performTransition(to: .greeting)
        }
    }
}

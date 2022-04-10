//
//  SignUpViewModel.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import Foundation

struct SignUpViewModel {
    struct Input {
        var userInfo: String?
    }
    
    var input: Input = Input()
    weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    mutating func nextButtonDidTap(for signUpViewControllerType: SignUpViewControllerType) {
        switch signUpViewControllerType {
        case .inputUserName:
            UserInfo.shared.userId = self.input.userInfo
            self.coordinator?.performTransition(to: .inputUserPassword, with: self)
        case .inputUserPassword:
            UserInfo.shared.userPassword =  self.input.userInfo
            self.coordinator?.performTransition(to: .greeting)
        }
    }
}

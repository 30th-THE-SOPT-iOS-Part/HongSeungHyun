//
//  LoginViewModel.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import Foundation

final class LoginViewModel {
    struct Input {
        var userIdentifier: String?
        var userPassword: String?
    }
    
    var input: Input = Input()
    weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func loginButtonDidTap() {
        UserInfo.shared.userId = self.input.userIdentifier
        UserInfo.shared.userPassword = self.input.userPassword
        self.coordinator?.performTransition(to: .greeting)
    }
    
    func signUpButtonDidTap() {
        self.coordinator?.performTransition(to: .inputUsername)
    }
}

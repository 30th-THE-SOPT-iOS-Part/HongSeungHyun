//
//  GreetingViewModel.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import Foundation

struct GreetingViewModel {
    struct Output {
        @Observable var userIdentifier = ""
        @Observable var userPassword = ""
    }
    
    var output = Output()
    weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        if let userIdentifier = UserInfo.shared.userId {
            self.output.userIdentifier = userIdentifier
        }
    }
    
    func completeButtonDidTap() {
        self.coordinator?.performTransition(to: .dismiss)
    }
    
    func disposeObservable() {
        self.output.$userIdentifier.dispose()
    }
}

//
//  AppCoordinator.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/10.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    override func start() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        start(coordinator: coordinator)
    }
}

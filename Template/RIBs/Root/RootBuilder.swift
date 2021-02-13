//
//  RootBuilder.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    var networkService: NetworkServicing { get }
    var mutableUserStream: MutableUserStreaming { get }
}

final class RootComponent: Component<RootDependency> {

    let rootViewController: RootViewController
    
    var networkService: NetworkServicing {
        return dependency.networkService
    }
    
    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency,
                                      rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController, networkService: component.networkService)
        
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let loggedInBuilder = LoggedInBuilder(dependency: component)
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          loggedOutBuilder: loggedOutBuilder,
                          loggedInBuilder: loggedInBuilder)
    }
}

//
//  HomeBuilder.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol HomeDependency: Dependency {
    var userStream: UserStreaming { get }
}

final class HomeComponent: Component<HomeDependency> {
    var userStream: UserStreaming {
        return dependency.userStream
    }
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController, userStream: component.userStream)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}

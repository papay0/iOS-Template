//
//  LoggedInBuilder.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
    var mutableUserStream: MutableUserStreaming { get }
}

final class LoggedInComponent: Component<LoggedInDependency>, HomeDependency {

    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

    var userStream: UserStreaming {
        return dependency.mutableUserStream
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let interactor = LoggedInInteractor()
        interactor.listener = listener
        
        let homeBuilder = HomeBuilder(dependency: component)
        
        return LoggedInRouter(interactor: interactor,
                              viewController: component.loggedInViewController,
                              homeBuilder: homeBuilder)
    }
}

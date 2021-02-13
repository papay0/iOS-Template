//
//  RootRouter.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loggedOutBuilder: LoggedOutBuildable
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: - RootRouting
    
    func routeToLoggedOut() {
        let loggedOutRouter = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOutRouter
        attachChild(loggedOutRouter)
        viewController.present(viewController: loggedOutRouter.viewControllable)
    }
    
    // MARK: - Private
    
    private var loggedOutRouter: ViewableRouting?
}

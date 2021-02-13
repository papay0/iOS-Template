//
//  RootRouter.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: - RootRouting
    
    func routeToLoggedOut() {
        if let loggedOutRouter = self.loggedOutRouter {
            detachChild(loggedOutRouter)
            viewController.dismiss(viewController: loggedOutRouter.viewControllable)
            self.loggedInRouter = nil
        }
        
        let loggedOutRouter = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOutRouter
        attachChild(loggedOutRouter)
        viewController.present(viewController: loggedOutRouter.viewControllable)
    }
    
    func routeToLoggedIn() {
        if let loggedOutRouter = self.loggedOutRouter {
            detachChild(loggedOutRouter)
            viewController.dismiss(viewController: loggedOutRouter.viewControllable)
            self.loggedOutRouter = nil
        }

        let loggedInRouter = loggedInBuilder.build(withListener: interactor)
        attachChild(loggedInRouter)
    }
    
    // MARK: - Private
    
    private var loggedInRouter: LoggedInRouting?
    private var loggedOutRouter: LoggedOutRouting?
}

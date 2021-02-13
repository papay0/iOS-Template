//
//  LoggedInRouter.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, HomeListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable, animated: Bool)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    private let homeBuilder: HomeBuildable
    
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         homeBuilder: HomeBuildable) {
        self.viewController = viewController
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    func routeToHome() {
        let homeRouter = homeBuilder.build(withListener: interactor)
        self.homeRouter = homeRouter
        attachChild(homeRouter)
        viewController.present(viewController: homeRouter.viewControllable, animated: false)
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
    private var homeRouter: HomeRouting?
}

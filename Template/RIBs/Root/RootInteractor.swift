//
//  RootInteractor.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func routeToLoggedOut()
    func routeToLoggedIn()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    private let networkService: NetworkServicing
    
    init(presenter: RootPresentable, networkService: NetworkServicing) {
        self.networkService = networkService
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.routeToLoggedOut()
    }
    
    // MARK: - LoggedOutListener
    
    func login() {
        networkService.login()
        router?.routeToLoggedIn()
    }
}

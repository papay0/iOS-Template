//
//  HomeInteractor.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    func displayUserName(name: String)
}

protocol HomeListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    private let userStream: UserStreaming
    
    init(presenter: HomePresentable,
         userStream: UserStreaming) {
        self.userStream = userStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        userStream.user.subscribe(onNext: { (user) in
            self.presenter.displayUserName(name: user.name)
        }).disposeOnDeactivate(interactor: self)
    }
}

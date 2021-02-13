//
//  UserStream.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RxSwift

protocol UserStreaming: class {
    var user: Observable<User> { get }
}

protocol MutableUserStreaming: UserStreaming {
    func update(_ user: User)
}

final class UserStream: MutableUserStreaming {

    init() {}

    func update(_ user: User) {
        userSubject.onNext(user)
    }

    var user: Observable<User> {
        return userSubject.asObservable()
    }

    // MARK: - Private

    private let userSubject = ReplaySubject<User>.create(bufferSize: 1)
}


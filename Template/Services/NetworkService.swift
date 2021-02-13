//
//  NetworkService.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import Foundation

protocol NetworkServicing {
    func login()
}

final class NetworkService: NetworkServicing {
    
    init(mutableUserStream: MutableUserStreaming) {
        self.mutableUserStream = mutableUserStream
    }
    
    func login() {
        // Network request
        mutableUserStream.update(User(name: "Arthur"))
    }
    
    // MARK: - Private
    
    private let mutableUserStream: MutableUserStreaming
}

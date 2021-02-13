//
//  AppComponent.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    var mutableUserStream: MutableUserStreaming {
        return shared { UserStream() }
    }
    
    var networkService: NetworkServicing {
        return shared { NetworkService(mutableUserStream: mutableUserStream) }
    }

    init() {
        super.init(dependency: EmptyComponent())
    }
}

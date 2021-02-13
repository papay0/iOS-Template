//
//  HomeViewController.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class HomeViewController: ViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
    
    private lazy var internalView = HomeView()
    
    override func loadView() {
        view = internalView
    }
    
    // MARK: - HomePresentable
    
    func displayUserName(name: String) {
        internalView.displayUserName(name: name)
    }
}

private final class HomeView: View {
    
    override init() {
        super.init()
        backgroundColor = .red
    }
    
    func displayUserName(name: String) {
        print("name = \(name)")
    }
}

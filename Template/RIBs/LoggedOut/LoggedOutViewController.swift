//
//  LoggedOutViewController.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: ViewController,
LoggedOutPresentable,
LoggedOutViewControllable,
LoggedOutViewListener {
    
    weak var listener: LoggedOutPresentableListener?
    
    private lazy var internalView = LoggedOutView()
    
    override init() {
        super.init()
        internalView.listener = self
    }
    
    override func loadView() {
        view = internalView
    }
    
    // MARK: - LoggedOutViewListener
    
    func didTapLoginButton() {
        print("tapped")
    }
}

protocol LoggedOutViewListener: AnyObject {
    func didTapLoginButton()
}

private final class LoggedOutView: View {
    
    private let containerView: View
    private let loginButton: UIButton
    
    weak var listener: LoggedOutViewListener?
    
    override init() {
        containerView = View()
        loginButton = UIButton()
        super.init()
    }
    
    override func build() {
        super.build()
        setupSubviews()
        setupButtons()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Private
    
    @objc private func didTapLoginButton() {
        listener?.didTapLoginButton()
    }
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(loginButton)
    }
    
    private func setupButtons() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
}

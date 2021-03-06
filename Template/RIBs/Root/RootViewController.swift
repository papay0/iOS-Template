//
//  RootViewController.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

extension RootViewController: LoggedInViewControllable {}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    func present(viewController: ViewControllable, animated: Bool) {
        viewController.uiviewController.modalPresentationStyle = .currentContext
        present(viewController.uiviewController, animated: animated, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable, animated: Bool) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: animated, completion: nil)
        }
    }
}

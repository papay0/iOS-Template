//
//  ViewController.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "NSCoder and Interface Builder is not supported. Use Programmatic layout.")
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func loadView() {
        view = View()
        view.frame = UIScreen.main.bounds
    }
}

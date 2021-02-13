//
//  View.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import UIKit
import SnapKit

open class View: UIView {

    public init() {
        super.init(frame: .zero)
        configure()
        backgroundColor = .white
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable, message: "NSCoder and Interface Builder is not supported. Use Programmatic layout.")
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public final func configure() {
        build()
        setupConstraints()
        style()
    }

    open func build() {}

    open func setupConstraints() {}

    open func style() {}
}

extension View {
    public var gutter: CGFloat {
        return 3.su
    }
}

extension View {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}

//
//  SpacingUnits.swift
//  Template
//
//  Created by Arthur Papailhau on 2/13/21.
//  Copyright © 2021 Arthur Papailhau. All rights reserved.
//

import UIKit

public protocol SpacingUnits {
    var su: CGFloat { get }
}

extension Int: SpacingUnits {
    public var su: CGFloat {
        return CGFloat(self * 8)
    }
}

extension CGFloat: SpacingUnits {
    public var su: CGFloat {
        return self * 8.0
    }
}

extension Double: SpacingUnits {
    public var su: CGFloat {
        return CGFloat(self) * 8.0
    }
}

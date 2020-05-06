//
//  ReusableView+Extensions.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

public protocol ReusableView: class {}

extension ReusableView where Self: UITableViewCell {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension ReusableView where Self: UITableViewHeaderFooterView {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}

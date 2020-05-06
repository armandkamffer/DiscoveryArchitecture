//
//  TitleHeaderView.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class TitleHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
 
    class func headerView() -> TitleHeaderView? {
        let nib = UINib(nibName: String(describing: TitleHeaderView.self), bundle: nil)
        let headerView = nib.instantiate(withOwner: self, options: nil).first as? TitleHeaderView
        headerView?.titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return headerView
    }
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
}

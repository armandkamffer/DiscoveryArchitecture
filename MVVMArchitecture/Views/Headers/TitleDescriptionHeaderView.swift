//
//  TitleDescriptionHeaderView.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class TitleDescriptionHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    class func headerView() -> TitleDescriptionHeaderView? {
        let nib = UINib(nibName: String(describing: TitleDescriptionHeaderView.self), bundle: nil)
        let headerView = nib.instantiate(withOwner: self, options: nil).first as? TitleDescriptionHeaderView
        headerView?.titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView?.descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        return headerView
    }
    
    func configure(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}

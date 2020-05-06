//
//  CustomTableViewCell.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class TitleInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureStyling()
    }

    func configureStyling() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        infoLabel.font = UIFont.systemFont(ofSize: 15)
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    func configure(title: String, info: String) {
        titleLabel.text = title
        infoLabel.text = info
    }
}

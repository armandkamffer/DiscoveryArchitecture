//
//  ScenarioThreeHeaderFactory.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

protocol ScenarioThreeHeaderAbstractFactory {
    func header(for group: ScenarioThreeGroup?) -> UIView?
}

class ScenarioThreeSummaryHeaderFactory: ScenarioThreeHeaderAbstractFactory {
    func header(for group: ScenarioThreeGroup?) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.textLabel?.text = group?.title
        styleHeader(header)
        return header
    }
    
    func styleHeader(_ header: UITableViewHeaderFooterView) {
        header.contentView.backgroundColor = .white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

class ScenarioThreeDetailHeaderFactory: ScenarioThreeHeaderAbstractFactory {
    func header(for group: ScenarioThreeGroup?) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.textLabel?.text = group?.title
        header.detailTextLabel?.text = group?.subtitle
        styleHeader(header)
        return header
    }
    
    func styleHeader(_ header: UITableViewHeaderFooterView) {
        header.contentView.backgroundColor = .white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

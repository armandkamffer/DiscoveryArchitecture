//
//  ScenarioThreeHeaderFactory.swift
//  MVVMArchitecture
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
        guard let header = TitleHeaderView.headerView(),
            let title = group?.title else {
            return nil
        }
        header.configure(title: title)
        return header
    }
}

class ScenarioThreeDetailHeaderFactory: ScenarioThreeHeaderAbstractFactory {
    func header(for group: ScenarioThreeGroup?) -> UIView? {
        guard let header = TitleDescriptionHeaderView.headerView(),
            let title = group?.title,
            let description = group?.description else {
            return nil
        }
        header.configure(title: title, description: description)
        return header
    }
}

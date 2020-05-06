//
//  MEMTableViewController.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class MEMTableViewController: UITableViewController {
    func showLoading() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)

            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating()

            alert.view.addSubview(loadingIndicator)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideLoading() {
        dismiss(animated: false, completion: nil)
    }
    
    func showError(retryAction: @escaping ()->()) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Loading...", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
                retryAction()
            }
            alert.addAction(cancelAction)
            alert.addAction(retryAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

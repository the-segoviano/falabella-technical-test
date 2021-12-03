//
//  BaseViewController.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var mainView: UIView {
        get {
            return self.view
        }
    }
    
    let localStorage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    @objc func close() {
        self.dismiss(animated: true)
    }
    
}

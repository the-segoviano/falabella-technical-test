//
//  Alert.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Strings.ok, style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    static func showSomethingGetsWrongAlert(on vc: UIViewController,
                                            withMessage message: String)
    {
        showBasicAlert(on: vc, with: "Something Gets Wrong", message: message)
    }
    
    
}

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
    
    static func showIncompleteFormAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Woops", message: "Please enter all information to log in.")
    }
    
    static func showIncompleteFormSignUpAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Woops", message: "Please enter all information to create a new account.")
    }
    
    static func showInvalidEmailAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Email", message: "Please use a correct email.")
    }
    
    static func showInvalidPassword(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Password", message: "Use at least 6 characters.")
    }
    
    static func showInvalidPasswordConfirmation(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Invalid Password", message: "The passwords fields must match.")
    }
    
    static func showUnableToRetrieveDataAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Unable to Retrieve Data", message: "Please try again.")
    }
    
    static func UseralreadyExistsAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "User already exists", message: "Please try with different email.")
    }
    
    
}

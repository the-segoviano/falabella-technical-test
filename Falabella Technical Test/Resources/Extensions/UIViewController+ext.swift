//
//  UIViewController+ext.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit


extension UIViewController {
    /**
     * Funciones para ocultar el keyword cuando se toca en cualquier region de la pantalla
     *
     */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
        
}

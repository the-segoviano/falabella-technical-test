//
//  CustomTextField.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit

class CustomTextField {
    
    class func getTextField(withPlaceholder placeholder: String = "") -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.cornerRadius = Constants.Value.cornerRadius
        field.addBorder(borderColor: UIColor.lightGray, widthBorder: 1.0)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.placeholder = placeholder
        if #available(iOS 13.0, *) {
            field.backgroundColor = .secondarySystemBackground
        } else {
            // Fallback on earlier versions
        }
        field.font = CustomFont.getRegularFont()
        return field
    }
    
}

class CustomTextFieldPassword: UITextField {
    
    let openEye: String   = "ic_show"
    
    let closedEye: String = "ic_hide"
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        button.setImage(UIImage(named: closedEye), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView = showPasswordButton
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.layer.cornerRadius = Constants.Value.cornerRadius
        self.addBorder(borderColor: UIColor.lightGray, widthBorder: 1.0)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftViewMode = .always
        if #available(iOS 13.0, *) {
            self.backgroundColor = .secondarySystemBackground
        } else {
            self.backgroundColor = .white
        }
        self.font = CustomFont.getRegularFont()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showPassword() {
        self.isSecureTextEntry = !self.isSecureTextEntry
        if self.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(named: closedEye), for: .normal)
        }
        else{
            showPasswordButton.setImage(UIImage(named: openEye), for: .normal)
        }
    }
    
}

//
//  BaseButton.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit


class BaseButton {
    
    class func standardButton(withTitle title: String) -> UIButton {
        let button = BaseButton.getButton(withTitle: title, withColor: .lightGray)
        return button
    }
    
    static func getButton(withTitle title: String, withColor color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.Value.cornerRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = CustomFont.getRegularFont()
        return button
    }
    
}

//
//  LoaderIndicator.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 06/12/21.
//

import UIKit

class LoaderIndicator: NSObject {
    
    static let sharedInstance = LoaderIndicator()

    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    let screen = UIScreen.main.bounds
    
    func show(reference: UIViewController, yOrigin: CGFloat) {
        indicator.frame = CGRect(x: 0.0, y: yOrigin, width: 40.0, height: 40.0)
        indicator.frame.origin.x = (screen.width/2) - 20
        reference.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
            self.indicator.removeFromSuperview()
        }
    }
    
}

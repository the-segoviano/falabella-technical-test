//
//  UIColor+ext.swift
//  IAInteractive
//
//  Created by Luis Segoviano on 18/11/21.
//

import UIKit


extension UIColor {
    
    static let primaryColor = ParseColor.hexStringToUIColor(hex: "#ff6d00")
    
    static let backgroundColor = ParseColor.hexStringToUIColor(hex: "#fafafa")
    
    static let textColor = ParseColor.hexStringToUIColor(hex: "#212121")
    
    static let collectionViewBackground = ParseColor.hexStringToUIColor(hex: "#f8f5f5")
    
    static let pinkishGrey = ParseColor.hexStringToUIColor(hex: "#bdbdbd")
    
}

class ParseColor {
    /**
     * Metodo para crear un color a partir de un hexadecimal en String
     *
     * @param hex String que se convertira a UIColor
     * @return UIColor
     */
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

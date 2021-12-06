//
//  ProductCell.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import UIKit

class ProductCell: BaseCollectionViewCell {
    
    var imageProduct: UIImageView!
    
    //
    // MARK: Icons
    //
    var icPlusSquare: UIImageView!
    var icInternationalSquare: UIImageView!
    var icRefurbishedSquare: UIImageView!
    var icFreeShippingSquare: UIImageView!
    var icfavOn: UIImageView!
    
    func setupCell(withProduct product: Product) {
        backgroundColor = .white
        layer.cornerRadius = Constants.Value.cornerRadius
        
        imageProduct = getImageByName(withName: "ex-product", contentMode: .scaleAspectFit)
        if !product.image.isEmpty {
            imageProduct.setImage(from: product.image)
        }
        
        var linioPlusLevelName: String = "ic_plusSquare"
        if product.linioPlusLevel == 0 {
            linioPlusLevelName = "ic_plus48Square"
        }
        icPlusSquare = getImageByName(withName: linioPlusLevelName)
        
        var conditionTypeImageName = ""
        if product.conditionType == "refurbished" {
            conditionTypeImageName =  "ic_refurbishedSquare"
        }
        if product.conditionType == "new" {
            conditionTypeImageName =  "ic_newSquare"
        }
        icRefurbishedSquare = getImageByName(withName: conditionTypeImageName)
        
        icfavOn = getImageByName(withName: "ic_favOn")
        
        if product.imported {
            icInternationalSquare = getImageByName(withName: "ic_internationalSquare")
        }
        else{
            icInternationalSquare = getImageByName(withName: "")
        }
        
        if product.freeShipping {
            icFreeShippingSquare = getImageByName(withName: "ic_freeShippingSquare")
        }else{
            icFreeShippingSquare = getImageByName(withName: "")
        }
        
        setupCellLayout()
        
    } // [END] setupCell
    
    fileprivate func getImageByName(withName name: String,
                                    contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView
    {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = contentMode
        imageView.image = UIImage(named: name)
        imageView.clipsToBounds = true
        return imageView
    }
    
    fileprivate func setupCellLayout() {
        addSubview(imageProduct)
        imageProduct.addSubview(icPlusSquare)
        imageProduct.addSubview(icRefurbishedSquare)
        imageProduct.addSubview(icfavOn)
        
        NSLayoutConstraint.activate([
            // example background image
            imageProduct.widthAnchor.constraint(equalTo: widthAnchor),
            imageProduct.heightAnchor.constraint(equalTo: heightAnchor),
            imageProduct.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageProduct.centerYAnchor.constraint(equalTo: centerYAnchor),
            icfavOn.widthAnchor.constraint(equalToConstant: Constants.Value.sizeIconHeart),
            icfavOn.heightAnchor.constraint(equalToConstant: Constants.Value.sizeIconHeart),
            icfavOn.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Value.padding),
            icfavOn.trailingAnchor.constraint(equalTo: trailingAnchor),
            // Icons
            icPlusSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icPlusSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icPlusSquare.topAnchor.constraint(equalTo: topAnchor),
            icPlusSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
            icRefurbishedSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icRefurbishedSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icRefurbishedSquare.topAnchor.constraint(equalTo: icPlusSquare.bottomAnchor),
            icRefurbishedSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        if icInternationalSquare.image != nil {
            imageProduct.addSubview(icInternationalSquare)
            icInternationalSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage).isActive = true
            icInternationalSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage).isActive = true
            icInternationalSquare.topAnchor.constraint(equalTo: icRefurbishedSquare.bottomAnchor).isActive = true
            icInternationalSquare.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        }
        
        if icFreeShippingSquare.image != nil {
            imageProduct.addSubview(icFreeShippingSquare)
            icFreeShippingSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage).isActive = true
            icFreeShippingSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage).isActive = true
            if icInternationalSquare.image != nil {
                icFreeShippingSquare.topAnchor.constraint(equalTo: icInternationalSquare.bottomAnchor).isActive = true
            }
            else{
                icFreeShippingSquare.topAnchor.constraint(equalTo: icRefurbishedSquare.bottomAnchor).isActive = true
            }
            icFreeShippingSquare.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        }
        
    }
    
}

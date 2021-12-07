//
//  ProductCell.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import UIKit

enum conditionTypeProduct: String {
    case refurbished, new
}

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
        
        imageProduct = getImageByName(withName: Constants.ImageName.exProduct, contentMode: .scaleAspectFit)
        if !product.image.isEmpty {
            imageProduct.setImage(from: product.image)
        }
        
        var linioPlusLevelName: String = Constants.ImageName.icPlusSquare
        if product.linioPlusLevel == 0 {
            linioPlusLevelName = Constants.ImageName.icPlus48Square
        }
        icPlusSquare = getImageByName(withName: linioPlusLevelName)
        
        var conditionTypeImageName: String = ""
        if product.conditionType == conditionTypeProduct.refurbished.rawValue {
            conditionTypeImageName = Constants.ImageName.icRefurbishedSquare
        }
        if product.conditionType == conditionTypeProduct.new.rawValue {
            conditionTypeImageName = Constants.ImageName.icNewSquare
        }
        icRefurbishedSquare = getImageByName(withName: conditionTypeImageName)
        
        icfavOn = getImageByName(withName: Constants.ImageName.icFavOn)
        
        icInternationalSquare = getImageByName(withName: "")
        if product.imported {
            icInternationalSquare = getImageByName(withName: Constants.ImageName.icInternationalSquare)
        }
        
        icFreeShippingSquare = getImageByName(withName: "")
        if product.freeShipping {
            icFreeShippingSquare = getImageByName(withName: Constants.ImageName.icFreeShippingSquare)
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

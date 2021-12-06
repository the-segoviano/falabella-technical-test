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
        icPlusSquare = getImageByName(withName: "ic_plusSquare")
        icInternationalSquare = getImageByName(withName: "ic_internationalSquare")
        icRefurbishedSquare = getImageByName(withName: "ic_refurbishedSquare")
        icFreeShippingSquare = getImageByName(withName: "ic_freeShippingSquare")
        icfavOn = getImageByName(withName: "ic_favOn")
        
        addSubview(imageProduct)
        imageProduct.addSubview(icPlusSquare)
        imageProduct.addSubview(icInternationalSquare)
        imageProduct.addSubview(icRefurbishedSquare)
        imageProduct.addSubview(icFreeShippingSquare)
        imageProduct.addSubview(icfavOn)
        
        NSLayoutConstraint.activate([
            // example background image
            imageProduct.widthAnchor.constraint(equalTo: widthAnchor),
            imageProduct.heightAnchor.constraint(equalTo: heightAnchor),
            imageProduct.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageProduct.centerYAnchor.constraint(equalTo: centerYAnchor),
            // Icons
            icPlusSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icPlusSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icPlusSquare.topAnchor.constraint(equalTo: topAnchor),
            icPlusSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
            icInternationalSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icInternationalSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icInternationalSquare.topAnchor.constraint(equalTo: icPlusSquare.bottomAnchor),
            icInternationalSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
            icRefurbishedSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icRefurbishedSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icRefurbishedSquare.topAnchor.constraint(equalTo: icInternationalSquare.bottomAnchor),
            icRefurbishedSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
            icFreeShippingSquare.widthAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icFreeShippingSquare.heightAnchor.constraint(equalToConstant: Constants.Value.sizeProductImage),
            icFreeShippingSquare.topAnchor.constraint(equalTo: icRefurbishedSquare.bottomAnchor),
            icFreeShippingSquare.leadingAnchor.constraint(equalTo: leadingAnchor),
            icfavOn.widthAnchor.constraint(equalToConstant: Constants.Value.sizeIconHeart),
            icfavOn.heightAnchor.constraint(equalToConstant: Constants.Value.sizeIconHeart),
            icfavOn.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Value.padding),
            icfavOn.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
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
    
    
}

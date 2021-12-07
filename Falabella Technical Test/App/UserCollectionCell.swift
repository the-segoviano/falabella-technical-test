//
//  UserCollectionCell.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import UIKit

class UserCollectionCell: BaseCollectionViewCell {
    
    var imgPreview1: UIImageView!
    var imgPreview2: UIImageView!
    var imgPreview3: UIImageView!
    
    lazy var nameCollectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalItemsInCollectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .pinkishGrey
        return label
    }()
    
    func setupCell(withCustomUserCollection customUserCollection: FavoritesResponseElement) {
        backgroundColor = .white
        layer.cornerRadius = Constants.Value.cornerRadius
        nameCollectionLabel.text = customUserCollection.name
        totalItemsInCollectionLabel.text = "\(customUserCollection.products.count)"
        imgPreview1 = getImageByName(withName: Constants.ImageName.exPreview)
        imgPreview2 = getImageByName(withName: Constants.ImageName.exPreview)
        imgPreview3 = getImageByName(withName: Constants.ImageName.exPreview)
        var i: Int = 0
        for p in customUserCollection.products {
            if i == 0 {
                imgPreview1.setImage(from: p.value.image)
            }
            if i == 1 {
                imgPreview2.setImage(from: p.value.image)
            }
            if i == 2 {
                imgPreview3.setImage(from: p.value.image)
            }
            i += 1
            if i == 3 {
                break
            }
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
        imageView.layer.cornerRadius = 5
        return imageView
    }
    
    
    fileprivate func setupCellLayout() {
        let containerPreviews: UIView = UIView()
        containerPreviews.translatesAutoresizingMaskIntoConstraints = false
        containerPreviews.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        containerPreviews.layer.cornerRadius = Constants.Value.cornerRadius
        
        addSubview(containerPreviews)
        addSubview(nameCollectionLabel)
        addSubview(totalItemsInCollectionLabel)
        
        containerPreviews.addSubview(imgPreview1)
        containerPreviews.addSubview(imgPreview2)
        containerPreviews.addSubview(imgPreview3)
        
        let wtCell:CGFloat = (contentView.frame.width/2) - 10
        var sizePreview1:CGFloat = 100
        var sizePreview2and:CGFloat = 46
        
        if wtCell < 174 {
            sizePreview1 = 85
            sizePreview2and = 38
        }
        
        NSLayoutConstraint.activate([
            containerPreviews.widthAnchor.constraint(equalTo: widthAnchor),
            containerPreviews.heightAnchor.constraint(equalToConstant: 120),
            containerPreviews.topAnchor.constraint(equalTo: topAnchor),
            
            // Labels
            totalItemsInCollectionLabel.heightAnchor.constraint(equalToConstant: 22),
            totalItemsInCollectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Value.padding),
            totalItemsInCollectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Value.padding),
            nameCollectionLabel.heightAnchor.constraint(equalToConstant: 24),
            nameCollectionLabel.bottomAnchor.constraint(equalTo: totalItemsInCollectionLabel.topAnchor),
            nameCollectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            // Previews images
            imgPreview1.widthAnchor.constraint(equalToConstant: sizePreview1),
            imgPreview1.heightAnchor.constraint(equalToConstant: sizePreview1),
            imgPreview1.centerYAnchor.constraint(equalTo: containerPreviews.centerYAnchor),
            imgPreview1.centerXAnchor.constraint(equalTo: containerPreviews.centerXAnchor, constant: -24),
            
            imgPreview2.widthAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview2.heightAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview2.topAnchor.constraint(equalTo: imgPreview1.topAnchor),
            imgPreview2.trailingAnchor.constraint(equalTo: imgPreview1.trailingAnchor, constant: 48),
            
            imgPreview3.widthAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview3.heightAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview3.topAnchor.constraint(equalTo: imgPreview2.bottomAnchor, constant: Constants.Value.padding),
            imgPreview3.centerXAnchor.constraint(equalTo: imgPreview2.centerXAnchor)
            
        ])
    }
    
    
}

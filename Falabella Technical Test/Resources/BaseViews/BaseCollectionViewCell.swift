//
//  BaseCollectionViewCell.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 03/12/21.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(" Error to initialize ")
    }
    
}

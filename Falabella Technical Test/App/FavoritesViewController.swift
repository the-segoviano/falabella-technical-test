//
//  FavoritesViewController.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 03/12/21.
//

import UIKit


enum FavoriteSections: CaseIterable
{
    case userCollections, allCollections
    
    static func numberOfSections() -> Int
    {
        return self.allCases.count
    }
    
    static func getSection(_ section: Int) -> FavoriteSections
    {
        return self.allCases[section]
    }
    
}


class FavoritesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.IdForCell.genericCell)
        self.collectionView.register(HeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.IdForCell.customHeaderCell)
        self.collectionView.register(FooterCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Constants.IdForCell.customFooterCell)
        self.collectionView.register(ProductCell.self, forCellWithReuseIdentifier: Constants.IdForCell.productCell)
        self.collectionView.register(UserCollectionCell.self, forCellWithReuseIdentifier: Constants.IdForCell.userCollectionCell)
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .collectionViewBackground
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.alwaysBounceVertical = true
    }
    
    
    func fetchCollections() {
        RequestManager.fetchCollections(reference: self) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let favoritesResponse):
                DispatchQueue.main.async {
                    
                    print(" TERMINA favoritesResponse ", favoritesResponse, "\n")
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(" Error Found: ", error.localizedDescription)
                }
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchCollections()
        
    }
    
    
    //
    // initialized with a non-nil layout parameter
    //
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //
    // MARK: - Delegates & Datasource
    //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    
    //
    // MARK: Size For Item
    //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch FavoriteSections.getSection(indexPath.section) {
        case .userCollections:
            let wtCell: CGFloat = (view.frame.width/2) - 10
            return CGSize.init(width: wtCell, height: 178)
            
        case .allCollections:
            let wtCell: CGFloat = (view.frame.width/2) - 10
            return CGSize.init(width: wtCell, height: wtCell)
        }
        
    }
    
    //
    // MARK: Cell For Item At
    //
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch FavoriteSections.getSection(indexPath.section) {
            
        case .userCollections:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdForCell.userCollectionCell, for: indexPath)
            if let cell = cell as? UserCollectionCell {
                cell.setupCell()
                return cell
            }
            
        case .allCollections:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdForCell.productCell, for: indexPath)
            if let cell = cell as? ProductCell {
                cell.setupCell()
                return cell
            }
            
        }
        
        return UICollectionViewCell()
    }
    
    
    //
    // MARK: Number Of Sections
    //
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FavoriteSections.numberOfSections()
    }
    
    
    //
    // MARK: Number Of 'Items' In Section
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch FavoriteSections.getSection(section) {
        case .userCollections:
            return 5
        case .allCollections:
            return 15
        }
    }
    
    
    //
    // MARK: Did Select Item
    //
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(" indexPath ", indexPath)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            let headerView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.IdForCell.customHeaderCell, for: indexPath)
            headerView.backgroundColor = UIColor.collectionViewBackground
            headerView.removeViews()
            
            switch FavoriteSections.getSection(indexPath.section) {
            case .userCollections:
                
                let titleLabel: UILabel = UILabel()
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.text = Constants.Strings.titleFavSection
                titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
                
                let addButton: UIButton = UIButton(type: .custom)
                addButton.translatesAutoresizingMaskIntoConstraints = false
                addButton.setImage(UIImage(named: Constants.ImageName.add), for: .normal)
                
                headerView.addSubview(titleLabel)
                headerView.addSubview(addButton)
                
                NSLayoutConstraint.activate([
                    titleLabel.heightAnchor.constraint(equalToConstant: 30),
                    titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                    
                    addButton.leftAnchor.constraint(equalTo: headerView.leftAnchor),
                    addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                    addButton.heightAnchor.constraint(equalToConstant: 45),
                    addButton.widthAnchor.constraint(equalToConstant: 45)
                ])
                
            case .allCollections:
                let titleLabel: UILabel = UILabel()
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.text = "Todos mis favoritos (16)"
                titleLabel.font = CustomFont.getBoldFont(withSize: 16)
                headerView.addSubview(titleLabel)
                NSLayoutConstraint.activate([
                    titleLabel.heightAnchor.constraint(equalToConstant: 30),
                    titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
                ])
            }
            
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            
            let footerView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.IdForCell.customFooterCell, for: indexPath)
            footerView.backgroundColor = UIColor.collectionViewBackground
            footerView.removeViews()
            return footerView
            
        default: return UICollectionReusableView()
            
        }
    }
    
    //
    // MARK: Height Header
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        switch FavoriteSections.getSection(section) {
        case .userCollections:
            return CGSize(width: collectionView.frame.width, height: 50.0)
        case .allCollections:
            return CGSize(width: collectionView.frame.width, height: 40.0)
        }
        
    }
    
    //
    // MARK: Height Footer
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        
        switch FavoriteSections.getSection(section) {
        case .userCollections:
            return CGSize(width: collectionView.frame.width, height: 0.0)
        case .allCollections:
            return CGSize(width: collectionView.frame.width, height: 15.0)
        }
        
    }
    
    
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
    
    func setupCell() {
        backgroundColor = .white
        layer.cornerRadius = Constants.Value.cornerRadius
        
        imageProduct = getImageByName(withName: "ex-product", contentMode: .scaleAspectFit)
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



class UserCollectionCell: BaseCollectionViewCell {
    
    var imgPreview1: UIImageView!
    var imgPreview2: UIImageView!
    var imgPreview3: UIImageView!
    
    lazy var nameCollectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Collection 1"
        return label
    }()
    
    lazy var totalItemsInCollectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "11"
        label.textColor = .pinkishGrey
        return label
    }()
    
    func setupCell() {
        backgroundColor = .white
        layer.cornerRadius = Constants.Value.cornerRadius
        
        let containerPreviews: UIView = UIView()
        containerPreviews.translatesAutoresizingMaskIntoConstraints = false
        containerPreviews.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        containerPreviews.layer.cornerRadius = Constants.Value.cornerRadius
        
        imgPreview1 = getImageByName(withName: "ex-preview")
        imgPreview2 = getImageByName(withName: "ex-preview")
        imgPreview3 = getImageByName(withName: "ex-preview")
        
        addSubview(containerPreviews)
        
        addSubview(nameCollectionLabel)
        addSubview(totalItemsInCollectionLabel)
        
        containerPreviews.addSubview(imgPreview1)
        containerPreviews.addSubview(imgPreview2)
        containerPreviews.addSubview(imgPreview3)
        
        let wtCell = (contentView.frame.width/2) - 10
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
            totalItemsInCollectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            totalItemsInCollectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameCollectionLabel.heightAnchor.constraint(equalToConstant: 24),
            nameCollectionLabel.bottomAnchor.constraint(equalTo: totalItemsInCollectionLabel.topAnchor),
            nameCollectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            // Previews images
            imgPreview1.widthAnchor.constraint(equalToConstant: sizePreview1),
            imgPreview1.heightAnchor.constraint(equalToConstant: sizePreview1),
            imgPreview1.topAnchor.constraint(equalTo: containerPreviews.topAnchor, constant: 8),
            imgPreview1.leadingAnchor.constraint(equalTo: containerPreviews.leadingAnchor, constant: 8),
            
            imgPreview2.widthAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview2.heightAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview2.topAnchor.constraint(equalTo: containerPreviews.topAnchor, constant: 8),
            imgPreview2.trailingAnchor.constraint(equalTo: containerPreviews.trailingAnchor, constant: -8),
            
            imgPreview3.widthAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview3.heightAnchor.constraint(equalToConstant: sizePreview2and),
            imgPreview3.topAnchor.constraint(equalTo: imgPreview2.bottomAnchor, constant: 8),
            imgPreview3.trailingAnchor.constraint(equalTo: containerPreviews.trailingAnchor, constant: -8)
            
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
        imageView.layer.cornerRadius = 5
        return imageView
    }
    
}


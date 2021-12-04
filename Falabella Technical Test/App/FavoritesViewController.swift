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
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .collectionViewBackground
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.alwaysBounceVertical = true
    }
    
    
    /*
    func fetchCartelera() {
        RequestManager.fetchCartelera(reference: self) { [weak self] result in
            switch result {
            case .success(let carteleraResponse):
                DispatchQueue.main.async {
                    
                    print(" TERMINA carteleraResponse ", carteleraResponse, "\n")
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(" Error Found: ", error.localizedDescription)
                }
            }
            
        }
    }*/
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // fetchCartelera()
        
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
        
        let wtCell: CGFloat = (view.frame.width/2) - 10
        return CGSize.init(width: wtCell, height: wtCell)
    }
    
    //
    // MARK: Cell For Item At
    //
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch FavoriteSections.getSection(indexPath.section) {
            
        case .userCollections:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdForCell.genericCell, for: indexPath)
            cell.backgroundColor = .pinkishGrey
            return cell
            
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
            //headerView.releaseView()
            
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
            footerView.backgroundColor = UIColor.white
            //footerView.releaseView()
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
            return CGSize(width: collectionView.frame.width, height: 0.0)
        }
        
    }
    
    
}



class ProductCell: BaseCollectionViewCell {
    
    let imageProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ex-product")
        return imageView
    }()
    
    func setupCell() {
        addSubview(imageProduct)
        
        NSLayoutConstraint.activate([
            imageProduct.widthAnchor.constraint(equalTo: widthAnchor),
            imageProduct.heightAnchor.constraint(equalTo: heightAnchor),
            imageProduct.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageProduct.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
}



class UserCollectionCell: BaseCollectionViewCell {
    
    func setupCell() {
        //
    }
    
}


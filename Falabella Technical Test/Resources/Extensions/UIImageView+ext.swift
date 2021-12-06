//
//  UIImageView+ext.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 06/12/21.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    ///
    /// Download image from a URL Asynchronously
    /// Usage:
    /// imageView.setImage(from: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
    ///
    func download(from url: URL,
                    contentMode mode: ContentMode = .scaleAspectFit)
    {
        contentMode = mode
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString)  {
            self.image = cachedImage
            return
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                guard let strongSelf = self else { return }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                
                strongSelf.image = image
                
                activityIndicator.removeFromSuperview()
                
            }
        }.resume()
    }
    
    func setImage(from link: String,
                  contentMode mode: ContentMode = .scaleAspectFit)
    {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode)
    }
    
}

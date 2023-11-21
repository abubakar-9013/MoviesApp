//
//  ImageManager.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import SwiftUI

class ImageManager: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    private let cachedImage = NSCache<AnyObject, AnyObject>()
    
    func loadImage(url: URL) {
        let urlString = url.absoluteString
        if let cachedImage = cachedImage.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self?.cachedImage.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

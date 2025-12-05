//
//  UIImage + Extension.swift
//  Freshly
//
//  Created by Neosoft on 07/07/25.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString : String){
        guard let url = URL(string: urlString) else{
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.setImage(with: resource)
    }
}

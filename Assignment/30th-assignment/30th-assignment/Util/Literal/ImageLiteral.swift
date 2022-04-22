//
//  ImageLiteral.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import UIKit

enum ImageLiteral {
    static var btnBackBlack: UIImage { .load(named: "back_button")}
    static var iconHome: UIImage { .load(named: "icn_home")}
    static var iconHomeSelected: UIImage { .load(named: "icn_home_selected")}
    static var iconProfile: UIImage { .load(named: "icn_profile")}
    static var iconProfileSelected: UIImage { .load(named: "icn_profile_selected")}
    static var iconReels: UIImage { .load(named: "icn_reels")}
    static var iconReelsSelected: UIImage { .load(named: "icn_reels_selected")}
    static var iconSearch: UIImage { .load(named: "icn_search")}
    static var iconSearchSelected: UIImage { .load(named: "icn_search_selected")}
    static var iconShop: UIImage { .load(named: "icn_shop")}
    static var iconShopSelected: UIImage { .load(named: "icn_shop_selected")}
    static var iconPasswordHidden: UIImage { .load(named: "password hidden eye icon")}
    static var iconPasswordShown: UIImage { .load(named: "password shown eye icon")}
    static var imgInstagramLogo: UIImage { .load(named: "Instagram Black Logo")}
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }

    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}

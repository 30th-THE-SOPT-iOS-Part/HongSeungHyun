//
//  ImageLiteral.swift
//  30th-assignment
//
//  Created by Noah on 2022/04/09.
//

import UIKit

enum ImageLiteral {
    static var avatar1: UIImage { .load(named: "avatar1")}
    static var avatar2: UIImage { .load(named: "avatar2")}
    static var avatar3: UIImage { .load(named: "avatar3")}
    static var avatar4: UIImage { .load(named: "avatar4")}
    static var avatar5: UIImage { .load(named: "avatar5")}
    static var avatar6: UIImage { .load(named: "avatar6")}
    static var btnBackBlack: UIImage { .load(named: "back_button")}
    static var iconAdd: UIImage { .load(named: "icn_add")}
    static var iconBookmark: UIImage { .load(named: "icn_bookmark")}
    static var iconComment: UIImage { .load(named: "icn_comment")}
    static var iconHome: UIImage { .load(named: "icn_home")}
    static var iconHomeSelected: UIImage { .load(named: "icn_home_selected")}
    static var iconLike: UIImage { .load(named: "icn_like")}
    static var iconMore: UIImage { .load(named: "icn_more")}
    static var iconPasswordHidden: UIImage { .load(named: "password hidden eye icon")}
    static var iconPasswordShown: UIImage { .load(named: "password shown eye icon")}
    static var iconProfile: UIImage { .load(named: "icn_profile")}
    static var iconProfileSelected: UIImage { .load(named: "icn_profile_selected")}
    static var iconReels: UIImage { .load(named: "icn_reels")}
    static var iconReelsSelected: UIImage { .load(named: "icn_reels_selected")}
    static var iconShare: UIImage { .load(named: "icn_share")}
    static var iconSearch: UIImage { .load(named: "icn_search")}
    static var iconSearchSelected: UIImage { .load(named: "icn_search_selected")}
    static var iconShop: UIImage { .load(named: "icn_shop")}
    static var iconShopSelected: UIImage { .load(named: "icn_shop_selected")}
    static var iconUnLike: UIImage { .load(named: "icn_unlike")}
    static var imgInstagramLogo: UIImage { .load(named: "Instagram Black Logo")}
    static var imgInstagramSmallLogo: UIImage { .load(named: "logo_instagram_small")}
    static var imgPost1: UIImage { .load(named: "postImage1")}
    static var imgPost2: UIImage { .load(named: "postImage2")}
    static var imgPost3: UIImage { .load(named: "postImage3")}
    static var imgPost4: UIImage { .load(named: "postImage4")}
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

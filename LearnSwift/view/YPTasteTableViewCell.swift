//
//  YPTasteCollectionViewCell.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

//https://shop.io.mi-img.com/app/shop/img?id=shop_1a1ca1bececf3720a22359575e9c217f.jpeg

class YPTasteTableViewCell: UITableViewCell {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    lazy var titleLabel:UILabel = UILabel()
    lazy var goodsImageView : UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constructionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
   fileprivate func constructionView() {
        // add title
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        })
        titleLabel.textAlignment = .center
    
        // add imageview
        self.contentView.addSubview(goodsImageView)
        let url = URL(string: "https://shop.io.mi-img.com/app/shop/img?id=shop_1a1ca1bececf3720a22359575e9c217f.jpeg")
        goodsImageView.kf.setImage(with: url)
//        goodsImageView.image = UIImage(named:"img.jpeg")
        goodsImageView.contentMode = .scaleToFill
        goodsImageView.clipsToBounds = true
        goodsImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(200)
        }
    
    }
}

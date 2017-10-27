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
    
    lazy var titleLabel : UILabel = UILabel()
    lazy var subtitleLabel : UILabel = UILabel()
    lazy var goodsImageView : UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constructionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
   fileprivate func constructionView() {
    
        // add imageview
        self.contentView.addSubview(goodsImageView)
        //        goodsImageView.image = UIImage(named:"img.jpeg")
        goodsImageView.contentMode = .scaleToFill
        goodsImageView.clipsToBounds = true
        goodsImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(200)
        }
    
        // add title
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(goodsImageView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        })
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
    
        // add subtitle
        self.contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(5)
        })
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
    }
}

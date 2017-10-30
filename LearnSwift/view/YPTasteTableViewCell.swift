//
//  YPTasteCollectionViewCell.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

//https://shop.io.mi-img.com/app/shop/img?id=shop_1a1ca1bececf3720a22359575e9c217f.jpeg

class YPTasteTableViewCell: YPTableViewBaseCell {
    
    lazy var titleLabel : UILabel = UILabel()
    lazy var subtitleLabel : UILabel = UILabel()
    lazy var goodsImageView : UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func configure() {
        goodsImageView
        .addhere(toSuperView: self.contentView)
        .layout { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(200)
        }.config { (imageView) in
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
        }
    
        titleLabel
        .addhere(toSuperView: self.contentView)
        .layout { (make) in
        make.top.equalTo(goodsImageView.snp.bottom).offset(10)
        make.left.equalTo(10)
        make.right.equalTo(-10)
        }.config { (label) in
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize:14)
        }
    
    
        subtitleLabel
            .addhere(toSuperView: self.contentView)
            .layout { (maker) in
                maker.top.equalTo(titleLabel.snp.bottom).offset(5)
                maker.left.equalTo(10)
                maker.right.equalTo(-10)
                maker.bottom.equalTo(5)
            }
            .config { (label) in
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 12)
            }
    }
}

//
//  YPTasteCollectionViewCell.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit

class YPTasteCollectionViewCell: UICollectionViewCell {
    let width = UIScreen.main.bounds.size.width
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constructionView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func constructionView() {
        titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: (width-40)/2, height: 50))
        self.addSubview(titleLabel!)
    }
}

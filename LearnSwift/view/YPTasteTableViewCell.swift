//
//  YPTasteCollectionViewCell.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit

class YPTasteTableViewCell: UITableViewCell {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var titleLabel:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel?.text = nil
        constructionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    func constructionView() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        self.addSubview(titleLabel!)
    }
}

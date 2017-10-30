//
//  YPUITableViewBaseCell.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/30.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

import UIKit

class YPTableViewBaseCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    // subclass must implement
    func configure() -> Void {
        fatalError()
    }
    
}

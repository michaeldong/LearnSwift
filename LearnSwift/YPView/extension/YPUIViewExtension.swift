//
//  YPUIViewExtension.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/30.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

// refer this blog: https://blog.nswebfrog.com/2017/10/20/swift-practice-ui-chaining-code/

import UIKit
import SnapKit

protocol ViewChainable {
    
}

extension ViewChainable where Self : UIView {
    @discardableResult
    func config(_ config: (Self) -> Void) -> Self {
        config(self)
        return self
    }
}

extension UIView: ViewChainable {
    func addhere(toSuperView: UIView) -> Self {
        toSuperView.addSubview(self)
        return self
    }
    
    @discardableResult
    func layout(snapKitMaker: (ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
        return self
    }
}

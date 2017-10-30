//
//  YPBaseModel.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/30.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

import ObjectMapper

class YPBaseModel: Mappable {
    var code: String?
    var msg: String?
    var result: AnyObject?
    var timestamp: CLong?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        msg <- map["msg"]
        result <- map["result"]
        timestamp <- map["timestamp"]
    }
    
}

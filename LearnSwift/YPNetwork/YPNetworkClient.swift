//
//  YPNetworkClient.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/30.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

import Alamofire
import ObjectMapper

class YPNetworkClient {
    static let instance = YPNetworkClient()
    private init() {}
    
    typealias YPNetworkSuccess = (_ response: Any) -> ()
    typealias YPNetworkFailure = (_ error: NSError) -> ()
}

extension YPNetworkClient {
    func post(api: YPNetworkAPI,success: @escaping YPNetworkSuccess, failure: @escaping YPNetworkFailure) {
        Alamofire.request(api.url, method: .post, parameters: api.parameters, encoding: JSONEncoding(options: []), headers:api.header).responseJSON{ (response:DataResponse) in
            switch response.result {
            case .success(let value):
                
// to do
//                <T: Mappable>
                //                    let info = Mapper<YPBaseModel>().map(JSONObject: value)
                //                    success(response: (info ? .response)!)
//                let responseJSON = JSON(value)
                
                success(value)
                break
            case .failure(let error):
                failure(error as NSError)
                break
            }
        }
    }
}


protocol YPNetworkType {
    var baseURL: String { get }
    var url: String { get }
    var method: Alamofire.HTTPMethod { get }
    var header: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum YPNetworkAPI {
    case getList(type:Int)
    case getGoods
}

extension YPNetworkAPI: YPNetworkType {
    var baseURL: String { return "https://shopapi.io.mi.com/" }
    
    var url: String {
        switch self {
        case .getList:
            return "https://shopapi.io.mi.com/app/shopv3/pipe"
        case .getGoods:
            return ""
        }
        
    }
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getList:
            return .get
        default:
            return .post
        }
    }
  
    var parameters:[String: Any]? {
        switch self {
        case .getList(let psize):
            return [
                "GetList": [
                "model":"Article",
                "action":"GetList",
                "parameters": [
                    "psize":psize,
                    "list": "pinwei",
                    "pindex": 0
                ]
                ]]
        default:
            return [:]
        }
    }
    
    var header:[String: String]? {
        return [
            "content": "application/x-www-form-urlencoded; charset=utf-8",
            "Accept": "application/json"
        ]
    }
}



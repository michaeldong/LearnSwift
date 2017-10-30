//
//  YPTasteViewController.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 michaelxing. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class YPTasteViewController: UIViewController  {
    var goodsTableView : UITableView?
    var goodsData:[MJYPData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodsTableView = UITableView(frame: CGRect(x:0,
                                                   y:0,
                                                   width:UIScreen.main.bounds.width,
                                                   height:UIScreen.main.bounds.height))
        goodsTableView?.delegate = self
        goodsTableView?.dataSource = self
        goodsTableView?.register(YPTasteTableViewCell.self, forCellReuseIdentifier: "tastecell")
        self.view.addSubview(self.goodsTableView!)
        
        //开启自动计算高度
        goodsTableView?.estimatedRowHeight = 44//预估高度，随便设置
        goodsTableView?.rowHeight = UITableViewAutomaticDimension
        
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData() {
//        goodsData.add("michael")
        let  parameters: Parameters = [
            "GetList": [
                "model":"Article",
                "action":"GetList",
                "parameters": [
                    "psize":20,
                    "list": "pinwei",
                    "pindex": 0
                ]
            ]
        ]
        
        Alamofire.request("https://shopapi.io.mi.com/app/shopv3/pipe", method: .post, parameters: parameters, encoding: JSONEncoding(options: [])).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let goodsTasteJson : MJYPMappable = Mapper<MJYPMappable>().map(JSON: json as! [String : Any])!
                self.goodsData = goodsTasteJson.result?.getList?.data?.data
                self.goodsTableView?.reloadData()
            }
        }
    }
}

extension YPTasteViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let goodsData = goodsData {
            return goodsData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YPTasteTableViewCell = self.goodsTableView!.dequeueReusableCell(withIdentifier: "tastecell") as! YPTasteTableViewCell
        if let goodsData = goodsData {
            let mjypData = goodsData[indexPath.row]
            cell.titleLabel.text = mjypData.title
            cell.subtitleLabel.text = mjypData.subtitle
            if let picUrl = mjypData.picUrl {
                let url = URL(string: picUrl)
                cell.goodsImageView.kf.setImage(with: url)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

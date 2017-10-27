//
//  YPTasteViewController.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit
import Alamofire

class YPTasteViewController: UIViewController  {
    var goodsTableView : UITableView?
    var goodsData = NSMutableArray()
    
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
        
//MARK-- todo parser json response
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}

extension YPTasteViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YPTasteTableViewCell = self.goodsTableView!.dequeueReusableCell(withIdentifier: "tastecell") as! YPTasteTableViewCell
        
        cell.titleLabel.text = (goodsData[indexPath.row] as! String)
        
        return cell
    }
}

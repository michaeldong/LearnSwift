//
//  YPTasteViewController.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit

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
        goodsData.add("michael")
        goodsData.add("xing")
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

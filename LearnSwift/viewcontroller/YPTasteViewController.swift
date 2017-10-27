//
//  YPTasteViewController.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/27.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit

class YPTasteViewController: UIViewController  {
    var goodCollectView : UICollectionView?
    var goodsData = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let rect : CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        goodCollectView = UICollectionView(frame: rect, collectionViewLayout: layout)
        goodCollectView?.backgroundColor = UIColor.clear
        goodCollectView!.register(YPTasteCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        goodCollectView!.register(YPTasteCollectionViewCell.self, forSupplementaryViewOfKind:"UICollectionElementKindSectionHeader", withReuseIdentifier: "header")
        goodCollectView!.register(YPTasteCollectionViewCell.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: "footer")
        
        self.view.addSubview(goodCollectView!)
        self.goodCollectView?.dataSource = self
        self.goodCollectView?.delegate = self
        
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

extension YPTasteViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! YPTasteCollectionViewCell
        cell.titleLabel?.text =  (goodsData[indexPath.row] as! String)
        
        return cell
    }
    
//    //这个是设定header和footer的方法，根据kind不同进行不同的判断即可
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == "UICollectionElementKindSectionHeader"{
//            let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "header", for: indexPath) as! IMCollectionReusableView
//            resuableView.resuableKindLabel.text = "header"
//            resuableView.backgroundColor = UIColor.red
//            return resuableView
//        }else{
//            let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: "footer", for: indexPath) as! IMCollectionReusableView
//            resuableView.resuableKindLabel.text = "footer"
//            resuableView.backgroundColor = UIColor.blue
//            return resuableView
//        }
//    }
//    //header高度
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.1)
//    }
//    //footer高度
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.1)
//    }

}

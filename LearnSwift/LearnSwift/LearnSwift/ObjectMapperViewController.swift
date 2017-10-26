//
//  ObjectMapperViewController.swift
//  LearnSwift
//
//  Created by michaelxing on 2017/10/26.
//  Copyright © 2017年 xiaomi. All rights reserved.
//

import UIKit
import ObjectMapper

class ObjectMapperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        if let path = Bundle.main.path(forResource: "objectMapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonStr  = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                if let jsonStr = jsonStr {
//                    let mjypObj = MJYPMappable(JSONString:jsonStr as String)
                    let mjypObj = Mapper<MJYPMappable>().map(JSONString: jsonStr as String)
                  //  print(mjypObj as Any)
                    print(mjypObj?.code!)
                }
               
            } catch {
                // handle error
            }
        }
        
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

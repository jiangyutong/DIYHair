//
//  ViewController.swift
//  try
//
//  Created by jiang on 2018/10/7.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit
import LeanCloud
import AVOSCloud
class ViewController: UIViewController {

    @IBOutlet weak var te: UIImageView!
  
    var image1=UIImage(named: "baiyun")
    var image2=UIImage(named: "baiyun")
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let data=UIImagePNGRepresentation(image1!)
        let file=AVFile(data: data!)
        let obj=AVObject(className: "Todo")
        obj.setObject(file, forKey: "image")
        obj.saveInBackground({ (resultbool, error) in
            if(resultbool){
               
            }else{
                
            }
        })
        let  query=AVQuery(className: "Todo")
        query.whereKey("objectId", equalTo: "5bc6acc99f545400707f2485")
        let temp=query.findObjects() as! [AVObject]
        if(temp.count>0)
        {
            let U=temp[0]["image"] as! AVFile
            image2=UIImage(data: U.getData()!)
        }
        // Do any additional setup after loading the view, typically from a nib.
        
      te.image=image2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


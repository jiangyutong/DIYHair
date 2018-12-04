//
//  BarberViewController.swift
//  DIY Hair
//
//  Created by Guozhouqian on 2018/12/3.
//  Copyright © 2018 blueGrey. All rights reserved.
//

import UIKit

class BarberViewController: UIViewController{

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func login(_ sender: Any) {
        if(userName.text == "admin" && passWord.text == "admin"){
            print("登陆成功，跳转到首页面")
             let fourth = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePage")
            present(fourth, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "登录失败", message: "不存在该用户，登陆失败", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                print("重新输入！！！")
            }))
            present(alert, animated: true, completion: nil)
            userName.text = ""
            passWord.text = ""
        }
        //失去焦点
        userName.resignFirstResponder()
        passWord.resignFirstResponder()
    }
    
    
    //当点击外部，软键盘消失
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

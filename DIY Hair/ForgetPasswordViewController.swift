//
//  ForgetPasswordViewController.swift
//  DIY Hair
//
//  Created by Guozhouqian on 2018/12/3.
//  Copyright © 2018 blueGrey. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var verification: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginVerification(_ sender: Any) {
        if(telephone.text != "" && verification.text != ""){  //不为空
            let alert = UIAlertController(title: "找回密码成功", message: "找回密码成功，返回登录界面进行登录！！", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            print("找回密码成功，返回登陆界面！！！")
        }else{
            let alert = UIAlertController(title: "找回密码失败", message: "验证码失效/错误！！！！", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                print("重新输入！！！")
            }))
            present(alert, animated: true, completion: nil)
            
            telephone.text = "";
            verification.text = "";
        }
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

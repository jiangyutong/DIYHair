//
//  registerViewController.swift
//  DIY Hair
//
//  Created by Guozhouqian on 2018/12/3.
//  Copyright © 2018 blueGrey. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var passWordSecond: UITextField!
    @IBOutlet weak var typy: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var addr: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //隐藏密码
        passWord.isSecureTextEntry = true
        passWordSecond.isSecureTextEntry = true

    }

    @IBAction func register(_ sender: Any) {
        if(userName.text == "" || passWord.text == "" || passWordSecond.text == "" ||
            typy.text == "" || sex.text == "" || addr.text == ""){
            let alert = UIAlertController(title: "注册失败", message: "请输入完整的信息！！！", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                print("重新输入！！！")
            }))
            present(alert, animated: true, completion: nil)
            print("请输入完整的信息！！！")
            userName.text = ""
            passWord.text = ""
            passWordSecond.text = ""
            typy.text = ""
            sex.text = ""
            addr.text = ""
        }
        else if(passWord.text != passWordSecond.text){
            let alert = UIAlertController(title: "注册失败", message: "两次输入密码不一致！！", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                print("重新输入！！！")
            }))
            present(alert, animated: true, completion: nil)
            print("两次输入密码不一致！！")
            userName.text = ""
            passWord.text = ""
            passWordSecond.text = ""
            typy.text = ""
            sex.text = ""
            addr.text = ""
        }
        else{
            let alert = UIAlertController(title: "注册成功", message: "注册成功，返回登录界面进行登录！！", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            print("注册成功，返回登陆界面！！！")
        }
        //失去焦点
        userName.resignFirstResponder()
        passWord.resignFirstResponder()
        passWordSecond.resignFirstResponder()
        typy.resignFirstResponder()
        sex.resignFirstResponder()
        addr.resignFirstResponder()
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

//
//  LoginViewController.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var userName = UITextField()
    var passWord = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.yellow
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KSCREEN_HEIGHT))
        imageView.image = UIImage(named: "login_back")
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        
        
        let login = UIButton(type: .custom)
        login.frame = CGRect(x: 50, y: KSCREEN_HEIGHT / 2 + 10, width: KSCREEN_WIDTH - 100, height: 50)
        login.backgroundColor = UIColor(colorLiteralRed: 250/255.0, green: 80/255.0, blue: 50/255.0, alpha: 1)
        login.setTitle("登录", for: .normal)
        login.setTitleColor(UIColor.white, for: .normal)
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        login.addTarget(self, action: #selector(loginAccount), for: .touchUpInside)
        self.view.addSubview(login)
        
        
        userName = UITextField(frame: CGRect(x: 50, y: KSCREEN_HEIGHT / 2 - 100, width: KSCREEN_WIDTH - 100, height: 40))
        userName.placeholder = "请输入账号"
        userName.clearButtonMode = .always
        userName.layer.borderWidth = 1.0
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.cornerRadius = 5.0
        self.view.addSubview(userName)
        
        passWord = UITextField(frame: CGRect(x: 50, y: KSCREEN_HEIGHT / 2 - 50, width: KSCREEN_WIDTH - 100, height: 40))
        passWord.placeholder = "请输入密码"
        passWord.clearButtonMode = .always
        passWord.isSecureTextEntry = true
        passWord.layer.borderWidth = 1.0
        passWord.layer.borderColor = UIColor.lightGray.cgColor
        passWord.layer.cornerRadius = 5.0
        passWord.returnKeyType = .done
        self.view.addSubview(passWord)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //导航隐藏
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func loginAccount() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginStateChange), object: true, userInfo:nil)
        if userName.text == "123456" && passWord.text == "123456" {
        }else{
            print("账号或者密码错误")
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

//
//  MineViewController.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.darkText
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: self.view.frame.size.width - 100, height: 50)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        self.view.addSubview(button)

    }

    
    
    func logout() {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: LoginStateChange), object: false)
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

//
//  HomeViewController.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        self.view.backgroundColor = ColorRandom()
        
        
        self.view.addSubview(button)
        
    }
    fileprivate lazy var button:UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: self.view.frame.size.width - 100, height: 50)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(nextViewController), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func nextViewController(){
        let viewController = ServiceViewController()
        
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
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

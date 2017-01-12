//
//  MainViewController.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let viewControllerArray = ["HomeViewController","MassageViewController","ContactViewController","MineViewController"]
//        let titleArray = ["首页","最新","联系人","我"]
//        let imageArray = ["tab-home","tab-time","tab-guan","tab-mine"]
//        let selectedImage = ["tab-home1","tab-time1","tab-guan1","tab-mine1"]
//        
//        
//        let tabBarController = LCTabBar(viewControllerArray: viewControllerArray, titleArray: titleArray, imageArray: imageArray, selectedImageArray: selectedImage, height: 49.0)
        
        
        
        
        
        
        
//        addChildController(viewC: HomeViewController(), title: "首页", image: "tab-home", selectImage: "tab-home1")
//        addChildController(viewC: MessageViewController(), title: "最新", image: "tab-time", selectImage: "tab-time1")
////        addChildController(viewC: ContactViewController(), title: "", image: "tab-add", selectImage: "tab-add")
//        addChildController(viewC: ServiceViewController(), title: "关注", image: "tab-guan", selectImage: "tab-guan1")
//        addChildController(viewC: MineViewController(), title: "我", image: "tab-mine", selectImage: "tab-mine1")
    }
    
    
    func addChildController(viewC:UIViewController ,title:String ,image:String ,selectImage:String) {
        
        let navi = UINavigationController(rootViewController: viewC)
        //背景色
//        navi.navigationBar.barTintColor = UIColor.black
        //标题颜色，大小
        navi.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20),NSForegroundColorAttributeName:UIColor.white]
        //tabbar
        navi.tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal))
        //选中的时候字体颜色
        navi.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .selected)
        addChildViewController(navi)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



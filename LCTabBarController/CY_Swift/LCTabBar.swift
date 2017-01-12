//
//  LCTabBar.swift
//  CY_Swift
//
//  Created by LC on 17/1/11.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit


/// tabbar背景色
private let TabBarColor = UIColor.white

/// title默认颜色
private let TitleColor = UIColor.gray

/// title选中颜色
private let TitleSelectedColor = UIColor.orange

/// title字体大小
private let TitleFontSize : CGFloat = 14.0

/// 数字角标直径
private let NumberMarkDiameter:CGFloat = 20.0

/// 小红点直径
private let PointMarkDiameter:CGFloat = 12.0

/// button 图片与文字上下占比
private let Scale:CGFloat = 0.55

open class LCTabBar: UITabBarController {
    
    var selectedButton: UIButton?
    var tabBarHeight:CGFloat = 49.0
    
    /// viewController数组
    var viewControllerArray = [String]()
    
    /// 标题数组
    var titleArray = [String]()
    
    /// 图片数组
    var imageArray = [String]()
    
    /// 选择图片数组
    var selectedImageArray = [String]()
    
    
    public init(viewControllerArray: [String],titleArray: [String],imageArray: [String],selectedImageArray: [String],height: CGFloat?) {
        self.viewControllerArray = viewControllerArray
        self.titleArray = titleArray
        self.imageArray = imageArray
        self.selectedImageArray = selectedImageArray
        if let tempHeight = height {
            self.tabBarHeight = tempHeight
        }
        if self.tabBarHeight < 49.0 {
            self.tabBarHeight = 49.0
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createViewController()
        self.tabBar.addSubview(customTabBar)
        addTabBarButton()
        self.setUpTabBarLine()
    }
    
    //MARK: - 添加控制器
    fileprivate func createViewController(){
        guard self.viewControllerArray.count > 0 else {
            return
        }
        
        var naviArray = [UIViewController]()
        //获取命名空间
        guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有命名空间")
            return
        }

        for (index, className) in self.viewControllerArray.enumerated() {
            
            guard let childVcClass = NSClassFromString(nameSpage + "." + className) else {
                print(nameSpage + "." + className)
                print("没有获取到对应的class")
                return
            }
            
            guard let childVcType = childVcClass as? UIViewController.Type else {
                print("没有得到的类型")
                return
            }
            let vc = childVcType.init()
            
            vc.title = self.titleArray[index]
            let nav = UINavigationController(rootViewController:vc)
            naviArray.append(nav)
        }
        
        viewControllers  = naviArray;
        
    }
    
    //MARK: - 移除系统创建的UITabBarButton
    fileprivate func removeTabBarButton()
    {
        for view in tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                view.removeFromSuperview()
            }
        }
        
    }
    
    //MARK: - 添加tabbarButton
    fileprivate func addTabBarButton()
    {
        
        let num = self.viewControllerArray.count
        for i in 0 ..< num {
            
            let  width = UIScreen.main.bounds.size.width
            let  x = CGFloat(width/CGFloat(num)*CGFloat(i))
            let  y:CGFloat = 0.0
            let  w = width/CGFloat(num)
            let  h = tabBarHeight
            let button = LCTabBarButton(frame:CGRect(x: x,y: y,width: w,height: h))
            
            button.tag = 1000+i
            button.setTitleColor(TitleColor, for: UIControlState())
            button.setTitleColor(TitleSelectedColor, for: UIControlState.selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: TitleFontSize)
            button.setImage(UIImage.init(named:self.imageArray[i]), for: UIControlState())
            button.setImage(UIImage.init(named: self.selectedImageArray[i]), for: UIControlState.selected)
            button.setTitle(self.titleArray[i], for: UIControlState())
            button.addTarget(self, action:#selector(buttonAction(_:)), for: .touchDown)
            
            customTabBar.addSubview(button)
            
            //默认选中
            if i == 0 {
                
                button.isSelected = true
                self.selectedButton = button
            }
            
            //角标
            let numLabel = UILabel(frame: CGRect(x: button.frame.size.width/2.0+6, y: 3, width: NumberMarkDiameter, height: NumberMarkDiameter))
            numLabel.layer.masksToBounds = true
            numLabel.layer.cornerRadius = 10
            numLabel.backgroundColor = UIColor.red
            numLabel.textColor = UIColor.white
            numLabel.textAlignment = NSTextAlignment.center
            numLabel.font = UIFont.systemFont(ofSize: 13)
            numLabel.tag = 1020+i
            numLabel.isHidden = true
            button.addSubview(numLabel)
        }
    }
    
    //MARK: - Action
    @objc fileprivate func buttonAction(_ button: UIButton) {
        let index: Int = button.tag-1000
        self.showControllerIndex(index)
    }
    
    
    //MARK: - tabBar顶部线
    fileprivate func setUpTabBarLine(){
        guard self.tabBarHeight > 49.0 else {
            return
        }
        
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        let line = UIView(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        self.tabBar.addSubview(line)
    }
    
    
    
    
    //MARK: - 懒加载
    fileprivate lazy var customTabBar: UIView = {
        let x = CGFloat(0)
        let y = 49.0 - self.tabBarHeight
        let width = KSCREEN_WIDTH
        let height = self.tabBarHeight
        
        let view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = TabBarColor
        
        return view
    }()

}


extension LCTabBar{

    /// 切换显示控制器
    ///
    /// - Parameter index: 位置
    public func showControllerIndex(_ index: Int) {
        
        guard index < self.viewControllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        self.selectedButton!.isSelected = false
        let button = (customTabBar.viewWithTag(1000+index) as? UIButton)!
        button.isSelected = true
        self.selectedButton = button
        self.selectedIndex = index
    }
    
    /// 设置数字角标
    ///
    /// - Parameters:
    ///   - badge: 所要显示数字
    ///   - index: 位置
    public func showBadgeMark(_ badge: Int, index: Int) {
        
        guard index < self.viewControllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        
        let numLabel = (customTabBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var numFrame = numLabel.frame
        if badge <= 0 {
            //隐藏角标
            self.hideMarkIndex(index)
            
        } else {
            
            if badge > 0 && badge <= 9 {
                
                numFrame.size.width = NumberMarkDiameter
                
            } else if badge > 9 && badge <= 19 {
                
                numFrame.size.width = NumberMarkDiameter+5
                
            } else {
                
                numFrame.size.width = NumberMarkDiameter+10
                
            }
            numFrame.size.height = NumberMarkDiameter
            numLabel.frame = numFrame
            numLabel.layer.cornerRadius = NumberMarkDiameter/2.0
            numLabel.text = "\(badge)"
            if badge > 99 {
                numLabel.text = "99+"
            }
            
        }
    }
    
    /// 设置小红点
    ///
    /// - Parameter index: 位置
    public func showPointMarkIndex(_ index: Int) {
        guard index < self.viewControllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (customTabBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var numFrame = numLabel.frame
        numFrame.size.height = PointMarkDiameter
        numFrame.size.width = PointMarkDiameter
        numLabel.frame = numFrame
        numLabel.layer.cornerRadius = PointMarkDiameter/2.0
        numLabel.text = ""
    }
    

    /// 影藏指定位置角标
    ///
    /// - Parameter index: 位置
    public func hideMarkIndex(_ index: Int) {
        guard index < self.viewControllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (customTabBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = true
    }
    
}


//MARK: - TabBarButton
class LCTabBarButton:UIButton {
    
    override var isHighlighted: Bool{
        
        didSet{
            super.isHighlighted = false
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel?.textAlignment = NSTextAlignment.center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX:CGFloat = 0.0
        let newY:CGFloat = 5.0
        let newWidth:CGFloat = CGFloat(contentRect.size.width)
        let newHeight:CGFloat = CGFloat(contentRect.size.height)*Scale-newY
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*Scale
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*Scale
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }
    
}




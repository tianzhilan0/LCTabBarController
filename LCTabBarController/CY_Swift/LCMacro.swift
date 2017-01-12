//
//  LCMacro.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

/// 屏幕宽带
let KSCREEN_WIDTH:CGFloat = UIScreen.main.bounds.width

/// 屏幕高度
let KSCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.height


/// rgba颜色
func RGBACOLOR(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    
    return UIColor(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:a)
}

/// rgb颜色
func RGBCOLOR(_ r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return RGBACOLOR(r, g: g, b: b, a: 1.0)
}

/// 随机颜色
func ColorRandom() -> UIColor {
    
    return RGBCOLOR(CGFloat(arc4random()%255), g: CGFloat(arc4random()%255), b: CGFloat(arc4random()%255))
}




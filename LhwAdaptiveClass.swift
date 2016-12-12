//
//  LhwAdaptiveClass.swift
//  LhwTestSwiftAdaptive
//
//  Created by 鲁宏伟 on 16/11/25.
//  Copyright © 2016年 鲁宏伟. All rights reserved.
//
//  屏幕适配

import UIKit

public class LhwAdaptiveClass: NSObject {



}

/// 屏幕适配
///
/// - Returns: 屏幕宽度
func Lhw_ScreenW() -> CGFloat {
    let size:CGRect = UIScreen.main.bounds
    
    return CGFloat(size.width)
}
/// 屏幕适配
///
/// - Returns: 屏幕高度
func Lhw_ScreenH() -> CGFloat {
    let size:CGRect = UIScreen.main.bounds
    return CGFloat(size.height)
}

/// 屏幕缩放比例
///
/// - Returns: 与ip6屏幕对比之后的缩放大小(宽度)
func Lhw_RateW() -> CGFloat{
    return (Lhw_ScreenW()/375)
}

/// 屏幕缩放比例
///
/// - Returns: 与ip6屏幕对比之后的缩放大小(高度)
func Lhw_RateH() -> CGFloat{
    var heighttmp:CGFloat = 0.0
    if Lhw_ScreenH() == 480 {
        heighttmp = 568
    }else{
        heighttmp = Lhw_ScreenH()
    }
    return heighttmp/667
}

/// 控件的比例缩放
/// - Parameter W: 输入的控件大小
/// - Returns:  输入控件的大小按比例缩放后的大小(宽度)
func Lhw_AdaptW(W: CGFloat) -> CGFloat {
    return W*Lhw_RateW()
}

/// 控件的比例缩放
/// - Parameter H: 输入的控件高度
/// - Returns:  输入控件的大小按比例缩放后的大小(宽度)
func Lhw_AdaptH(H: CGFloat) -> CGFloat {
    if H == 667 && Lhw_ScreenH() == 480 {
        return 480
    }else{
        return H*Lhw_RateH()
    }
}

/// ScrollView控件的比例缩放
/// - Parameter H: 输入的控件高度
/// - Returns:  输入控件的大小按比例缩放后的大小(宽度)
func Lhw_SLAdaptH(H: CGFloat) -> CGFloat {
    if H == 667 && Lhw_ScreenH() == 480 {
        return 568
    }else{
        return H*Lhw_RateH()
    }
}

/// Font适配
///
/// - Parameter fontSize: ip6上出入的标准字号
/// - Returns: 根据屏幕缩放后的字号
func Lhw__font(fontSize:CGFloat) -> UIFont {
    let fot =  UIFont.systemFont(ofSize: 12)
    return  fot
}
 

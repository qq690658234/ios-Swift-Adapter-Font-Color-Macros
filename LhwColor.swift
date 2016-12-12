//
//  LhwColor.swift
//
//
//  Created by 鲁宏伟 on 16/11/8.
//  Copyright © 2016年 鲁宏伟. All rights reserved.
//
//16进制颜色转变宏


import UIKit

class LhwColor: UIColor {

}
extension UIColor {
    convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    convenience init?(hexString: String, alpha: Float) {
        let set = NSCharacterSet.whitespacesAndNewlines
        var hex = hexString.trimmingCharacters(in: set).uppercased()
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        guard let hexVal = Int(hex, radix: 16) else {
            self.init()
            return nil
        }
        switch hex.characters.count {
        case 3:
            self.init(hex3: hexVal, alpha: alpha)
        case 6:
            self.init(hex6: hexVal, alpha: alpha)
        default:
            self.init()
            return nil
        }
    }
    convenience init?(hexNumber: Int) {
        self.init(hexNumber: hexNumber, alpha: 1.0)
    }
    convenience init?(hexNumber: Int, alpha: Float) {
        guard (0x000000 ... 0xFFFFFF) ~= hexNumber else {
            self.init()
            return nil
        }
        self.init(hex6: hexNumber, alpha: alpha)
    }
}

// MARK: - 例如0x999999
private extension UIColor {
    convenience init?(hex3: Int, alpha: Float) {
        self.init(red:   CGFloat( ((hex3 & 0xF00) >> 8).duplicate4bits() ) / 255.0,
                  green: CGFloat( ((hex3 & 0x0F0) >> 4).duplicate4bits() ) / 255.0,
                  blue:  CGFloat( ((hex3 & 0x00F) >> 0).duplicate4bits() ) / 255.0,
                  alpha: CGFloat(alpha))
    }
    
    convenience init?(hex6: Int, alpha: Float) {
        self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0,
                  alpha: CGFloat(alpha))
    }
}

private extension Int {
    func duplicate4bits() -> Int {
        return (self << 4) + self
    }
}

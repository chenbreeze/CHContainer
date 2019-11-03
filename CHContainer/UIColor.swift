//
//  UIColor.swift
//  CHContainer
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit

extension UIColor{
    static var random: UIColor{
        let red = CGFloat(Int.random(in: 0...255)) / 255.0
        let green = CGFloat(Int.random(in: 0...255)) / 255.0
        let blue = CGFloat(Int.random(in: 0...255)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

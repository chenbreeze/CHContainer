//
//  CHContainerItemViewType.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit

/// 表示一个视图
public protocol CHContainerItemViewType: UIView{
    static func height(with model: CHContainerItemModelType) -> CGFloat
    func config(with model: CHContainerItemModelType)
    
    func setEventHanlder(_ hanlder: AnyObject)
}

public extension CHContainerItemViewType{
    func setEventHanlder(_ hanlder: AnyObject) {}
}



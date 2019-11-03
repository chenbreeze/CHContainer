//
//  CHContainerItemModelType.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation


/// 表示一个数据
public protocol CHContainerItemModelType {
    var viewId: String { get }
    var isValid: Bool{ get }
}

extension CHContainerItemModelType{
    var isValid: Bool {
        return true
    }
}


//
//  EventActionConfig.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

struct CHContainerEventConfig {
    private lazy var actions: [String : CHContainerEventAction] = [:]
    
    mutating func registe(tapAction action: CHContainerEventAction, with viewId:String){
        actions[viewId] = action
    }
    
    mutating func action(for viewId: String) -> CHContainerEventAction?{
        return actions[viewId]
    }
}



//
//  CHContainerEventAction.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

typealias EventActionType = (_ model: CHContainerItemModelType, _ view: CHContainerItemViewType) -> Void

protocol CHContainerEventAction {
    var tapAction: EventActionType { get }
}


struct EventActionWarpper: CHContainerEventAction{
    let tapAction: EventActionType
    init(_ tapAction: @escaping EventActionType){
        self.tapAction = tapAction
    }
}

//
//  Optional+.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

extension Optional{
    func `do`(_ action: (Wrapped) -> Void){
        map(action)
    }
}

//
//  DemoCell1.swift
//  CHContainer
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit

class DemoCell1: UIView {

 override init(frame: CGRect) {
     super.init(frame: frame)
     backgroundColor = UIColor.random
 }
 
 required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }

}

extension DemoCell1: CHContainerItemViewType{
    static func height(with model: CHContainerItemModelType) -> CGFloat {
        return 100.0
    }
    
    func config(with model: CHContainerItemModelType) {
        
    }
}

//
//  DemoHeader1.swift
//  CHContainer
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit

class DemoHeader1: UITableViewHeaderFooterView{
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.random
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DemoHeader1: CHContainerItemViewType{
    static func height(with model: CHContainerItemModelType) -> CGFloat {
        return 150.0
    }
    
    func config(with model: CHContainerItemModelType) {
        
    }
}

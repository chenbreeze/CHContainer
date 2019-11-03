//
//  CHContainerable.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/25.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit
import SnapKit

final class CHContainerBearerHeaderFooter: UITableViewHeaderFooterView {}
final class CHContainerBearerCell: UITableViewCell {}

protocol CHBearerable {
    var customContent: CHContainerItemViewType? { set get }
}

protocol ContentViewable {
    var contentView: UIView { get }
}

extension CHContainerBearerCell: ContentViewable{}
extension CHContainerBearerHeaderFooter: ContentViewable{}

extension CHContainerBearerCell: CHBearerable {}
extension CHContainerBearerHeaderFooter: CHBearerable {}

struct CHContainerableAssociatedKeys {
    static var CustomView: UInt8 = 0
}

extension CHBearerable where Self: ContentViewable{
    var customContent: CHContainerItemViewType? {
          set {
            
            switch (customContent, newValue) {
                case (let old?, let new?):
                    if  old === new {
                        return
                    }else{
                        old.removeFromSuperview()
                        self.contentView.addSubview(new)
                        new.snp.makeConstraints { (maker) in
                            maker.left.right.top.equalTo(self.contentView)
                            maker.bottom.equalTo(self.contentView).priorityMedium()
                        }
                    }
                case (let old?, nil):
                    old.removeFromSuperview()
                case (nil, let new?):
                    self.contentView.addSubview(new)
                    new.snp.makeConstraints { (maker) in
                        maker.left.right.top.equalTo(self.contentView)
                        maker.bottom.equalTo(self.contentView).priorityMedium()
                    }
                case (nil, nil):
                    break
             }
            
            objc_setAssociatedObject(self, &CHContainerableAssociatedKeys.CustomView, newValue, .OBJC_ASSOCIATION_RETAIN)
                      
          }
          
          get {
              let obj: CHContainerItemViewType? = objc_getAssociatedObject(self, &CHContainerableAssociatedKeys.CustomView) as? CHContainerItemViewType
              return obj
          }
    }
}



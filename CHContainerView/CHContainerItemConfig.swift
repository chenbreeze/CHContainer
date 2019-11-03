//
//  CHContainerItemConfig.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

typealias CHContainerItemViewClass = CHContainerItemViewType.Type

struct CHContainerItemConfig {
     lazy var cell: [String: CHContainerItemViewClass] = [:]
     lazy var sectionHeaderFooter: [String: CHContainerItemViewClass] = [:]
    
    @discardableResult
     mutating func registe(cellClass: CHContainerItemViewClass, with viewId: String) -> Bool{
        guard viewId.count > 0 else {
            return false
        }
        
        cell[viewId] = cellClass
        return true
    }
    
    @discardableResult
    mutating func registe(sectionHeaderFooterClass: CHContainerItemViewClass, with viewId: String) -> Bool{
        guard viewId.count > 0 else {
            return false
        }
        
        sectionHeaderFooter[viewId] = sectionHeaderFooterClass
        return true
    }
    
    public mutating func cell(for viewId: String) -> CHContainerItemViewClass?{
         cell[viewId]
    }
    
    mutating func sectionHeaderFooter(for viewId: String) -> CHContainerItemViewClass?{
        sectionHeaderFooter[viewId]
    }
}

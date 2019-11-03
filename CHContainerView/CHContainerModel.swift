//
//  CHContainerModel.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

/// 表示一个section
final class CHContainerSectionModel {
   public var header: CHContainerItemModelType?
   public var footer: CHContainerItemModelType?
   public var rows = [CHContainerItemModelType]()
}

extension CHContainerSectionModel{
    var isValid: Bool{
        let rowsValid = realRows.count > 0
        let headerValid = header?.isValid ?? false
        let footerValid = footer?.isValid ?? false
        return rowsValid || headerValid || footerValid
    }
    
    fileprivate var realRows: [CHContainerItemModelType]{
       return rows.filter { $0.isValid }
    }
}

/// 表示section的集合
final class CHContainerModel {
   public var sections = [CHContainerSectionModel]()
}

extension CHContainerModel{
    private var realSections: [CHContainerSectionModel]{
        return sections.filter { $0.isValid }
    }
    
    var sectionCount: NSInteger{
        return realSections.count
    }
    
    func rowCount(of section: NSInteger) -> NSInteger{
        guard section < realSections.count else { return 0 }
        return realSections[section].realRows.count
    }
    
    func itemModel(of indexPath: IndexPath) -> CHContainerItemModelType?{
        guard indexPath.section < realSections.count else { return nil }
        let section = realSections[indexPath.section]
        guard indexPath.row < section.realRows.count else { return nil }
        return section.realRows[indexPath.row]
    }
    
    func header(of section: NSInteger) -> CHContainerItemModelType?{
        guard section < realSections.count else { return nil }
        return realSections[section].header
    }
    
    func footer(of section: NSInteger) -> CHContainerItemModelType?{
        guard section < realSections.count else { return nil }
        return realSections[section].footer
    }
}




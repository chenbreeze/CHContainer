//
//  CHContainerModelController.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit


/// 负责tableview配置
class CHContainerModelController: NSObject{
    var model: CHContainerModel = CHContainerModel()
    var viewConfig: CHContainerItemConfig
    var actionConfig: CHContainerEventConfig
    
    weak var delegte: CHContainerViewDelegate?
    weak var eventHanlder: AnyObject?
    
   required init(viewConfig: CHContainerItemConfig,
               actionConfig: CHContainerEventConfig) {
         self.viewConfig = viewConfig;
         self.actionConfig = actionConfig
         super.init()
      }
    
}

extension CHContainerModelController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.rowCount(of: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sectionCount
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         let _cellModel = model.itemModel(of: indexPath)
         guard let cellModel = _cellModel else { return 0.0 }
        
         let viewClass = viewConfig.cell(for: cellModel.viewId)
         if let rClass = viewClass {
             return rClass.height(with: cellModel)
         }else{
             return 0.0
         }
     }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let _footerModel = model.footer(of: NSInteger(section))
        guard let footerModel = _footerModel else { return 0.0 }
        let _viewCls = viewConfig.sectionHeaderFooter(for: footerModel.viewId)
        guard let viewCls = _viewCls else { return 0.0 }
        return viewCls.height(with: footerModel)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let _footerModel = model.header(of: NSInteger(section))
        guard let footerModel = _footerModel else { return 0.0 }
        let _viewCls = viewConfig.sectionHeaderFooter(for: footerModel.viewId)
        guard let viewCls = _viewCls else { return 0.0 }
        return viewCls.height(with: footerModel)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let _model = self.model.header(of: section)
        guard let model = _model else { return nil }
        let _cls = self.viewConfig.sectionHeaderFooter(for: model.viewId)
        guard let cls = _cls else { return nil }
        
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.viewId)
        if (header == nil){
            header = cls.init() as? UITableViewHeaderFooterView
        }
        
        var realHeader: CHContainerItemViewType!
        if let header = header as? CHContainerItemViewType{
            realHeader = header
        }else if var header = header as? CHBearerable{
            if let content = header.customContent {
                realHeader = content
            }else{
                realHeader = cls.init()
                header.customContent = realHeader
            }
        }else{
            return nil
        }
        
        realHeader.config(with: model)
        eventHanlder.do {
            realHeader.setEventHanlder($0)
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let _model = self.model.footer(of: section)
        guard let model = _model else { return nil }
        let _cls = self.viewConfig.sectionHeaderFooter(for: model.viewId)
        guard let cls = _cls else { return nil }
        
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.viewId)
        if (header == nil){
            header = cls.init() as? UITableViewHeaderFooterView
        }
        
        var realHeader: CHContainerItemViewType!
        if let header = header as? CHContainerItemViewType{
            realHeader = header
        }else if var header = header as? CHBearerable{
            if let content = header.customContent {
                realHeader = content
            }else{
                realHeader = cls.init()
                header.customContent = realHeader
            }
        }else{
            return nil
        }
        
        realHeader.config(with: model)
        eventHanlder.do {
            realHeader.setEventHanlder($0)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let _cellModel = model.itemModel(of: indexPath)
        
        guard let cellModel = _cellModel else { fatalError("不能识别cell") }
        
        guard let cls = viewConfig.cell(for: cellModel.viewId) else{
            fatalError("缺少注册Cell");
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.viewId, for: indexPath)
        
        var realView: CHContainerItemViewType!
        if let view = cell as? CHContainerItemViewType {
            realView = view
        }else if var view = cell as? CHBearerable {
            if let content = view.customContent {
                realView = content
            }else{
                realView = cls.init()
                view.customContent = realView
            }
        }else{
            fatalError("不能识别cell");
        }
        
        realView.config(with: cellModel)
        eventHanlder.do {
            realView.setEventHanlder($0)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let model = self.model.itemModel(of: indexPath)!
        
        var view: CHContainerItemViewType!
        if let cell = cell as? CHContainerItemViewType{
            view = cell
        }else if let cell = cell as? CHBearerable{
            view = cell.customContent!
        }
        
     
        if  let action = self.actionConfig.action(for: model.viewId) {
            action.tapAction(model, view)
            
        }
    }
    
    // MARK: chcontainerview delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let delegate = self.delegte, let container = scrollView.superview as? CHContainerView {
            delegate.containerViewDidScroll(view: container)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if let delegate = self.delegte, let container = scrollView.superview as? CHContainerView {
            delegate.containerViewWillBeginDragging(view: container)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let delegate = self.delegte, let container = scrollView.superview as? CHContainerView {
            delegate.containerViewDidEndDragging(view: container, willDecelete: decelerate)
        }
    }
    
    private func getRealView(_ view: UIView) -> CHContainerItemViewType?{
        if let view = view as? CHContainerItemViewType{
            return view
        }
        
        if let view = view as? CHBearerable{
            return view.customContent
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let delegate = self.delegte,
            let container = tableView.superview as? CHContainerView,
            let content = getRealView(view) {
            delegate.containerView(view: container,
                                   willDisplayFooterView: content,
                                   forSection: section)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        if let delegate = self.delegte,
            let container = tableView.superview as? CHContainerView,
            let content = getRealView(view) {
            delegate.containerView(view: container,
                                   didEndDisplayFooterView: content,
                                   forSection: section)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       if let delegate = self.delegte,
        let container = tableView.superview as? CHContainerView,
        let content = getRealView(cell) {
        delegate.containerView(view: container,
                               willDisplayCell: content,
                               for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let delegate = self.delegte,
            let container = tableView.superview as? CHContainerView,
            let content = getRealView(cell) {
            delegate.containerView(view: container,
                                   didEndDisplayCell: content,
                                   for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let delegate = self.delegte,
            let container = tableView.superview as? CHContainerView,
            let content = getRealView(view) {
            delegate.containerView(view: container,
                                   willDisplayHeaderView: content,
                                   forSection: section)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        if let delegate = self.delegte,
            let container = tableView.superview as? CHContainerView,
            let content = getRealView(view) {
            delegate.containerView(view: container,
                                   willDisplayFooterView: content,
                                   forSection: section)
        }
    }
}

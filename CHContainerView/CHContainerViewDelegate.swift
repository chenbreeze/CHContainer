//
//  CHContainerViewDelegate.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import Foundation

protocol CHContainerViewDelegate: class{
    func containerViewDidScroll(view: CHContainerView);
    func containerViewWillBeginDragging(view: CHContainerView);
    func containerViewDidEndDragging(view: CHContainerView, willDecelete decelerate: Bool);
    
    func containerView(view: CHContainerView, willDisplayFooterView footer: CHContainerItemViewType, forSection section: Int);
    func containerView(view: CHContainerView, willDisplayHeaderView header: CHContainerItemViewType, forSection section: Int);
    func containerView(view: CHContainerView, willDisplayCell cell: CHContainerItemViewType, for indexPath: IndexPath);
    
    func containerView(view: CHContainerView, didEndDisplayFooterView footer: CHContainerItemViewType, for section: Int);
    func containerView(view: CHContainerView, didEndDisplayHeaderView header: CHContainerItemViewType, for section: Int);
    func containerView(view: CHContainerView, didEndDisplayCell cell: CHContainerItemViewType, for indexPath: IndexPath);
}

extension CHContainerViewDelegate{
    func containerViewDidScroll(view: CHContainerView){}
    func containerViewWillBeginDragging(view: CHContainerView){}
    func containerViewDidEndDragging(view: CHContainerView, willDecelete decelerate: Bool){}
    
    func containerView(view: CHContainerView, willDisplayFooterView footer: CHContainerItemViewType, forSection section: Int){}
    func containerView(view: CHContainerView, willDisplayHeaderView header: CHContainerItemViewType, forSection section: Int){}
    func containerView(view: CHContainerView, willDisplayCell cell: CHContainerItemViewType, for indexPath: IndexPath){}
    
    func containerView(view: CHContainerView, didEndDisplayFooterView footer: CHContainerItemViewType, forSection section: Int){}
    func containerView(view: CHContainerView, didEndDisplayHeaderView header: CHContainerItemViewType, forSection section: Int){}
    func containerView(view: CHContainerView, didEndDisplayCell cell: CHContainerItemViewType, for indexPath: IndexPath){}
}

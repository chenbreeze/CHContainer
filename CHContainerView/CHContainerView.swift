//
//  CHContainerView.swift
//  CHContainerView
//
//  Created by chenxiaofeng on 2019/10/24.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit
import SnapKit

class CHContainerView: UIView {
    lazy var tableView: UITableView = UITableView.init(frame: CGRect.zero, style: .plain)
    private let modelController: CHContainerModelController
    
    required init(viewConfig: CHContainerItemConfig,
                  actionConfig: CHContainerEventConfig) {
        self.modelController = CHContainerModelController(viewConfig: viewConfig, actionConfig: actionConfig)
        super.init(frame: CGRect.zero)
        
        configTableView(viewConfig: viewConfig)
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CHContainerView{
    var delegate: CHContainerViewDelegate?{
         set{
             self.modelController.delegte = newValue
         }
         
         get{
             self.modelController.delegte
         }
     }
     
     var model: CHContainerModel{
         set{
             self.modelController.model = newValue
         }
         
         get{
              self.modelController.model
         }
     }
     
     var eventHanlder: AnyObject?{
         set{
             self.modelController.eventHanlder = newValue
         }
         
         get{
             self.modelController.eventHanlder
         }
     }
}


extension CHContainerView{
    private func configTableView(viewConfig: CHContainerItemConfig){
        tableView.dataSource =  modelController
        tableView.delegate = modelController
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self)
        }
        
        var viewConfig = viewConfig
        viewConfig.cell.forEach { (viewId, cls) in
            let isCell = cls.isSubclass(of: UITableViewCell.self)
            if isCell{
                tableView.register(cls, forCellReuseIdentifier: viewId)
            }else{
                tableView.register(CHContainerBearerCell.self, forCellReuseIdentifier: viewId)
            }
        }
        
        viewConfig.sectionHeaderFooter.forEach { (viewId, cls) in
            let isCell = cls.isSubclass(of: UITableViewHeaderFooterView.self)
            if isCell{
                tableView.register(cls, forHeaderFooterViewReuseIdentifier: viewId)
            }else{
                tableView.register(CHContainerBearerHeaderFooter.self, forHeaderFooterViewReuseIdentifier: viewId)
            }
        }
    }
}


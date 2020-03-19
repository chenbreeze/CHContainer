//
//  ViewController.swift
//  CHContainer
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var model: CHContainerModel{
        return self.container.model
    }

    lazy var container: CHContainerView = {
        var viewConfig = CHContainerItemConfig()
        viewConfig.registe(sectionHeaderFooterClass: DemoFooter.self, with: "DemoModel1")
        viewConfig.registe(sectionHeaderFooterClass: DemoFooter2.self, with: "DemoModel2")
        viewConfig.registe(cellClass: DemoCell1.self, with: "DemoModel3")
        viewConfig.registe(cellClass: DemoCell3.self, with: "DemoModel4")
        
        var eventConfig = CHContainerEventConfig()
        
        
        return CHContainerView(viewConfig: viewConfig, actionConfig: eventConfig)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(container)
        container.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
        
        let section = CHContainerSectionModel()
        section.header = DemoModel1()
        section.footer = DemoModel2()
        section.rows.append(DemoModel3())
        section.rows.append(DemoModel4())
        section.rows.append(DemoModel9())

        model.sections.append(section)
        
        
//        let section2 = CHContainerSectionModel()
//        section2.header = DemoModel1()
//        section2.footer = DemoModel2()
//        section2.rows.append(DemoModel3())
//        section2.rows.append(DemoModel4())
//        section2.rows.append(DemoModel9())
//        section2.rows.append(DemoModel3())
//        section2.rows.append(DemoModel4())
//        section2.rows.append(DemoModel9())
//        section2.rows.append(DemoModel3())
//        section2.rows.append(DemoModel4())
//        section2.rows.append(DemoModel9())
//
//        model.sections.append(section2)
        
        let section3 = CHContainerSectionModel()
        section3.rows.append(DemoModel9())
        section3.rows.append(DemoModel10())
        section3.rows.append(DemoModel9())

        model.sections.append(section3)
        
        container.tableView.reloadData()
    }

}


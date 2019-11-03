//
//  DemoCell4.swift
//  CHContainer
//
//  Created by chenxiaofeng on 2019/11/2.
//  Copyright © 2019 xuanlv.cgs.com. All rights reserved.
//

import UIKit

class DemoCell4: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.random
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       

}

extension DemoCell4: CHContainerItemViewType{
    static func height(with model: CHContainerItemModelType) -> CGFloat {
        return 100.0
    }
    
    func config(with model: CHContainerItemModelType) {
        
    }
}

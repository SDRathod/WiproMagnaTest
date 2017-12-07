//
//  FactCell.swift
//  WiproMagnaTest
//
//  Created by Samir Rathod on 07/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit

class FactCell: UITableViewCell {
    var imgThumb: UIImageView!
    var lblTitle: UILabel!
    var lblDesc: UILabel!
    var lblSep: UILabel!
    
    // MARK: -  init Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.allocControls()
    }
    
    // MARK: -  Cell Control Allocation
    func allocControls() {
        imgThumb = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        imgThumb.image = #imageLiteral(resourceName: "imgPlaceholder")
        self.contentView.addSubview(imgThumb)
        
        lblTitle = UILabel(frame: CGRect(x: imgThumb.frame.origin.x + imgThumb.frame.width + 5, y: 5, width: self.contentView.frame.width - imgThumb.frame.origin.x - imgThumb.frame.width - 5 - 5, height: 20))
        lblTitle.textColor = UIColor.darkGray
        lblTitle.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        lblTitle.numberOfLines = 0
        lblTitle.lineBreakMode = .byWordWrapping
        lblTitle.textAlignment = .justified
        self.contentView.addSubview(lblTitle)
        
        lblDesc = UILabel(frame: CGRect(x: imgThumb.frame.origin.x + imgThumb.frame.width + 5, y: lblTitle.frame.origin.y + lblTitle.frame.height + 5, width: self.contentView.frame.width - imgThumb.frame.origin.x - imgThumb.frame.width - 5 - 5, height: 20))
        lblDesc.textColor = UIColor.gray
        lblDesc.font = UIFont(name: "HelveticaNeue", size: 11)
        lblDesc.numberOfLines = 0
        lblDesc.lineBreakMode = .byWordWrapping
        lblDesc.textAlignment = .justified
        self.contentView.addSubview(lblDesc)
        
        lblSep = UILabel(frame: CGRect(x: 5, y: lblDesc.frame.origin.y + lblDesc.frame.height + 5, width: self.contentView.frame.width - 10, height: 1))
        lblSep.text = ""
        lblSep.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(lblSep)
    }
}

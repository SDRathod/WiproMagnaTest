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
    
    var minHeightConst: NSLayoutConstraint!
    
    // MARK: -  init Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.allocControls()
    }
    
    // MARK: -  Layout Subview Method
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.changeMinHeightConstVal()
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
        
        self.addImageConstraints()
        self.addTitleLabelConstraints()
        self.addDescLabelConstraints()
        self.addSepLabelConstraints()
        
        self.addMinHeightConst()
    }
    
    // MARK: -  Methods for adding Constraint 
    func addImageConstraints() {
        imgThumb.translatesAutoresizingMaskIntoConstraints = false
        imgThumb.superview?.translatesAutoresizingMaskIntoConstraints = true
        
        let leadingConst = NSLayoutConstraint(item: imgThumb, attribute: .leading, relatedBy: .equal, toItem: imgThumb.superview, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let topConst = NSLayoutConstraint(item: imgThumb, attribute: .top, relatedBy: .equal, toItem: imgThumb.superview, attribute: .topMargin, multiplier: 1, constant: 0)
        let widthConst = NSLayoutConstraint(item: imgThumb, attribute: .width, relatedBy: .equal, toItem: imgThumb.superview, attribute: .width, multiplier: 0.09375, constant: 0)
        imgThumb.superview?.addConstraints([leadingConst, topConst, widthConst])
        
        let heightConst = NSLayoutConstraint(item: imgThumb, attribute: .height, relatedBy: .equal, toItem: imgThumb, attribute: .width, multiplier: 1, constant: 0)
        self.imgThumb.addConstraints([heightConst])
    }
    
    func addTitleLabelConstraints() {
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConst = NSLayoutConstraint(item: lblTitle, attribute: .leading, relatedBy: .equal, toItem: imgThumb, attribute: .trailing, multiplier: 1, constant: 10)
        let topConst = NSLayoutConstraint(item: lblTitle, attribute: .top, relatedBy: .equal, toItem: lblTitle.superview, attribute: .topMargin, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: lblTitle.superview!, attribute: .trailingMargin, relatedBy: .equal, toItem: lblTitle, attribute: .trailing, multiplier: 1, constant: 0)
        lblTitle.superview?.addConstraints([leadingConst, topConst, trailingConst])
    }
    
    func addDescLabelConstraints() {
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConst = NSLayoutConstraint(item: lblDesc, attribute: .leading, relatedBy: .equal, toItem: imgThumb, attribute: .trailing, multiplier: 1, constant: 10)
        let topConst = NSLayoutConstraint(item: lblDesc, attribute: .top, relatedBy: .equal, toItem: lblTitle, attribute: .bottom, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: lblDesc.superview!, attribute: .trailingMargin, relatedBy: .equal, toItem: lblDesc, attribute: .trailing, multiplier: 1, constant: 0)
        lblDesc.superview?.addConstraints([leadingConst, topConst, trailingConst])
    }
    
    func addSepLabelConstraints() {
        lblSep.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConst = NSLayoutConstraint(item: lblSep, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)
        lblSep.addConstraints([heightConst])
        
        let leadingConst = NSLayoutConstraint(item: lblSep, attribute: .leading, relatedBy: .equal, toItem: lblSep.superview, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let topConst = NSLayoutConstraint(item: lblSep, attribute: .top, relatedBy: .equal, toItem: lblDesc, attribute: .bottom, multiplier: 1, constant: 5)
        let trailingConst = NSLayoutConstraint(item: lblSep.superview!, attribute: .trailingMargin, relatedBy: .equal, toItem: lblSep, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomConst = NSLayoutConstraint(item: lblSep.superview!, attribute: .bottomMargin, relatedBy: .equal, toItem: lblSep, attribute: .bottom, multiplier: 1, constant: -9)
        lblSep.superview?.addConstraints([leadingConst, topConst, trailingConst, bottomConst])
    }
    
    func addMinHeightConst() {
        minHeightConst = NSLayoutConstraint(item: self.contentView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (((Global.appDelegate.window?.bounds.size.width)! * 30) / 320) + 20)
        self.contentView.addConstraint(minHeightConst)
    }
    
    func changeMinHeightConstVal() {
        minHeightConst.constant = (((Global.appDelegate.window?.bounds.size.width)! * 30) / 320) + 20
        self.contentView.setNeedsLayout()
    }
}

//
//  MenuTableViewwCell.swift
//  TwitSearch
//
//  Created by student on 28.05.16.
//  Copyright © 2016 Владислав Навроцкий. All rights reserved.
//

import Foundation

class MenuTableViewCell: UITableViewCell {
    static let reuseID = "cell"
    
    var overlayView: UIView!
    
    var model: MenuItem? {
        didSet {
            onSetModel()
        }
    }
    
    var isCurrent: Bool = false {
        didSet {
            onSetCurrent()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        selectionStyle = .None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onSetModel() {
        if let menuItemParameters = model?.parameters()  {
            textLabel?.text = menuItemParameters.title
        }
    }
    
    func cleanUp() {
        textLabel?.text = ""
    }
    
    func onSetCurrent() {
        if isCurrent {
            overlayView.alpha = 0.3
        } else {
            overlayView.alpha = 0
        }
    }
}
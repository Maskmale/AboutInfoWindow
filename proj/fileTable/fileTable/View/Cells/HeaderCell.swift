//
//  HeaderCell.swift
//  fileTable
//
//  Created by Jz D on 2020/3/15.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa


class HeaderCell: NSTableCellView{
    
    
    @IBOutlet weak var img: NSImageView!
    
    
    @IBOutlet weak var arrow: NSImageView!
    
    
    
    
    
    func toggleImgHide(_ toHide: Bool){
        img.isHidden = toHide
        arrow.isHidden = true
        
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        
    }
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

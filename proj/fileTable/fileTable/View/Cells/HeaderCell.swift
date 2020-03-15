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
    
    
    func toggleImgHide(_ toHide: Bool){
        img.isHidden = toHide
   
        
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        
    }
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

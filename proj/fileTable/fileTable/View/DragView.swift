//
//  DragView.swift
//  fileTable
//
//  Created by Jz D on 2020/3/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

class DragView: NSView {

    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect.zero)
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        NSColor.green.setFill()
        dirtyRect.fill()
    }
    
}

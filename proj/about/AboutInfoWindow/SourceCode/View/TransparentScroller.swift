//
//  TransparentScroller.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

class TransparentScroller: NSScroller {

    override func draw(_ dirtyRect: NSRect) {
        self.drawKnob()
    }
    
}

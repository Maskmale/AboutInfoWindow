//
//  DragView.swift
//  fileTable
//
//  Created by Jz D on 2020/3/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

typealias ContentBundle = (title: String, contents: [String])



protocol DragViewProxy: class {
    func dragDone(by view: DragView, get items: ContentBundle)
}

class DragView: NSView {
    
    var dragAble = true

    private var dragEntered = false{
        didSet{
            needsDisplay = true
            
            
        }
    }
    
    var delegate: DragViewProxy?
    
    override init(frame frameRect: NSRect) {
        super.init(frame: NSRect.zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let fileRegister = NSPasteboard.PasteboardType.fileURL
        registerForDraggedTypes([fileRegister])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
        var bgColor = NSColor.windowBackgroundColor
        if dragEntered{
            bgColor = NSColor.lightGray
        }
        bgColor.setFill()
        dirtyRect.fill()
    }
}

extension DragView{
    //MARK:- Managing a Dragging Session Before an Image Is Released
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        dragEntered = true
        return NSDragOperation.copy
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        dragEntered = false
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        dragEntered = false
    }
    
    //MARK:- Managing a Dragging Session After an Image Is Released
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
       
        if let src = sender.draggingPasteboard.readObjects(forClasses:  [NSURL.self], options: nil)?.first as? URL {
            let properties: [URLResourceKey] = [ URLResourceKey.localizedNameKey, URLResourceKey.creationDateKey, URLResourceKey.localizedTypeDescriptionKey]
            
            do {
                let paths = try FileManager.default.contentsOfDirectory(at: src, includingPropertiesForKeys: properties, options: [FileManager.DirectoryEnumerationOptions.skipsHiddenFiles])
                
                let result: ContentBundle = (src.lastPathComponent, paths.map({$0.lastPathComponent}))
                
                delegate?.dragDone(by: self, get: result)
                
                return true
            } catch  {  }
            
        }
        return false
        

        
    }
}

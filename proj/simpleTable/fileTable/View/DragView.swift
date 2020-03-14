//
//  DragView.swift
//  fileTable
//
//  Created by Jz D on 2020/3/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

protocol DragViewProxy: class {
    func dragDone(by view: DragView, get items: [String])
}

class DragView: NSView {
    
    var dragAble = true

    private var dragEntered = false{
        didSet{
            needsDisplay = true
            NSUserDefaultsController.shared.setValue(dragEntered, forKey: UserDefaultK.entryLabelShow)
            
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
        let fetched = sender.draggingPasteboard.readObjects(forClasses:  [NSURL.self], options: nil)?
            .map({ (argv) -> String? in
                guard let url = argv as? URL else{
                    return nil
                }
                return url.path
            }).compactMap({$0})
            
        guard let result = fetched else{
            return false
        }
        // handle the result
        delegate?.dragDone(by: self, get: result)
        print(result)
        return true
    }
}

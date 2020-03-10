//
//  ViewController.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    lazy var aboutWindow = AboutWindowController(windowNibName: .about)
    
    
    
    
    var couldResize = false
    var willUseTextView = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let window = NSApplication.shared.windows.first{
            print(window.styleMask)
        }
      
        
        
        
    }
    
    
    
    
    
    
    @IBAction func showAboutWindow(_ sender: NSButton) {
        var mask:NSWindow.StyleMask = [.closable, .titled, .borderless]
        if couldResize{
            mask.insert(NSWindow.StyleMask.resizable)
        }
        aboutWindow.window?.styleMask = mask
        aboutWindow.appWebsiteURL = URL(string: "https://www.baidu.com")
        aboutWindow.useTextViewForAcknowledgments = willUseTextView
        aboutWindow.showWindow(nil)
    }
    
    
    
//MARK: - Resizable
    @IBAction func doResizable(_ sender: NSButton){
        couldResize.toggle()
    }
    
    
    @IBAction func useTextView(_ sender: NSButton){
        willUseTextView.toggle()
    }
    
    
    
    


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


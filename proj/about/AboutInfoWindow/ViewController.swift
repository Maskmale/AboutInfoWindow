//
//  ViewController.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let aboutWindow = AboutWindowController(windowNibName: .about)
    var couldResize = false
    var willUseTextView = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        // print values
 
        if let window = NSApplication.shared.windows.first{
            print(window.styleMask)
        }
        
        if let window = view.window{
            print(window.styleMask)
        }
        
        */
    }
    
    
    
    
    
    
    @IBAction func showAboutWindow(_ sender: NSButton) {
        
        var mask:NSWindow.StyleMask = [.closable, .titled, .borderless]
        /*
         // print values
         
        if let window = view.window{
            print(window.styleMask)
        }
         
        mask = [.closable]
        mask = [.titled]
        mask = [.borderless]
 
        */
        if couldResize{
            mask.insert(NSWindow.StyleMask.resizable)
        }
        print(mask)
        aboutWindow.window?.styleMask = mask
        aboutWindow.appWebsiteURL = URL.demo
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


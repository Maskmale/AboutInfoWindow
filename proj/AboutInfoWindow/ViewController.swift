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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
      
    }
    
    
    
    
    @IBAction func showAboutWindow(_ sender: NSButton) {
        aboutWindow.showWindow(nil)
    }
    
    
    
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


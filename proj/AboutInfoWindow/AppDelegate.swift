//
//  AppDelegate.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let status = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let customMenu = NSMenu()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        //设置应用图标
        NSApp.applicationIconImage = NSImage.init(named: "NSInfo")
        
        
        //设置点击状态图标时的响应事件
        
        status.button?.target = self
        status.button?.action = #selector(statusBarClicked(_:))
          
        //设置状态图标
        status.button?.image = NSImage.init(named: "NSInfo")
        
        //NSMenu
        customMenu.title = "Title"

        customMenu.addItem(withTitle: "退出", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q")
        status.menu = customMenu
            
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    @objc
    func statusBarClicked(_ sender:NSStatusItem){
        print("statusBarClicked")
    }
    

}


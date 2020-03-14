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

    // 维持生命周期
    let status = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let customMenu = NSMenu()

    
    let aboutWindow = AboutWindowController(windowNibName: .about)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        //设置应用图标
        NSApp.applicationIconImage = NSImage(named: "NSInfo")
        
        
        //设置点击状态图标时的响应事件
        
        status.button?.target = self
        status.button?.action = #selector(statusBarClicked(_:))
          
        //设置状态图标
        status.button?.image = NSImage.init(named: "NSInfo")
        
        //NSMenu
        customMenu.title = "Title"

        customMenu.addItem(withTitle: "退出", action: #selector(NSApp.terminate(_:)), keyEquivalent: "k")
        status.menu = customMenu
            
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    @objc
    func statusBarClicked(_ sender:NSStatusItem){
        print("statusBarClicked")
    }
    
    // 进入窗口
    @IBAction func enterAbout(_ sender: NSMenuItem) {
        
        let mask:NSWindow.StyleMask = [.closable, .titled, .borderless, .resizable]
        aboutWindow.window?.styleMask = mask
        aboutWindow.appWebsiteURL = URL.demo
        aboutWindow.showWindow(nil)
        
    }
    
    
    // 进入官网
    @IBAction func enterWeWeb(_ sender: NSMenuItem) {
        if let web = URL.demo{
            NSWorkspace.shared.open(web)
        }
    }
    
    

}


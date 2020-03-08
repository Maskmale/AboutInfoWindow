//
//  AboutWindowController.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa


/**
   *  The about window.
   */
class AboutWindowController: NSWindowController {
    
    

    /**
     *  应用名，The application name.
     *  Default: CFBundleName
     */
    let appName = BundleInfo.get.appName

    /**
     *  应用版本，The application version.
     *  Default: "Version %@ (Build %@)", CFBundleVersion, CFBundleShortVersionString
     */
    let appVersion = BundleInfo.get.appVersion
    /**
     *  应用版权，The copyright line.
     *  Default: NSHumanReadableCopyright
     */
    let appCopyright = BundleInfo.get.appCopyright

    /**
     *  应用信用: The credits.
     *  Default: contents of file at [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
     */
    let appCredits = BundleInfo.get.appCredits

    /**
     *  应用网址： The URL pointing to the app's website.
     *  Default: none
     */
    var appWebsiteURL: URL?

    /**
     *  感谢： The path to the file that contains the acknowledgments.
     *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
     */
    let acknowledgmentPath = BundleInfo.get.acknowledgmentPath
    let acknowledgment = BundleInfo.get.acknowledgment

    /**
     *  设置致谢文件的打开方式，打开文件，还是窗口内展示
     *  If set to YES acknowledgments are shown in a text view, inside the window. Otherwise an external editor is launched.
     *  Default: NO;
     */
    var useTextViewForAcknowledgments = false


    
    
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var versionLabel: NSTextField!
    @IBOutlet weak var copyrightLabel: NSTextField!
    
    
    
    
    
    var activeView: NSView?
    

    
    @IBOutlet weak var placeHolderView: NSView!
    @IBOutlet weak var visitWebsiteButton: NSButton!
    @IBOutlet weak var acknowledgmentsButton: NSButton!
    
    
    @IBOutlet var infoView: NSView!
    
    
    
    @IBOutlet var acknowledgmentsView: NSView!
    @IBOutlet weak var acknowlesgeScroll: NSScrollView!
    
    
    
    @IBOutlet var acknowlesgeTextView: NSTextView!
    @IBOutlet var creditTextView: NSTextView!
    

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        nameLabel.stringValue = appName
        versionLabel.stringValue = appVersion
        copyrightLabel.stringValue = appCopyright
        
        if let textView = acknowlesgeScroll.documentView as? NSTextView{
            textView.textStorage?.append(acknowledgment)
        }
        
        
        // Disable editing
        
        // Somehow IB checkboxes are not working
        creditTextView.isEditable = false
        
        // Somehow IB checkboxes are not working
        acknowlesgeTextView.isEditable = false
    }
    
    
    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
        showView(infoView)
    }
    
    
    
    
//MARK:- Interface Methods
    /**
     *  Visit the website.
     *
     *  @param sender The object making the call.
     */
    
    @IBAction func visitWebsite(_ sender: NSButton) {
        if let web = appWebsiteURL{
            NSWorkspace.shared.open(web)
        }
        else{
            print("出错了: please set the appWebsiteURL property on the about window");
        }
    }
    

    
      /**
        *  Show acknowledgments for libraries used etc.
        *
        *  @param sender The object making the call.
        */
    @IBAction func showAcknowledgments(_ sender: NSButton) {
        
        if useTextViewForAcknowledgments{
            // Toggle between the infoView and the acknowledgmentsView
            if activeView == infoView{
                showView(acknowledgmentsView)
                acknowledgmentsButton.title = "信用"
            }
            else{
                showView(infoView)
                acknowledgmentsButton.title = "致谢"
            }
        }
        else{
            // Load in default editor
            NSWorkspace.shared.openFile(acknowledgmentPath)
        }
    }
 
    
//MARK:-  - Private Methods
    

    func showView(_ theView: NSView){
        // Exit early if the view is the same
        guard theView != activeView else{
            return
        }
        
        // Remove the active view from the place holder
        activeView?.removeFromSuperview()
        
        // Resize view to fit
        theView.autoresizingMask = [.height, .width]
        theView.frame = placeHolderView.bounds;
        
        // Add to placeholder
        placeHolderView.addSubview(theView)

        // Enable layer backing and change the background color
        theView.wantsLayer = true
        theView.layer?.backgroundColor = NSColor.white.cgColor
        
        // Add bottom border
        let bottomBorder = CALayer()
        bottomBorder.borderColor = NSColor.gray.cgColor
        bottomBorder.borderWidth = 1;
        bottomBorder.frame = CGRect(x: -1, y: 0, width: theView.frame.width + 2, height: theView.frame.height + 1)
        bottomBorder.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        theView.layer?.addSublayer(bottomBorder)
        
        // Set active view
        self.activeView = theView;
    }
        
        
    
}

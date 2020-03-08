//
//  BundleInfo.swift
//  AboutInfoWindow
//
//  Created by Jz D on 2020/3/8.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Foundation


struct BundleInfo {
    static let get = BundleInfo()
    
    let appName: String
    let appVersion: String
    let appCopyright: String
    
    let acknowledgmentsPath: String
    let appCredits: NSAttributedString
    
    init() {
        var name = ""
        var version = ""
        var copyright = ""
        
        var acknowledgment = ""
        var credit = NSAttributedString(string: "Nothing")
        
        // Load variables
        if let bundleDict = Bundle.main.infoDictionary {
              // Set app name
              if let n = bundleDict["CFBundleName"] as? String{
                  name = n
              }
            
              // Set app version
              if let versionDefault = bundleDict["CFBundleVersion"] as? String, let short = bundleDict["CFBundleShortVersionString"] as? String{
                  version = "Version \(short) (Build \(versionDefault), displayed in the about window"
              }
            
              // Set copyright
              if let right = bundleDict["NSHumanReadableCopyright"] as? String{
                  copyright = right
              }
            
              // Set acknowledgments
              if let acknowledge = Bundle.main.path(forResource: "Acknowledgments", ofType: "rtf"){
                  acknowledgment = acknowledge
              }
            
              // Set credits
              if let creditInfo = Bundle.main.path(forResource: "Credits", ofType: "rtf"), let path = URL(string: creditInfo){
                  do {
                      credit = try NSAttributedString(url: path, options: [:], documentAttributes: nil)
                  } catch let error as NSError {
                      print(error.debugDescription)
                  }
              }
        }
        
        appName = name
        appVersion = version
        appCopyright = copyright
  
        acknowledgmentsPath = acknowledgment
        appCredits = credit
    }
}

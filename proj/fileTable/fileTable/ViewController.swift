//
//  ViewController.swift
//  fileTable
//
//  Created by Jz D on 2020/3/14.
//  Copyright © 2020 Jz D. All rights reserved.
//
 
import Cocoa

class ViewController: NSViewController {

    
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var dragView: DragView!
    
    
    
    let tbProxy = TableProxy()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = tbProxy
        tableView.dataSource = tbProxy
        dragView.delegate = self
        
        
        tableView.reloadData()
    }
    
    
    
    @IBAction func btnRevealInFinderSelected(_ sender: NSButton) {
        let row = tableView.row(for: sender)
        for argv in tbProxy.data.files{
            let (index, src) = argv
            if index == row - 1 {
                NSWorkspace.shared.open(src)
                return
            }
        }
        
        for argv in tbProxy.data.dirs{
            let (index, src) = argv
            // 因为有 header
            if index == row - 1{
                NSWorkspace.shared.open(src)
                return
            }
        }
        
    }
    
    
    
    
    
    @IBAction func removeRowSelected(_ sender: NSButton) {
        let row = tableView.row(for: sender)
        tableView.beginUpdates()
        tbProxy.remove(row: row)
        tableView.removeRows(at: [row], withAnimation: NSTableView.AnimationOptions.effectFade)
        tableView.endUpdates()
    }
    
    
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}




extension ViewController: DragViewProxy{
    
    func dragDone(by view: DragView, get info: ContentBundle) {
        
        tbProxy.update(content: info)
        tableView.reloadData()
        
    }
    
    
}

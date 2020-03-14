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
    
    let tbProxy = TableProxy()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = tbProxy
        tableView.dataSource = tbProxy
        tableView.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

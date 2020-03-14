//
//  TableDataSource.swift
//  fileTable
//
//  Created by Jz D on 2020/3/15.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa



//MARK: - NSTableViewSectionDataSource

protocol TableSectionDataSource: NSTableViewDataSource {
    func numberOfSectionsInTable(tb: NSTableView) -> Int
    func table(tb: NSTableView, numberOfRowsInSection section: Int) -> Int
    func tableProxySectionAndRow(tb: NSTableView, transformedBy stdRowIdx: Int) -> (section: Int, row: Int)
}



//MARK: - TableSectionDelegate

protocol TableSectionDelegate: NSTableViewDelegate {
    func table(tb: NSTableView, headerForSection section: Int) -> NSView?
}



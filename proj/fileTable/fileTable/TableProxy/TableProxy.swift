//
//  TableDelegate.swift
//  fileTable
//
//  Created by Jz D on 2020/3/15.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa


enum Section{
    case empty
    case title(String)

    var name:String {
        switch self {
        case .empty:
            return "啥也没有"
        case .title(let headline):
            return headline
        }
    }
}


struct TbData{
    var headerTitle = Section.empty
    var files = [ContentInfo]()
    var dirs = [ContentInfo]()
    
    var title: String{
        headerTitle.name
    }
}





class TableProxy: NSObject, TableSectionDelegate, TableSectionDataSource{
    
    
    
    
    var data = TbData()
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if let dataSource = tableView.dataSource as? TableSectionDataSource {
            var (section, sectionRow) = dataSource.tableProxySectionAndRow(tb: tableView, transformedBy: row)
            if let headerView = table(tb: tableView, headerForSection: section) as? NSTableCellView{
                if sectionRow == 0 {
                    headerView.textField?.stringValue = data.title
                    return headerView
                } else {
                    sectionRow -= 1
                }
            }
            
            for argv in data.files{
                let (index, title) = argv
                if index == sectionRow {
                    let cell = tableView.makeView(withIdentifier: .contentFile, owner: self) as! NSTableCellView
                    cell.textField?.stringValue = title
                    return cell
                }
            }
            
            for argv in data.dirs{
                let (index, title) = argv
                if index == sectionRow {
                    let cell = tableView.makeView(withIdentifier: .contentFolder, owner: self) as! NSTableCellView
                    cell.textField?.stringValue = title
                    return cell
                }
            }
            
        }
        return nil
    }
    
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        var height = CGFloat.zero
        if let dataSource = tableView.dataSource as? TableSectionDataSource {
            let (section, sectionRow) = dataSource.tableProxySectionAndRow(tb: tableView, transformedBy: row)
            if let _ = table(tb: tableView, headerForSection: section), sectionRow == 0{
                height = 55
            }
            else{
                height = 40
            }
        }
        return height
    }
    
    
    

    func table(tb: NSTableView, headerForSection section: Int) -> NSView? {
        let sectionView = tb.makeView(withIdentifier: .header, owner: self) as! HeaderCell
        var toHide = false
        switch data.headerTitle {
        case .empty:
            toHide = true
        default:
            ()
        }
        sectionView.toggleImgHide(toHide)
        return sectionView
    }

    
// 1
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        var total = 0
        
        if let dataSource = tableView.dataSource as? TableSectionDataSource {
            for section in 0..<dataSource.numberOfSectionsInTable(tb: tableView) {
                total += dataSource.table(tb: tableView, numberOfRowsInSection: section)
            }
        }
        
        return total
        
    }
    
    // -1
    func numberOfSectionsInTable(tb: NSTableView) -> Int {
        return 1
    }
    
    
    // 0
    func table(tb: NSTableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if table(tb: tb, headerForSection: section) != nil {
            count = 1
        }
        count += data.dirs.count
        count += data.files.count
        return count
    }

    func tableProxySectionAndRow(tb: NSTableView, transformedBy stdRowIdx: Int) -> (section: Int, row: Int) {
        if let dataSource = tb.dataSource as? TableSectionDataSource {
            let numberOfSections = dataSource.numberOfSectionsInTable(tb: tb)
            var totalSectionInfo = [Int](repeating: 0, count: numberOfSections)
            
            for section in 0..<numberOfSections {
                totalSectionInfo[section] = dataSource.table(tb: tb, numberOfRowsInSection: section)
            }
            
            let result = transfrom(fromSystem: stdRowIdx, with: totalSectionInfo)
            return (section: result.section, row: result.row)
        }

        assertionFailure("Invalid datasource")
        return (section: 0, row: 0)
    }
    
}





extension TableProxy{
    private func transfrom(fromSystem row: Int, with totalInfo: [Int]) -> (section: Int, row: Int) {
        var ceil = 0
        for section in 0..<totalInfo.count {
            let floor = ceil
            ceil += totalInfo[section]
            if row >= floor, row < ceil {
                return (section: section, row: row - floor)
            }
        }
        return (section: 0, row: 0)
    }
}



extension TableProxy{

    func update(content info: ContentBundle){
        data.headerTitle = .title(info.title)
        data.dirs = info.folders
        data.files = info.files
    }


}

//
//  File.swift
//  DATASOURCE6789
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
class Datanumber: NSObject, UITableViewDataSource {
    
    var masterTableView: MasterTableViewController!
    var arrayNumber = [Int](1...3)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrayNumber[indexPath.row])
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNumber.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterTableView.hasNodata = (arrayNumber.count == 0)
        } else if editingStyle == .insert {
            
        }
    }

}


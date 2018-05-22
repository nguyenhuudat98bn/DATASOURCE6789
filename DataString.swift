//
//  File.swift
//  DATASOURCE6789
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
class Datastring: NSObject ,UITableViewDataSource {
    
    var masterTableView: MasterTableViewController!
    var arrayString = ["mot","hai","ba"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrayString[indexPath.row])
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterTableView.hasNodata = (arrayString.count == 0)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
}


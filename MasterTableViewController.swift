//
//  MasterViewController.swift
//  DATASOURCE6789
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    
    @IBOutlet weak var switchItem: UISwitch!
    @IBOutlet weak var nodata : UIView!
    @IBOutlet weak var foodter : UIView!
    
    var hasNodata : Bool = false {
        didSet {
            hasNodata ? (tableView.tableFooterView = nodata ) : (tableView.tableFooterView = foodter )
        }
    }
    
    var dataSourceNumber = Datanumber()
    var dataSourceString = Datastring()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSourceNumber
        dataSourceNumber.masterTableView = self
        dataSourceString.masterTableView = self
    }
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        switchItem.isOn ? (hasNodata = (dataSourceNumber.arrayNumber.count == 0)) : (hasNodata = dataSourceString.arrayString.count == 0)

    }
    
    @IBAction func nameSwitch ( _ sender : UISwitch) {
        sender.isOn ? (tableView.dataSource = dataSourceNumber ) : (tableView.dataSource = dataSourceString )
        tableView.reloadData()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            guard let detailViewController = segue.destination as? DetailViewcontroller else {return}
            
            guard let index = tableView.indexPathForSelectedRow else {return}
            switchItem.isOn ? (detailViewController.name = String(dataSourceNumber.arrayNumber[index.row])) : (detailViewController.name = dataSourceString.arrayString[index.row])
        }
    }
    
    // Use data from the view controller which initiated the unwind segue
    @IBAction func unwindTo(_ sender: UIStoryboardSegue) {
        if let detailViewController = sender.source as? DetailViewcontroller {
            if let indexpath = tableView.indexPathForSelectedRow{
                switchItem.isOn ? (dataSourceNumber.arrayNumber[indexpath.row] = Int(detailViewController.name ?? "") ?? 0) : (dataSourceString.arrayString[indexpath.row] = detailViewController.name ?? "")
            } else {
                switchItem.isOn ? (dataSourceNumber.arrayNumber.append(Int(detailViewController.name ?? "") ?? 0)) : (dataSourceString.arrayString.append(detailViewController.name ?? ""))
            }
            }
        tableView.reloadData()
        }

    }


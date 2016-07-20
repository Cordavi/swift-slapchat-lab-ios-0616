//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
   
   let dataStore = DataStore.sharedDataStore
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      dataStore.fetchData()
      
      if dataStore.messages.isEmpty {
         dataStore.generateTestData()
      }
   }
   
   override func viewDidAppear(animated: Bool) {
      super.viewDidAppear(true)
      dataStore.fetchData()
      tableView.reloadData()
   }
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return dataStore.messages.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let newCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
      
      newCell.textLabel?.text = dataStore.messages[indexPath.row].content
      return newCell
   }
}

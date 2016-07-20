//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Michael Amundsen on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddMessageViewController: UIViewController {
   
   let dataStore = DataStore.sharedDataStore
   
   @IBOutlet weak var textField: UITextField!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }

   @IBAction func savedTapped(sender: AnyObject) {
      
      let messageToSave = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: dataStore.managedObjectContext) as! Message
      
      messageToSave.content = textField.text
      messageToSave.createdAt = NSDate()
      dataStore.saveContext()
      dismissViewControllerAnimated(true, completion: nil)
   }

}

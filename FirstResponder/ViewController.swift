//
//  ViewController.swift
//  FirstResponder
//
//  Created by Akshay Sripada on 4/6/18.
//  Copyright © 2018 Akshay Tracy Co. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var refHousehold: DatabaseReference!
    
    @IBOutlet weak var tableHousehold: UITableView!
    
    var householdList = [HouseholdModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return householdList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the artist object
        let household: HouseholdModel
        
        //getting the artist of selected position
        household = householdList[indexPath.row]
        
        //adding values to labels
        cell.labelName.text = household.name
        cell.labelPhone.text = household.phone
        cell.labelAddress.text = household.address
        cell.labelMatch.text = household.match
        
        //returning cell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirebaseApp.configure()
        
        refHousehold = Database.database().reference().child("Household");
        
        //observing the data changes
        refHousehold.observe(DataEventType.value, with: { (snapshot) in
            
        //if the reference have some values
        if snapshot.childrenCount > 0 {
            
            //clearing the list
            self.householdList.removeAll()
            
            //iterating through all the values
            for households in snapshot.children.allObjects as! [DataSnapshot] {
                //getting values
                let householdObject = households.value as? [String: AnyObject]
                let name  = householdObject?["Name"]
                let id  = householdObject?["id"]
                let phone = householdObject?["Phone"]
                let address = householdObject?["Address"]
                let city = householdObject?["City"]
                let zip = householdObject?["Zip"]
                let match = householdObject?["Match"]
                
                //creating household object with model and fetched values
                let household = HouseholdModel(id: id as! String?, name: name as! String?, phone: phone as! String?, address: address as! String?, city: city as! String?, zip: zip as! String?, match: match as! String?)
                
                self.householdList.append(household)
        }
            
            //reloading the tableview
            self.tableHousehold.reloadData()
        }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


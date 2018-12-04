//
//  HairListTableViewController.swift
//  DIY Hair
//
//  Created by jiang on 2018/12/4.
//  Copyright © 2018年 blueGrey. All rights reserved.
//

import UIKit
import os.log

class HairListTableViewController: UITableViewController {

    //MARK: Properties
    var hairLists = [HairDetails]()
    var myimage:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        let  query=AVQuery(className: "HairstyleStore")
        query.whereKey("type", equalTo: "11")
        let temp=query.findObjects() as! [AVObject]
        if(temp.count>0)
        {
            for i in 0..<temp.count
            {
                let name=temp[i]["name"]
                print("******************/(name)")
                let score=temp[i]["score"]
                let U=temp[i]["image"] as! AVFile
                myimage=UIImage(data: U.getData()!)
                loadhairList(photo: myimage!,name: name as! String,scroe: score as! Int)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hairLists.count
    }
    private func  loadhairList(photo:UIImage,name:String,scroe:Int) {
        guard let  hairList1=HairDetails(name: name, photo: photo, rating: scroe/2) else {
            fatalError("Unable to instantiate meal1")
        }
        hairLists.append(hairList1)
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HairTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HairListTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let hair = hairLists[indexPath.row]
        
        cell.nameLabel.text = hair.name
        cell.photoImageView.image = hair.photo
        cell.ratingControl.rating = hair.rating
        
        return cell
    }

 
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            if #available(iOS 10.0, *) {
                os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            
        case "ShowDetail":
            guard let HairdDetailController = segue.destination as? HairdDetailController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? HairListTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMeal = hairLists[indexPath.row]
            HairdDetailController.hair = selectedMeal
            
        default:
            fatalError("Unexpected Segue Identifier;")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            hairLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    @IBAction func unwindToHairList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? HairdDetailController, let hair = sourceViewController.hair {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: hairLists.count, section: 0)
            
            hairLists.append(hair)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}

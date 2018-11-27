//
//  ViewController.swift
//  EventManagement
//
//  Created by สรรพวัศ ซิ่วสุวรรณ on 5/11/2561 BE.
//  Copyright © 2561 สรรพวัศ ซิ่วสุวรรณ. All rights reserved.
//

import UIKit
import Alamofire


var myIndex = 0
var eventID = 0
var eachEvent: [String: Any] = [String: Any]()

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    var event:[[String: Any]] = [[String: Any]]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(event.count)
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        eachEvent = self.event[indexPath.row]
        
        cell.eventName.text = eachEvent["EventName"] as? String
        cell.eventDateTime.text = eachEvent["Date"] as? String
        cell.eventPlace.text = eachEvent["Place"] as? String
        
        if let url = NSURL(string: eachEvent["Image"] as? String ?? ""){
            if let data = NSData(contentsOf: url as URL){
                cell.eventImage.contentMode = .scaleAspectFill
                cell.eventImage.image = UIImage(data: data as Data)
            }
        }
        print("Checked")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section)")
        print("Row: \(indexPath.row)")
        myIndex = indexPath.row
        eventID = event[indexPath.row]["EventID"] as! Int
        performSegue(withIdentifier: "segue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.rowHeight = 150
        
        Alamofire.request("http://yongevent.azurewebsites.net/eventdata/allevents", method: .get).responseJSON{ (response) in
            if let responseValue = response.result.value as! [[String: Any]]?{
                print(responseValue)
                self.event = responseValue
                self.myTableView.reloadData()
            }
            
        }
        
    }


}


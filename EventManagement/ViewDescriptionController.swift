//
//  ViewDescriptionController.swift
//  EventManagement
//
//  Created by สรรพวัศ ซิ่วสุวรรณ on 7/11/2561 BE.
//  Copyright © 2561 สรรพวัศ ซิ่วสุวรรณ. All rights reserved.
//

import UIKit
import Alamofire

class ViewDescriptionController: UIViewController {

    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDateTime: UILabel!
    @IBOutlet weak var eventPlace: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventOrganizer: UILabel!
    @IBOutlet weak var eventTermCondition: UILabel!
    @IBOutlet weak var eventContact: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://yongevent.azurewebsites.net/eventdata/details/\(eventID)").responseJSON{(response) in
            if let responseValue = response.result.value as! [[String: Any]]?{
                print(responseValue)
                self.eventName.text = responseValue[0]["EventName"] as? String
                self.eventDateTime.text = responseValue[0]["Date"] as? String
                self.eventPlace.text = responseValue[0]["Place"] as? String
                if let url = NSURL(string: responseValue[0]["Image"] as? String ?? ""){
                    if let data = NSData(contentsOf: url as URL){
                        self.eventImage.contentMode = .scaleAspectFit
                        self.eventImage.image=UIImage(data: data as Data)
                    }
                }
                self.eventDescription.text = responseValue[0]["Description"] as? String
                self.eventOrganizer.text = responseValue[0]["Organizer"] as? String
                self.eventTermCondition.text = responseValue[0]["TermAndCondition"] as? String
                self.eventContact.text = responseValue[0]["Contact"] as? String
            }
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

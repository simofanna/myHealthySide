//
//  SignOutViewController.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 09..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import UIKit
import Firebase

class SignOutVC: UIViewController {

    @IBOutlet weak var actualDateField: UILabel!
    @IBOutlet weak var helloUserField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // notifications
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
        
        
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        helloUserField.text = "Hello\(username)"
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let result = formatter.string(from: date)
        actualDateField.text = "Today: \(result)"
        
    }
    
    @objc func showProfile(){
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    @objc func showSettings(){
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
   
    
    

    @IBAction func whenLogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch  {
            print(error)
        }
    }
    
   
    
    @IBAction func onTapped(){
        print("Toggle side menu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"),object: nil)
    }
    
    
    
    
    
    
}

//
//  SignUpVController.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 09..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
    }
    
    // if username, password, email arent empty, then we can move forward ("guard" keyword)
    @IBAction func whenSignUpClicked(_ sender: Any) {
        guard let username = userNameTextField.text,
            username != "",
            let email = emailTextField.text,
            email != "",
            let password = passwordTextField.text,
            password != ""
            else {
                AlertController.showAlert(self, title: "missing info", message: "please fill the fields")
                return
        }
        //FireBaseAuth
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // if this statement not true -> errorok száma nulla de itt van error akkor ez fut le
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
                
            })
            
        }
        
        
    }
}

//
//  SignInViewController.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 09..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
    }
    

    @IBAction func whenSignInClicked(_ sender: Any) {
        
        guard let email = emailTextField.text,
        email != "",
        let password = passwordTextField.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all required fields")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING NAME")
            print(user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
}

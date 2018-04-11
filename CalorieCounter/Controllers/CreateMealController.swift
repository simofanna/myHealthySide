//
//  CreateMealController.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 10..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CreateMealController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var kcalTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    @IBOutlet weak var carbohydrateTextField: UITextField!
    
    @IBAction func whenSaveButtonClicked(_ sender: Any) {
        
        guard let name = nameTextField.text,
            name != "",
        let gram = gramTextField.text,
            gram != "",
        let kcal = kcalTextField.text,
            kcal != "",
        let protein = proteinTextField.text,
            protein != "",
        let fat = fatTextField.text,
            fat != "",
        let carbohydrate = carbohydrateTextField.text,
            carbohydrate != "" else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all the required fields")
                return
        }
       
      //  DatabaseService.shared.mealsReference.childByAutoId().setValue(["user":  Auth.auth().currentUser?.displayName,"name": name, "gram": gram, "kcal": kcal, "protein":protein, "fat": fat, "carbohydrate": carbohydrate])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        ref = Database.database().reference()
        
    }

  

}

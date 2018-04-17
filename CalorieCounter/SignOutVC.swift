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
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // list all the meals in the database
        DatabaseService.shared.mealsReference.observe(DataEventType.value, with: { (DataSnapshot) in
            print(DataSnapshot)
            guard let mealsSnapShot = MealsSnapshot(with: DataSnapshot) else { return }
            self.meals = mealsSnapShot.meals
            self.meals.sort(by: { $0.date.compare($1.date) == .orderedDescending })
            self.tableView.reloadData()
            self.tableView.dataSource = self
            
            })
        
        guard let username = Auth.auth().currentUser?.displayName else { return }
        helloUserField.text = "Hello \(username)"
    
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let result = formatter.string(from: date)
        actualDateField.text = "Today: \(result)"
        
    }

    @IBAction func whenLogOutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch  {
            print(error)
        }
    }
    
    @IBAction func whenAddTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add meal", message: "What kind of meal you want to add", preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "Meal name"
        }
        alert.addTextField{ (textField01) in
            textField01.placeholder = "Kcal value (100g)"
        }
        alert.addTextField{ (textField02) in
            textField02.placeholder = "Protein value (100g)"
        }
        alert.addTextField{ (textField03) in
            textField03.placeholder = "Fat value (100g)"
        }
        alert.addTextField{ (textField04) in
            textField04.placeholder = "Carbohidrate value (100g)"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textForName = alert.textFields?.first?.text else {return}
            guard let textForKcal = alert.textFields![1].text else {return}
             guard let textForProtein = alert.textFields![2].text else {return}
             guard let textForFat = alert.textFields![3].text else {return}
             guard let textForCarbohydrate = alert.textFields![4].text else {return}

            print ("adatok \(textForName,textForKcal,textForFat,textForProtein,textForCarbohydrate)")
            
            let dateString = String(describing: Date())
            let parameters = ["username": Auth.auth().currentUser?.displayName,
                              "name"             : textForName,
                              "kcalValue"        : textForKcal,
                              "proteinValue"     : textForProtein,
                              "fatValue"         : textForFat,
                              "carbohydrateValue": textForCarbohydrate,
                              "date"             : dateString]
            
        DatabaseService.shared.mealsReference.childByAutoId().setValue(parameters) // generate random id for my meals
            
        }
        alert.addAction(cancel)
        alert.addAction(save)
        present(alert, animated: true, completion: nil)

    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
}
extension SignOutVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return meals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = meals[indexPath.row].name
        cell.detailTextLabel?.text = meals[indexPath.row].kcalValue
        return cell
    }
}

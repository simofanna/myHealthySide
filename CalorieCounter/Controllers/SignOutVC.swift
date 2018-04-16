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
        alert.addTextField{ (textField) in
            textField.placeholder = "Kcal value (g)"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Protein value (g)"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Carbogydrate value (g)"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Fat value (g)"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {return}
            print (text)
        }
        alert.addAction(cancel)
        alert.addAction(save)
        present(alert, animated: true, completion: nil)

    }
    
    @IBOutlet weak var tableView: UITableView!
    let meals = [Meals]()
    
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
        cell.textLabel?.text = meals[indexPath.row].name // meals name
        //cell.detailTextLabel?.text = meals[indexPath.row].convertDateIntoString()
        return cell
    }
}

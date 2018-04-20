//
//  Meals.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 16..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import Foundation
import Firebase

//TODO status create enum

struct Meal {
    let mealId: String
    let username: String
    let name: String
    let kcalValue: String
    let proteinValue: String
    let fatValue: String
    let carbohydrateValue: String
    let date: Date

    
    init?(mealId:String, dict: [String: Any]){
        self.mealId = mealId
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        guard let username = dict["username"] as? String,
        let name = dict["name"]as? String,
        let kcalValue = dict["kcalValue"] as? String,
        let proteinValue = dict["proteinValue"] as? String,
        let fatValue = dict["fatValue"] as? String,
        let carbohydrateValue = dict["carbohydrateValue"] as? String,
        let dateString = dict["date"] as? String,
        let date = formatter.date(from: dateString)
            else { return nil }
        
        self.username = username
        self.name = name
        self.kcalValue = kcalValue
        self.proteinValue = proteinValue
        self.fatValue = fatValue
        self.carbohydrateValue = carbohydrateValue
        self.date = date
        
        
        }
    }



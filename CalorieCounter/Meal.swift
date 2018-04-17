//
//  Meals.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 16..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import Foundation
import Firebase


struct Meal {
    let mealId: String
    let username: String
    let name: String
    let kcalValue: Int
    let proteinValue: Int
    let fatValue: Int
    let carbohydrateValue: Int
    let date: Date
    
    init?(mealId:String, dict: [String: Any]){
        self.mealId = mealId
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        guard let username = dict["username"] as? String,
        let name = dict["name"]as? String,
        let kcalValue = dict["kcalValue"] as? Int,
        let proteinValue = dict["proteinValue"] as? Int,
        let fatValue = dict["fatValue"] as? Int,
        let carbohydrateValue = dict["carbohydrateValue"] as? Int,
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



//
//  MealsSnapshot.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 16..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import Foundation
import Firebase

struct MealsSnapshot {
    
    let meals: [Meal]
    
    init?(with snapshot: DataSnapshot){
        var meals = [Meal]()
        // String: [String:Any]
        guard let snapDict = snapshot.value as? [String: [String: Any]] else { return nil }
        for snap in snapDict {
            guard let meal = Meal(mealId:snap.key, dict: snap.value) else { continue}
            meals.append(meal)
        }
        self.meals = meals
        
    }
}

//
//  Database.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 16..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService {
    
    static let shared = DatabaseService()
    private init() {}
    
    
    let mealsReference = Database.database().reference().child("meals")
    let waterReference = Database.database().reference().child("water")
    
}

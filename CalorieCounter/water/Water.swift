//
//  Water.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 18..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import Foundation

struct Water {
    let username: String
    let waterId: String
    let quantity: String
    let date: Date
    
    init?(waterId:String, dict: [String: Any]){
        self.waterId = waterId
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        guard let username = dict["username"] as? String,
            let quantity = dict["quantity"]as? String,
            let dateString = dict["date"] as? String,
            let date = formatter.date(from: dateString)
            else { return nil }
        
        self.quantity = quantity
        self.date = date
        self.username = username
        
    
}
}

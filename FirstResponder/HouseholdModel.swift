//
//  HouseholdModel.swift
//  FirstResponder
//
//  Created by Akshay Sripada on 4/6/18.
//  Copyright © 2018 Akshay Tracy Co. All rights reserved.
//

class HouseholdModel {
    
    var id: String?
    var name: String?
    var phone: String?
    var address: String?
    var city: String?
    var zip: String?
    var match: String?
    
    
    init(id: String?, name: String?, phone: String?, address: String?, city: String?, zip: String?, match: String?){
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
        self.city = city
        self.zip = zip
        self.match = match
    }
}

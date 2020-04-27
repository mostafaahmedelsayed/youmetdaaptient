//
//  File.swift
//  careMatePatient
//
//  Created by khabeer on 4/24/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import ObjectMapper
class AvailableDoctorSlots: Mappable {
    

    var QueueNumber = 0
    
    
    var fromTime = ""
    
    var ArabicfromTime = ""
    
    var date = ""
    var ShiftId = 0
    
    
    var start = ""
    
    var status = ""
    
    var toTime = ""
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        
        self.QueueNumber <- map["QueueNumber"]
        self.fromTime <- map["fromTime"]
        self.ArabicfromTime <- map["ArabicfromTime"]
        self.date <- map["date"]
        self.ShiftId <- map["ShiftId"]
        
        
        
        self.start <- map["start"]
        self.status <- map["status"]
        self.toTime <- map["toTime"]
        
        
        
    }
}

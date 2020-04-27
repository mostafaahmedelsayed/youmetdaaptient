//
//  otherPersonsModel.swift
//  careMatePatient
//
//  Created by khabeer on 4/25/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation

import ObjectMapper
class otherPersonsModel: Mappable {
     

    
    
    var OnlinePatient = 0
    var OnlinePatientId = 0
    var Name = ""
    var  Phone = ""
    var Id = 0
    var CreationDate = ""
    var LastUpdateDate: String = ""
    var IsDeleted = true

    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.OnlinePatient <- map["OnlinePatient"]

        self.OnlinePatientId <- map["OnlinePatientId"]
        self.Name  <- map["Name"]
        self.Phone <- map["Phone"]
        self.Id <- map["Id"]
        self.CreationDate <- map["CreationDate"]

        self.LastUpdateDate <- map["LastUpdateDate"]
        self.IsDeleted <- map["IsDeleted"]
    

    }
}









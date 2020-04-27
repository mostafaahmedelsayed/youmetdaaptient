//
//  governmentsModel.swift
//  careMatePatient
//
//  Created by khabeer on 4/19/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation

import ObjectMapper


class governmentsModel: Mappable {
     
    

    
    var   id = 0
    var ArabicName = ""
    var EnglishName = ""
    var  Lat = ""
    var Lng = ""
    var pages_count: Int = 0
    
    var rnum: Int = 0

   
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
        self.pages_count <- map["pages_count"]
        
        self.Lat <- map["pages_count"]


        self.Lng <- map["pages_count"]
        
        self.rnum <- map["rnum"]


    }
}
